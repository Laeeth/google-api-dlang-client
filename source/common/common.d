module common.common;

import client;
import requests;
import url;
import std.stdio;
import std.json : parseJSON, JSONValue;
import std.typecons : tuple, Tuple;
import std.conv : to;

string GetterSetter(string Type, string ClassName)(string name) {
  import std.ascii : toUpper;
  return `
    import std.traits : isAggregateType, isArray;
    import std.range.primitives : ElementType;
    public auto get` ~ name[0].toUpper ~ name[1..$] ~ `() {
      return this._` ~ name ~ `;
    }

    public ` ~ ClassName ~ ` set` ~ name[0].toUpper ~ name[1..$] ~ `(` ~ Type ~ ` setter_arg) {
      this._` ~ name ~ ` = setter_arg;
      return this;
    }
  `;
}

string GetterSetterAssoc(string Type, string ClassName)(string name) {
  import std.ascii : toUpper;
  return `
    import std.traits : isAggregateType, isArray;
    import std.range.primitives : ElementType;
    public auto get` ~ name[0].toUpper ~ name[1..$] ~ `() {
      return this._` ~ name ~ `;
    }

    public ` ~ ClassName ~ ` set` ~ name[0].toUpper ~ name[1..$] ~ `(` ~ Type ~ ` setter_arg) {
      this._` ~ name ~ ` = setter_arg;
      this["` ~ name ~ `"] = JSONValue(setter_arg);
      return this;
    }
  `;
}

string GetterSetterAssocArray(string ValueType, string Type, string ClassName)(string Name) {
    import std.ascii : toUpper;
    return 
        `public ` ~ Type ~ ` get` ~ Name[0].toUpper ~ Name[1..$] ~ `() {
            import std.array : replace;
            import std.traits : isArray;
            ` ~ Type ~ ` result;
            if ("` ~ Name  ~ `" in this) {
                static if (isArray!(` ~ ValueType ~ `)) {
                    JSONValue[string] jsonAssocArray = this["` ~ Name ~`"].get!(JSONValue[string]);
                    foreach (key, value; jsonAssocArray) {
                        result[key] = to!(` ~ ValueType ~ `)(value.array);
                    }
                } else {
                    string resultStr = this["` ~ Name ~ `"].toJSON.replace("{", "[").replace("}", "]");
                    result = to!(` ~ Type ~ `)(resultStr);
                }
            }
            return result;
        }
        public ` ~ ClassName ~ ` set` ~ Name[0].toUpper ~ Name[1..$] ~ `(` ~ Type ~ ` setter_arg) {
            this["` ~ Name ~ `"] = JSONValue(setter_arg);
            return this;
        }
        `;
}

string GetterSetterBasicType(Type, string ClassName)(string Name) {
    import std.ascii : toUpper;
    return `
        public final auto get` ~ Name[0].toUpper ~ Name[1..$] ~ `() {
            import std.traits : isArray;
            ` ~ Type.stringof ~ ` result;
            if ("` ~ Name ~ `" in this) {
                static if(is(`~ Type.stringof ~` == SysTime)) {
                    result = SysTime.fromSimpleString(this["` ~ Name ~ `"].toJSON);
                } else {
                    result = to!(` ~ Type.stringof ~ `)(this["` ~ Name ~ `"].toJSON);
                    static if (!isArray!(` ~ Type.stringof ~ `)) {
                        return result.nullable;
                    }
                }
            }

            static if (isArray!(` ~ Type.stringof ~ `) || is(` ~ Type.stringof ~ ` == SysTime)) {
                return result;
            } else {
                return Nullable!` ~ Type.stringof ~ `.init;
            }
        }
        public final ` ~ ClassName ~ ` set` ~ Name[0].toUpper ~ Name[1..$] ~ `(` ~ Type.stringof ~ ` setter_arg) {
            static if (is(` ~ Type.stringof ~ ` == SysTime)) {
                this["` ~ Name ~ `"] = JSONValue(setter_arg.toString);
            } else {
                this["` ~ Name ~ `"] = JSONValue(setter_arg);
            }
            return this;
        }
    `;
}

string GetterSetterAgregateType(string Type, string ClassName)(string Name) {
    import std.ascii : toUpper;
    return `
        public final auto get` ~ Name[0].toUpper ~ Name[1..$] ~ `() {
            import std.traits : isArray;
            if ("` ~ Name ~ `" in this) {
                static if (isArray!(` ~ Type ~ `)) {
                    return to!(` ~ Type ~ `)(this["` ~ Name ~ `"].array);
                } else {
                    return cast(` ~ Type ~ `)this["` ~ Name ~ `"];
                }
            }
            return ` ~ Type ~ `.init;
        }
        public final ` ~ ClassName ~ ` set` ~ Name[0].toUpper ~ Name[1..$] ~ `(` ~ Type ~ ` setter_arg) {
            import std.traits : isArray;
            static if (isArray!(` ~ Type ~ `)) {
                this["` ~ Name ~ `"] = to!(JSONValue[])(setter_arg);
            } else {
                this["` ~ Name ~ `"] = cast(JSONValue)setter_arg;
            }
            return this;
        }
    `;
}

class APIRequest(ReqBody, RequestT = Request, ResponseT = Response) {
  RequestT req;
  URL url;
  ReqBody body;
  string mediaContent;

  public string alt;

  /**
   * Data format for the response. [default: json]
   */
  public string getAlt() {
    return alt;
  }

  /** Data format for the response. */
  public APIRequest!(ReqBody, RequestT, ResponseT) setAlt(string alt) {
    this.alt = alt;
    this.url.queryParams.add("alt", alt);
    return this;
  }

  /** Selector specifying which fields to include in a partial response. */
  public string fields;

  /**
   * Selector specifying which fields to include in a partial response.
   */
  public string getFields() {
    return this.fields;
  }

  /** Selector specifying which fields to include in a partial response. */
  public APIRequest!(ReqBody, RequestT, ResponseT) setFields(string fields) {
    this.fields = fields;
    this.url.queryParams.add("fields", fields);
    return this;
  }

  /**
   * API key. Your API key identifies your project and provides you with API access, quota, and
   * reports. Required unless you provide an OAuth 2.0 token.
   */
  public string key;

  /**
   * API key. Your API key identifies your project and provides you with API access, quota, and
   * reports. Required unless you provide an OAuth 2.0 token.
   */
  public string getKey() {
    return key;
  }

  /**
   * API key. Your API key identifies your project and provides you with API access, quota, and
   * reports. Required unless you provide an OAuth 2.0 token.
   */
  public APIRequest!(ReqBody, RequestT, ResponseT) setKey(string key) {
    this.key = key;
    this.url.queryParams.add("key", key);
    return this;
  }

  /** OAuth 2.0 token for the current user. */
  public string oauthToken;

  /**
   * OAuth 2.0 token for the current user.
   */
  public string getOauthToken() {
    return oauthToken;
  }

  /** OAuth 2.0 token for the current user. */
  public APIRequest!(ReqBody, RequestT, ResponseT) setOauthToken(string oauthToken) {
    this.oauthToken = oauthToken;
    return this;
  }

  /** Returns response with indentations and line breaks. */
  public bool prettyPrint;

  /**
   * Returns response with indentations and line breaks. [default: true]
   */
  public bool getPrettyPrint() {
    return prettyPrint;
  }

  /** Returns response with indentations and line breaks. */
  public APIRequest!(ReqBody, RequestT, ResponseT) setPrettyPrint(bool prettyPrint) {
    this.prettyPrint = prettyPrint;
    addQueryParams("prettyPrint", to!(string)(prettyPrint));
    return this;
  }

  /** An opaque string that represents a user for quota purposes. Must not exceed 40 characters. */
  public string quotaUser;

  /**
   * An opaque string that represents a user for quota purposes. Must not exceed 40 characters.
   */
  public string getQuotaUser() {
    return quotaUser;
  }

  /** An opaque string that represents a user for quota purposes. Must not exceed 40 characters. */
  public APIRequest!(ReqBody, RequestT, ResponseT) setQuotaUser(string quotaUser) {
    this.quotaUser = quotaUser;
    this.url.queryParams.add("quotaUser", quotaUser);
    return this;
  }

  /** Deprecated. Please use quotaUser instead. */
  public string userIp;

  /**
   * Deprecated. Please use quotaUser instead.
   */
  public string getUserIp() {
    return userIp;
  }

  /** Deprecated. Please use quotaUser instead. */
  public APIRequest!(ReqBody, RequestT, ResponseT) setUserIp(string userIp) {
    this.userIp = userIp;
    addQueryParams("userIp", userIp);
    return this;
  }

  public APIRequest!(ReqBody, RequestT, ResponseT) setRequestHeaders(string[string] headers) {
    this.req.addHeaders(headers);
    return this;
  }

  public APIRequest!(ReqBody, RequestT, ResponseT) addQueryParams(string key, string value) {
    this.url.queryParams.add(key, value);
    return this;
  }

  this(string url, ReqBody content = ReqBody.init, string mediaContent = string.init) {
    static if (is(RequestT == Request)) {
      this.req = Request();
      this.req.sslSetVerifyPeer(false);
    }

    if (content != ReqBody.init) {
      this.body = content;
    }

    this.url = url.parseURL;
  }

  ReqBody exec(string HttpRequest)() {
    import vibe.data.json;

    string content;
    static if (HttpRequest == "GET") {
      content = "";
    } else {
      content = body.serializeToJson().toString;
    }
    req.addHeaders([
      "Authorization": "Bearer " ~ oauthToken,
      "Content-Type": "application/json"
    ]);

    string stringResponse = req.exec!HttpRequest(url, content, "application/json").responseBody.toString;

    import std.regex;
    auto re = regex("[a-zA-Z./]+\":");
    stringResponse = replaceAll(stringResponse, re, "_$&");

    Json response = Json(parseJSON(stringResponse));
    writeln("=============================\n\n\n");
    writeln(response.toString);
    writeln("============================\n\n\n");

    this.body = deserializeJson!ReqBody(response);

    return this.body;
  }

  static const int MB = 0x100000;

  ReqBody upload(string InitialHttpRequest, InputStream = string)(InputStream inputStream) {
    import vibe.data.json;
    req.addHeaders([
        "Authorization": "Bearer " ~ oauthToken
    ]);
    if (this.body == ReqBody.init) {
      addQueryParams("uploadType", "media");
      auto response = parseJSON(req.exec!InitialHttpRequest(url, inputStream).responseBody.toString);
      this.body = deserializeJson!ReqBody(response.toString);
    } else {
      addQueryParams("uploadType", "resumable");
      import std.json : JSONOptions;
      string metadata = body.serializeToJson().toString;

      req.addHeaders([
        "Content-Type": "application/json"
      ]);

      auto response = req.exec!InitialHttpRequest(url, metadata);
      string location = response.responseHeaders["location"];

      req.clearHeaders();
      req.addHeaders([
        "Content-Range": "bytes 0-" ~ to!(string)(inputStream.length - 1) ~ "/" ~ to!(string)(inputStream.length)
      ]);

      response = req.exec!"PUT"(location, inputStream);

      this.body = deserializeJson!ReqBody(parseJSON(response.responseBody.toString).toString);
    }

    return this.body;
  }

  string execUnparsed(string HttpRequest)() {
    req.addHeaders([
      "Authorization": "Bearer " ~ oauthToken
    ]);
    return req.exec!HttpRequest(url, "").responseBody.toString;
  }

}
