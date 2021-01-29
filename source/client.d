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

enum string[string] SCOPES = [
	"gdrive": "https://www.googleapis.com/auth/drive",
	"gcalendar": "https://www.googleapis.com/auth/calendar",
	"gmail": "https://mail.google.com/"
];

enum string AUTHORIZE_STRING = "%s?code=%s&client_id=%s&client_secret=%s&" ~
	"redirect_uri=%s&grant_type=authorization_code";
enum string REFRESH_TOKEN_STRING = "%s?client_id=%s&client_secret=%s&" ~
	"refresh_token=%s&grant_type=refresh_token";
enum string CODE_STRING = "%s?scope=%s&redirect_uri=%s&client_id=%s&" ~
	"access_type=offline&response_type=code&include_granted_scopes=true&prompt=consent";

class Client {
	private string clientId;
	private string clientSecret;
	private string clientCode;
	private string redirectUri;
	private string driveScope;

	private static const string ACCESS_TOKEN_FILE = "access_token.cerealed";
	private static const string REFRESH_TOKEN_FILE = "refresh_token.cerealed";

	this(string credentialsFile, string lib = "gdrive") {
		import std.file : readText, exists;

		string clientSecretText;
		JSONValue clientSecretJson;

		enforce(clientSecretFile.exists, "Credentials file does not exist.");

		credentialsTextContent = readText(credentialsFile);
		credentialsJsonContent = parseJSON(credentialsJsonContent);

		this.clientId = credentialsJsonContent["web"]["client_id"].str;
		this.clientSecret = credentialsJsonContent["web"]["client_secret"].str;
		this.redirectUri = "http://localhost:5555";
		this.driveScope = Scopes[lib];

		if (!ACCESS_TOKEN_FILE.exists) {
			this.authorize();
		}
	}

	string getCode(ushort port) {
    import std.socket : TcpSocket, Socket, InternetAddress;

    string code = "";
    Socket reads = null;
    auto listener = new TcpSocket();
    enforce(listener.isAlive);

    listener.bind(new InternetAddress(port));
    listener.listen(10);

    reads = listener.accept();
    enforce(reads.isAlive);
    enforce(listener.isAlive);

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
  		this.toCodeString ~ " and authorize it.");
  	ushort port = to!(ushort)(this.redirectUri.split(":")[2].split("/")[0]);
  	stdout.flush();

  	this.clientCode = this.getCode(port);
		enforce(this.clientCode != "", "Could not retrieve the authentication_code.");

  	authorizeRequest.sslSetVerifyPeer(false);

  	authorizeResponse = authorizeRequest.post(this.toAuthorizeString, []);
  	authorizeJson = parseJSON(authorizeResponse.responseBody.toString);
  	if (authorizeResponse.code != 200) {
  		return authorizeResponse.code;
  	}

  	AccessToken accessToken = AccessToken(authorizeJson["access_token"].toString,
  								Clock.currTime() + to!(int)(authorizeJson["expires_in"].toString).seconds);
  	auto serializedAccessToken = accessToken.cerealise;
  	write(ACCESS_TOKEN_FILE, serializedAccessToken);
  	auto  serializedRefreshToken = cerealise(cast(ubyte[])authorizeJson["refresh_token"].toString);
  	write(REFRESH_TOKEN_FILE, serializedRefreshToken);

  	return 0;
  }

  AccessToken refreshToken(RequestT = Request, ResponseT = Response)() {
  	string deserializedRefreshToken;
  	AccessToken accessToken;
  	JSONValue accessTokenJson;
  	ubyte[] serializedRefreshToken, serializedAccessToken;
		ResponseT accessTokenRes;
  	RequestT refreshRequest = Request();

  	serializedRefreshToken = cast(ubyte[])read(REFRESH_TOKEN_FILE);
  	deserializedRefreshToken = decerealise!string(serializedRefreshToken);
  	deserializedRefreshToken = deserializedRefreshToken[1 .. $ - 1].replace("\\", "");

		refreshRequest.sslSetVerifyPeer(false);

		accessTokenRes = refreshRequest.post(this.toRefreshTokenString(deserializedRefreshToken), []);
		accessTokenJson = parseJSON(accessTokenRes.responseBody.toString);

  	accessToken = AccessToken(accessTokenJson["access_token"].toString,
  		Clock.currTime() + to!(int)(accessTokenJson["expires_in"].toString).seconds);
  	serializedAccessToken = accessToken.cerealise;
  	write(ACCESS_TOKEN_FILE, serializedAccessToken);
  	return accessToken;
  }

	string getToken() {
		ubyte[] accessTokenText;
		AccessToken accessToken;
		bool isExpired;

		accessTokenText = cast(ubyte[])read(ACCESS_TOKEN_FILE);
		accessToken = decerealise!AccessToken(accessTokenText);

		isExpired = accessToken.expirationTime <= Clock.currTime();
		if (isExpired) {
			accessToken = this.refreshToken();
		}

		return accessToken.accessToken;
	}

	string toCodeString() {
		return format!CODE_STRING(
			GOOGLE_API_OAUTH_AUTH, driveScope, redirectUri, clientId);
	}

	string toAuthorizeString() {
		return format!AUTHORIZE_STRING(
			TOKEN_URI, clientCode, clientId, clientSecret, redirectUri);
	}

	string toRefreshTokenString(string refreshToken) {
		return format!REFRESH_TOKEN_STRING(
			TOKEN_URI, clientId, clientSecret, refreshToken);
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
