import cerealed;
import requests;
import std.stdio;
import std.json;
import std.conv : to;
import std.array : replace, split;
import std.datetime.systime;
import core.time : seconds;
import std.format : format;
import std.file : read, write;
import std.traits : hasMember, isAggregateType, isAssociativeArray, fullyQualifiedName, isArray;
import std.meta : AliasSeq, Filter;
import std.range.primitives : ElementType;
import std.typecons : Nullable;

enum string TOKEN_URI = "https://oauth2.googleapis.com/token";
enum string DRIVE_URI = "https://www.googleapis.com/drive/v3/files";
enum string GOOGLE_API_OAUTH_AUTH = "https://accounts.google.com/o/oauth2/v2/auth";
enum string DRIVE_SCOPE = "https://www.googleapis.com/auth/drive";

enum string AUTHORIZE_STRING = "%s?code=%s&client_id=%s&client_secret=%s&" ~
	"redirect_uri=%s&grant_type=authorization_code";
enum string REFRESH_TOKEN_STRING = "%s?client_id=%s&client_secret=%s&" ~
	"refresh_token=%s&grant_type=refresh_token";
enum string CODE_STRING = "%s?scope=%s&redirect_uri=%s&client_id=%s&" ~
	"access_type=offline&response_type=code&include_granted_scopes=true&prompt=consent";

class Client {
	private string clientId;
	private string clientSecret;
	string clientCode;
	private string redirectUri;
	private string driveScope;
	private string accessTokenFile;

	this(string clientSecretFile) {
		import std.file : readText, exists;

		string clientSecretText;
		JSONValue clientSecretJson;

		assert(clientSecretFile.exists, "Credentials file does not exist.");

		clientSecretText = readText(clientSecretFile);
		clientSecretJson = parseJSON(clientSecretText);

		this.clientId = clientSecretJson["web"]["client_id"].toString[1 .. $ - 1];
		this.clientSecret = clientSecretJson["web"]["client_secret"].toString[1 .. $ - 1];
		this.redirectUri = clientSecretJson["web"]["redirect_uris"][0]
							.toString(JSONOptions.doNotEscapeSlashes)[1 .. $ - 1];
		this.accessTokenFile = "access_token.pickle";

		if (!accessTokenFile.exists) {
			this.authorize();
		}
	}

	string getCode(ushort port) {
    import std.socket : TcpSocket, Socket, InternetAddress;

    string code = "";
    Socket reads = null;
    auto listener = new TcpSocket();
    assert(listener.isAlive);

    listener.bind(new InternetAddress(port));
    listener.listen(10);

    reads = listener.accept();
    assert(reads.isAlive);
    assert(listener.isAlive);

    char[1024] buf;
    auto dataLength = reads.receive(buf[]);

    if (dataLength == Socket.ERROR) {
        writeln("Connection error.");
        stdout.flush();
				return "";
    }
    else if (dataLength != 0)
    {
        code ~= buf[0 .. dataLength];
    }
    reads.close();
    listener.close();
    code = code.split("?")[1].split("&")[0].split("=")[1];

    return code;
	}

  int authorize(RequestT = Request, ResponseT = Response)() {
  	JSONValue authorizeJson;
  	ResponseT authorizeResponse;
  	RequestT authorizeRequest = Request();

  	writeln("To authorize the client, please use this link " ~
  		this.toCodeString ~ " and authorize it to use your GDrive.");
  	ushort port = to!(ushort)(this.redirectUri.split(":")[2].split("/")[0]);
  	stdout.flush();

  	this.clientCode = this.getCode(port);
		assert(this.clientCode != "", "Could not retrieve the authentication_code.");

  	authorizeRequest.sslSetVerifyPeer(false);

  	authorizeResponse = authorizeRequest.post(this.toAuthorizeString, []);
  	authorizeJson = parseJSON(authorizeResponse.responseBody.toString);
  	if (authorizeResponse.code != 200) {
  		return authorizeResponse.code;
  	}

  	AccessToken accessToken = AccessToken(authorizeJson["access_token"].toString,
  								Clock.currTime() + to!(int)(authorizeJson["expires_in"].toString).seconds);
  	writeln(Clock.currTime() + to!(int)(authorizeJson["expires_in"].toString).seconds);
  	auto serializedAccessToken = accessToken.cerealise;
  	write("access_token.pickle", serializedAccessToken);
  	auto  serializedRefreshToken = cerealise(cast(ubyte[])authorizeJson["refresh_token"].toString);
  	write("refresh_token.pickle", serializedRefreshToken);

  	return 0;
  }

  AccessToken refreshToken(RequestT = Request, ResponseT = Response)() {
  	string deserializedRefreshToken;
  	AccessToken accessToken;
  	JSONValue accessTokenJson;
  	ubyte[] serializedRefreshToken, serializedAccessToken;
		ResponseT accessTokenRes;
  	RequestT refreshRequest = Request();

  	serializedRefreshToken = cast(ubyte[])read("refresh_token.pickle");
  	deserializedRefreshToken = decerealise!string(serializedRefreshToken);
  	deserializedRefreshToken = deserializedRefreshToken[1 .. $ - 1].replace("\\", "");

		refreshRequest.sslSetVerifyPeer(false);

		accessTokenRes = refreshRequest.post(this.toRefreshTokenString(deserializedRefreshToken), []);
		accessTokenJson = parseJSON(accessTokenRes.responseBody.toString);

		assert(accessTokenRes.code == 200, "");

  	accessToken = AccessToken(accessTokenJson["access_token"].toString,
  		Clock.currTime() + to!(int)(accessTokenJson["expires_in"].toString).seconds);
  	serializedAccessToken = accessToken.cerealise;
  	write("access_token.pickle", serializedAccessToken);
  	return accessToken;
  }

	string getToken() {
		ubyte[] accessTokenText;
		AccessToken accessToken;
		bool isExpired;

		accessTokenText = cast(ubyte[])read("access_token.pickle");
		accessToken = decerealise!AccessToken(accessTokenText);

		isExpired = accessToken.expirationTime <= Clock.currTime();
		if (isExpired) {
			accessToken = this.refreshToken();
		}

		return accessToken.accessToken;
	}

	string toCodeString() {
		return format!CODE_STRING(
			GOOGLE_API_OAUTH_AUTH, DRIVE_SCOPE, redirectUri, clientId);
	}

	string toAuthorizeString() {
		return format!AUTHORIZE_STRING(
			TOKEN_URI, clientCode, clientId, clientSecret, redirectUri);
	}

	string toRefreshTokenString(string refreshToken) {
		return format!REFRESH_TOKEN_STRING(
			TOKEN_URI, clientId, clientSecret, refreshToken);
	}

	string toGetContentString() {
		return DRIVE_URI;
	}
}

struct AccessToken {
	string accessToken;
	string expirationTimeString;

	this(string accessToken, SysTime expirationTimeDate) {
		this.accessToken = accessToken;
		this.expirationTimeString = expirationTimeDate.toSimpleString;
	}

	SysTime expirationTime() {
		return SysTime.fromSimpleString(expirationTimeString);
	}
}

enum isMember(alias inst, string member) = {
	mixin("return !is(typeof(inst." ~ member ~ ") == function);");
}();

auto processMember(T, alias func = "create")(T body) {
	static if (is(T == Nullable!bool)) {
		return JSONValue(body.get);
	} else static if (isArray!T && isAggregateType!(ElementType!(T))) {
		JSONValue[] ret;
		foreach(member; body) {
			ret ~= bodyToJSON!(ElementType!(T), func)(member);
		}
		return ret;
	} else static if (is(T == SysTime)) {
		return JSONValue(body.toString());
	} else static if (isAggregateType!T) {
		return bodyToJSON!(T, func)(body);
	} else {
		return JSONValue(body);
	}
}

JSONValue bodyToJSON(ReqBody, alias func = "create")(ReqBody body) {
	import std.algorithm.searching : canFind;
	import  std.algorithm : map;

	JSONValue ret;
	bool hasClassAtrribute;
	string[] classAttributes, memberAttributes;

	if (body is null) {
		return JSONValue.init;
	}

	bool localIsMember(string member)() { return isMember!(body, member); }
	alias members = Filter!(localIsMember, __traits(derivedMembers, ReqBody));

	classAttributes = [ __traits(getAttributes, ReqBody) ];
	hasClassAtrribute = classAttributes.canFind(func);

	foreach(idx, member; body.tupleof) {
		memberAttributes = [ __traits(getAttributes, mixin("body." ~ members[idx])) ];

		if ((memberAttributes.canFind(func) || hasClassAtrribute) && member !is typeof(member).init) {
			ret[members[idx][1..$]] = processMember!(typeof(member), func)(member);
		}
	}

	return ret;
}
