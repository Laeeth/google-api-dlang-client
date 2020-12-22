module gdrive.drive;

import client;
import requests;
import common.common;
import std.json : JSONValue;
import std.conv : to;
import std.typecons : Nullable, nullable;
import std.range;

public class Drive {
    public static const string DEFAULT_ROOT_URL = "https://www.googleapis.com";
    public static const string DEFAULT_SERVICE_PATH = "/drive/v3/";


    public Client client;

    this(Client client) {
        this.client = client;
    }

    public void initialize(RequestT, ResponseT,
        alias Service)
        (Service!(RequestT, ResponseT) req) {
        req.setOauthToken(client.getToken());
    }

    public void initialize(alias Service)(Service req) {
        req.setOauthToken(client.getToken());
    }

    public static string GetterSetterAssocArray(string ValueType, string Type, string ClassName)(string Name) {
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

    public static string GetterSetterBasicType(Type, string ClassName)(string Name) {
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

    public static string GetterSetterAgregateType(string Type, string ClassName)(string Name) {
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

    public About about() {
        return new About();
    }

    public class About {
        public Get!(Request, Response) get() {
            Get!(Request, Response) result = new Get!(Request, Response)();
            initialize!(Request, Response, Get)(result);
            return result;
        }

        public class Get(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.About.About, RequestT, ResponseT) {
            public static const string REST_PATH = "about";

            protected this() {
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ REST_PATH;
                super(url, string[string].init);
            }

            override {
                public Get setAlt(string alt) {
                    return cast(Get) super.setAlt(alt);
                }

                public Get setFields(string fields) {
                    return cast(Get) super.setFields(fields);
                }

                public Get setKey(string key) {
                    return cast(Get) super.setKey(key);
                }

                public Get setOauthToken(string oauthToken) {
                    return cast(Get) super.setOauthToken(oauthToken);
                }

                public Get setPrettyPrint(bool prettyPrint) {
                    return cast(Get) super.setPrettyPrint(prettyPrint);
                }

                public Get setQuotaUser(string quotaUser) {
                    return cast(Get) super.setQuotaUser(quotaUser);
                }

                public Get setUserIp(string userIp) {
                    return cast(Get) super.setUserIp(userIp);
                }
            }

            public gdrive.models.About.About execute() {
                return super.exec!"GET"();
            }
        }
    }

    public Changes changes() {
        return new Changes();
    }

    public class Changes {
        public GetStartPageToken!(Request, Response) getStartPageToken() {
            GetStartPageToken!(Request, Response) result = new GetStartPageToken!(Request, Response)();
            initialize!(Request, Response, GetStartPageToken)(result);
            return result;
        }

        public class GetStartPageToken(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.StartPageToken.StartPageToken, RequestT, ResponseT) {
            private static const string REST_PATH = "changes/startPageToken";

            protected this() {
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ REST_PATH;
                super(url, string[string].init);
            }

            override {
                public GetStartPageToken setAlt(string alt) {
                    return cast(GetStartPageToken) super.setAlt(alt);
                }

                
                public GetStartPageToken setFields(string fields) {
                    return cast(GetStartPageToken) super.setFields(fields);
                }

                
                public GetStartPageToken setKey(string key) {
                    return cast(GetStartPageToken) super.setKey(key);
                }

                
                public GetStartPageToken setOauthToken(string oauthToken) {
                    return cast(GetStartPageToken) super.setOauthToken(oauthToken);
                }

                
                public GetStartPageToken setPrettyPrint(bool prettyPrint) {
                    return cast(GetStartPageToken) super.setPrettyPrint(prettyPrint);
                }

                
                public GetStartPageToken setQuotaUser(string quotaUser) {
                    return cast(GetStartPageToken) super.setQuotaUser(quotaUser);
                }

                
                public GetStartPageToken setUserIp(string userIp) {
                    return cast(GetStartPageToken) super.setUserIp(userIp);
                }
            }
            /**
            * The ID of the shared drive for which the starting pageToken for listing future changes from
            * that shared drive is returned.
            */
            private string driveId;

            /** The ID of the shared drive for which the starting pageToken for listing future changes from that
            shared drive is returned.
            */
            public string getDriveId() {
                return driveId;
            }

            /**
            * The ID of the shared drive for which the starting pageToken for listing future changes from
            * that shared drive is returned.
            */
            public GetStartPageToken setDriveId(string driveId) {
                this.driveId = driveId;
                return cast(GetStartPageToken) super.addQueryParams("driveId", driveId);
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            private Nullable!bool supportsAllDrives;

            /** Whether the requesting application supports both My Drives and shared drives. [default: false]
            */
            public Nullable!bool getSupportsAllDrives() {
                return supportsAllDrives;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            public GetStartPageToken setSupportsAllDrives(bool supportsAllDrives) {
                this.supportsAllDrives = supportsAllDrives.nullable;
                return cast(GetStartPageToken) super.addQueryParams("supportsAllDrives", to!(string)(supportsAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the requesting application supports both My Drives and shared drives.
            * </p>
            */
            public bool isSupportsAllDrives() {
                if (supportsAllDrives.isNull) {
                    return false;
                }
                return supportsAllDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            private Nullable!bool supportsTeamDrives;

            /** Deprecated use supportsAllDrives instead. [default: false]
            */
            public Nullable!bool getSupportsTeamDrives() {
                return supportsTeamDrives;
            }

            /** Deprecated use supportsAllDrives instead. */
            public GetStartPageToken setSupportsTeamDrives(bool supportsTeamDrives) {
                this.supportsTeamDrives = supportsTeamDrives.nullable;
                return cast(GetStartPageToken) super.addQueryParams("supportsTeamDrives", to!(string)(supportsTeamDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use supportsAllDrives instead.
            * </p>
            */
            public bool isSupportsTeamDrives() {
                if (supportsTeamDrives.isNull) {
                    return false;
                }
                return supportsTeamDrives.get;
            }

            /** Deprecated use driveId instead. */
            private string teamDriveId;

            /** Deprecated use driveId instead.
            */
            public string getTeamDriveId() {
                return teamDriveId;
            }

            /** Deprecated use driveId instead. */
            public GetStartPageToken setTeamDriveId(string teamDriveId) {
                this.teamDriveId = teamDriveId;
                return cast(GetStartPageToken) super.addQueryParams("teamDriveId", teamDriveId);
            }

            public gdrive.models.StartPageToken.StartPageToken execute() {
                return super.exec!"GET"();
            }
        }

        public List!(Request, Response) list(string pageToken) {
            List!(Request, Response) result = new List!(Request, Response)(pageToken);
            initialize!(Request, Response, List)(result);
            return result;
        }

        public class List(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.ChangeList.ChangeList, RequestT, ResponseT) {
            private static const string REST_PATH = "changes";

            protected this(string pageToken) {
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ REST_PATH;
                super(url, string[string].init);
                setPageToken(pageToken);
            }

            override {
                public List setAlt(string alt) {
                    return cast(List) super.setAlt(alt);
                }

                public List setFields(string fields) {
                    return cast(List) super.setFields(fields);
                }

                public List setKey(string key) {
                    return cast(List) super.setKey(key);
                }

                public List setOauthToken(string oauthToken) {
                    return cast(List) super.setOauthToken(oauthToken);
                }

                public List setPrettyPrint(bool prettyPrint) {
                    return cast(List) super.setPrettyPrint(prettyPrint);
                }

                public List setQuotaUser(string quotaUser) {
                    return cast(List) super.setQuotaUser(quotaUser);
                }

                public List setUserIp(string userIp) {
                    return cast(List) super.setUserIp(userIp);
                }
            }

            private string pageToken;

            public string getPageToken() {
                return this.pageToken;
            }

            public List!(RequestT, ResponseT) setPageToken(string pageToken) {
                this.pageToken = pageToken;
                return cast(List) super.addQueryParams("pageToken", pageToken);
            }

            private string driveId;

            public string getDriveId() {
                return this.driveId;
            }

            public List setDriveId(string driveId) {
                this.driveId = driveId;
                return cast(List) super.addQueryParams("driveId", driveId);
            }

            private Nullable!bool includeCorpusRemovals;

            public bool getIncludeCorpusRemovals() {
                return this.includeCorpusRemovals.get;
            }

            public List setIncludeCorpusRemovals(bool includeCorpusRemovals) {
                this.includeCorpusRemovals = includeCorpusRemovals.nullable;
                return cast(List) super.addQueryParams("includeCorpusRemovals", to!(string)(includeCorpusRemovals));
            }

            public bool isIncludeCorpusRemoval() {
                if (includeCorpusRemovals.isNull) {
                    return false;
                }
                return includeCorpusRemovals.get;
            }

            private Nullable!bool includeItemsFromAllDrives;

            public bool getIncludeItemsFromAllDrives() {
                return this.includeItemsFromAllDrives.get;
            }

            public List setIncludeItemsFromAllDrives(bool includeItemsFromAllDrives) {
                this.includeItemsFromAllDrives = includeItemsFromAllDrives;
                return cast(List) super.addQueryParams("includeItemsFromAllDrives", to!(string)(includeItemsFromAllDrives));
            }

            public bool isIncludeItemsFromAllDrives() {
                if (this.includeItemsFromAllDrives.isNull) {
                    return false;
                }
                return this.includeItemsFromAllDrives.get;
            }

            private string includePermissionsForView;

            public string getIncludePermissionsForView() {
                return this.includePermissionsForView;
            }

            public List setIncludePermissionsForView(string includePermissionsForView) {
                this.includePermissionsForView = includePermissionsForView;
                return cast(List) super.addQueryParams("includePermissionsForView", includePermissionsForView);
            }

            private Nullable!bool includeRemoved;

            public bool getIncludeRemoved() {
                return this.includeRemoved.get;
            }

            public List setIncludeRemoved(bool includeRemoved) {
                this.includeRemoved = includeRemoved.nullable;
                return cast(List) super.addQueryParams("includeRemoved", to!(string)(includeRemoved));
            }

            public bool isIncludeRemoved() {
                if (this.includeRemoved.isNull) {
                    return false;
                }
                return this.includeRemoved.get;
            }

            private int pageSize;

            public int getPageSize() {
                return this.pageSize;
            }

            public List setPageSize(int pageSize) {
                this.pageSize = pageSize;
                return cast(List) super.addQueryParams("pageSize", to!(string)(pageSize));
            }

            /**
            * Whether to restrict the results to changes inside the My Drive hierarchy. This omits
            * changes to files such as those in the Application Data folder or shared files which have
            * not been added to My Drive.
            */
            private Nullable!bool restrictToMyDrive;

            /** Whether to restrict the results to changes inside the My Drive hierarchy. This omits changes to
            files such as those in the Application Data folder or shared files which have not been added to My
            Drive. [default: false]
            */
            public bool getRestrictToMyDrive() {
                return this.restrictToMyDrive.get;
            }

            /**
            * Whether to restrict the results to changes inside the My Drive hierarchy. This omits
            * changes to files such as those in the Application Data folder or shared files which have
            * not been added to My Drive.
            */
            public List setRestrictToMyDrive(bool restrictToMyDrive) {
                this.restrictToMyDrive = restrictToMyDrive.nullable;
                return cast(List) super.addQueryParams("restrictToMyDrive", to!(string)(restrictToMyDrive));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether to restrict the results to changes inside the My Drive hierarchy. This omits changes to
            files such as those in the Application Data folder or shared files which have not been added to My
            Drive.
            * </p>
            */
            public bool isRestrictToMyDrive() {
                if (this.restrictToMyDrive.isNull) {
                    return false;
                }
                return restrictToMyDrive.get;
            }

            /**
            * A comma-separated list of spaces to query within the user corpus. Supported values are
            * 'drive', 'appDataFolder' and 'photos'.
            */
            private string spaces;

            /** A comma-separated list of spaces to query within the user corpus. Supported values are 'drive',
            'appDataFolder' and 'photos'. [default: drive]
            */
            public string getSpaces() {
                return this.spaces;
            }

            /**
            * A comma-separated list of spaces to query within the user corpus. Supported values are
            * 'drive', 'appDataFolder' and 'photos'.
            */
            public List setSpaces(string spaces) {
                this.spaces = spaces;
                return cast(List) super.addQueryParams("spaces", spaces);
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            private Nullable!bool supportsAllDrives;

            /** Whether the requesting application supports both My Drives and shared drives. [default: false]
            */
            public bool getSupportsAllDrives() {
                return this.supportsAllDrives.get;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            public List setSupportsAllDrives(bool supportsAllDrives) {
                this.supportsAllDrives = supportsAllDrives;
                return cast(List) super.addQueryParams("supportsAllDrives", to!(string)(supportsAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the requesting application supports both My Drives and shared drives.
            * </p>
            */
            public bool isSupportsAllDrives() {
                if (supportsAllDrives.isNull) {
                    return false;
                }
                return supportsAllDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            private Nullable!bool supportsTeamDrives;

            /** Deprecated use supportsAllDrives instead. [default: false]
            */
            public bool getSupportsTeamDrives() {
                return supportsTeamDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            public List setSupportsTeamDrives(bool supportsTeamDrives) {
                this.supportsTeamDrives = supportsTeamDrives;
                return cast(List) super.addQueryParams("supportsTeamDrives", to!(string)(supportsTeamDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use supportsAllDrives instead.
            * </p>
            */
            public bool isSupportsTeamDrives() {
                if (supportsTeamDrives.isNull) {
                    return false;
                }
                return supportsTeamDrives.get;
            }

            /** Deprecated use driveId instead. */
            private string teamDriveId;

            /** Deprecated use driveId instead. */
            public string getTeamDriveId() {
                return this.teamDriveId;
            }

            /** Deprecated use driveId instead. */
            public List setTeamDriveId(string teamDriveId) {
                this.teamDriveId = teamDriveId;
                return cast(List) super.addQueryParams("teamDriveId", teamDriveId);
            }

            public gdrive.models.ChangeList.ChangeList execute() {
                return super.exec!"GET"();
            }
        }

        public Watch!(Request, Response) watch(string pageToken, gdrive.models.channel.Channel content) {
            Watch!(Request, Response) result = new Watch!(Request, Response)(pageToken, content);
            initialize!(Request, Response, Watch)(result);
            return result;
        }

        public class Watch(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.channel.Channel, RequestT, ResponseT) {
            private static const string REST_PATH = "changes/watch";

            protected this(string pageToken, gdrive.models.channel.Channel content) {
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ REST_PATH;
                super(url, string[string].init);
                this.body = content;
                setPageToken(pageToken);
            }

            override {
                public Watch setAlt(string alt) {
                    return cast(Watch) super.setAlt(alt);
                }

                public Watch setFields(string fields) {
                    return cast(Watch) super.setFields(fields);
                }

                public Watch setKey(string key) {
                    return cast(Watch) super.setKey(key);
                }

                public Watch setOauthToken(string oauthToken) {
                    return cast(Watch) super.setOauthToken(oauthToken);
                }

                public Watch setPrettyPrint(bool prettyPrint) {
                    return cast(Watch) super.setPrettyPrint(prettyPrint);
                }

                public Watch setQuotaUser(string quotaUser) {
                    return cast(Watch) super.setQuotaUser(quotaUser);
                }

                public Watch setUserIp(string userIp) {
                    return cast(Watch) super.setUserIp(userIp);
                }
            }
            /**
            * The token for continuing a previous list request on the next page. This should be set to
            * the value of 'nextPageToken' from the previous response or to the response from the
            * getStartPageToken method.
            */
            private string pageToken;

            /** The token for continuing a previous list request on the next page. This should be set to the value
            of 'nextPageToken' from the previous response or to the response from the getStartPageToken method.
            */
            public string getPageToken() {
                return this.pageToken;
            }

            /**
            * The token for continuing a previous list request on the next page. This should be set to
            * the value of 'nextPageToken' from the previous response or to the response from the
            * getStartPageToken method.
            */
            public Watch setPageToken(string pageToken) {
                this.pageToken = pageToken;
                return cast(Watch) super.addQueryParams("pageToken", pageToken);
            }

            /**
            * The shared drive from which changes are returned. If specified the change IDs will be
            * reflective of the shared drive; use the combined drive ID and change ID as an identifier.
            */
            
            private string driveId;

            /** The shared drive from which changes are returned. If specified the change IDs will be reflective of
            the shared drive; use the combined drive ID and change ID as an identifier.
            */
            public string getDriveId() {
                return this.driveId;
            }

            /**
            * The shared drive from which changes are returned. If specified the change IDs will be
            * reflective of the shared drive; use the combined drive ID and change ID as an identifier.
            */
            public Watch setDriveId(string driveId) {
                this.driveId = driveId;
                return cast(Watch) super.addQueryParams("driveId", driveId);
            }

            /**
            * Whether changes should include the file resource if the file is still accessible by the
            * user at the time of the request, even when a file was removed from the list of changes and
            * there will be no further change entries for this file.
            */
            
            private Nullable!bool includeCorpusRemovals;

            /** Whether changes should include the file resource if the file is still accessible by the user at the
            time of the request, even when a file was removed from the list of changes and there will be no
            further change entries for this file. [default: false]
            */
            public bool getIncludeCorpusRemovals() {
                return this.includeCorpusRemovals.get;
            }

            /**
            * Whether changes should include the file resource if the file is still accessible by the
            * user at the time of the request, even when a file was removed from the list of changes and
            * there will be no further change entries for this file.
            */
            public Watch setIncludeCorpusRemovals(bool includeCorpusRemovals) {
                this.includeCorpusRemovals = includeCorpusRemovals.nullable;
                return cast(Watch) super.addQueryParams("includeCorpusRemovals",
                    to!(string)(includeCorpusRemovals));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether changes should include the file resource if the file is still accessible by the user at the
            time of the request, even when a file was removed from the list of changes and there will be no
            further change entries for this file.
            * </p>
            */
            public bool isIncludeCorpusRemovals() {
                if (includeCorpusRemovals.isNull) {
                    return false;
                }
                return includeCorpusRemovals.get;
            }

            /** Whether both My Drive and shared drive items should be included in results. */
            
            private Nullable!bool includeItemsFromAllDrives;

            /** Whether both My Drive and shared drive items should be included in results. [default: false]
            */
            public bool getIncludeItemsFromAllDrives() {
                return includeItemsFromAllDrives.get;
            }

            /** Whether both My Drive and shared drive items should be included in results. */
            public Watch setIncludeItemsFromAllDrives(bool includeItemsFromAllDrives) {
                this.includeItemsFromAllDrives = includeItemsFromAllDrives.nullable;
                return cast(Watch) super.addQueryParams("includeItemsFromAllDrives",
                    to!(string)(includeItemsFromAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether both My Drive and shared drive items should be included in results.
            * </p>
            */
            public bool isIncludeItemsFromAllDrives() {
                if (includeItemsFromAllDrives.isNull) {
                    return false;
                }
                return includeItemsFromAllDrives.get;
            }

            /**
            * Specifies which additional view's permissions to include in the response. Only 'published'
            * is supported.
            */
            
            private string includePermissionsForView;

            /** Specifies which additional view's permissions to include in the response. Only 'published' is
            supported.
            */
            public string getIncludePermissionsForView() {
                return includePermissionsForView;
            }

            /**
            * Specifies which additional view's permissions to include in the response. Only 'published'
            * is supported.
            */
            public Watch setIncludePermissionsForView(string includePermissionsForView) {
                this.includePermissionsForView = includePermissionsForView;
                return cast(Watch) super.addQueryParams("includePermissionsForView", includePermissionsForView);
            }

            /**
            * Whether to include changes indicating that items have been removed from the list of
            * changes, for example by deletion or loss of access.
            */
            
            private Nullable!bool includeRemoved;

            /** Whether to include changes indicating that items have been removed from the list of changes, for
            example by deletion or loss of access. [default: true]
            */
            public bool getIncludeRemoved() {
                return includeRemoved.get;
            }

            /**
            * Whether to include changes indicating that items have been removed from the list of
            * changes, for example by deletion or loss of access.
            */
            public Watch setIncludeRemoved(bool includeRemoved) {
                this.includeRemoved = includeRemoved.nullable;
                return cast(Watch) super.addQueryParams("includeRemoved",
                    to!(string)(includeRemoved));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether to include changes indicating that items have been removed from the list of changes, for
            example by deletion or loss of access.
            * </p>
            */
            public bool isIncludeRemoved() {
                if (includeRemoved.isNull) {
                    return true;
                }
                return includeRemoved.get;
            }

            /** Deprecated use includeItemsFromAllDrives instead. */
            
            private Nullable!bool includeTeamDriveItems;

            /** Deprecated use includeItemsFromAllDrives instead. [default: false]
            */
            public bool getIncludeTeamDriveItems() {
                return includeTeamDriveItems.get;
            }

            /** Deprecated use includeItemsFromAllDrives instead. */
            public Watch setIncludeTeamDriveItems(bool includeTeamDriveItems) {
                this.includeTeamDriveItems = includeTeamDriveItems.nullable;
                return cast(Watch) super.addQueryParams("includeTeamDriveItems",
                    to!(string)(includeTeamDriveItems));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use includeItemsFromAllDrives instead.
            * </p>
            */
            public bool isIncludeTeamDriveItems() {
                if (includeTeamDriveItems.isNull) {
                    return false;
                }
                return includeTeamDriveItems.get;
            }

            /** The maximum number of changes to return per page. */
            
            private int pageSize;

            /** The maximum number of changes to return per page. [default: 100] [minimum: 1] [maximum: 1000]
            */
            public int getPageSize() {
                return pageSize;
            }

            /** The maximum number of changes to return per page. */
            public Watch setPageSize(int pageSize) {
                this.pageSize = pageSize;
                return cast(Watch) super.addQueryParams("pageSize", to!(string)(pageSize));
            }

            /**
            * Whether to restrict the results to changes inside the My Drive hierarchy. This omits
            * changes to files such as those in the Application Data folder or shared files which have
            * not been added to My Drive.
            */
            
            private Nullable!bool restrictToMyDrive;

            /** Whether to restrict the results to changes inside the My Drive hierarchy. This omits changes to
            files such as those in the Application Data folder or shared files which have not been added to My
            Drive. [default: false]
            */
            public bool getRestrictToMyDrive() {
                return restrictToMyDrive.get;
            }

            /**
            * Whether to restrict the results to changes inside the My Drive hierarchy. This omits
            * changes to files such as those in the Application Data folder or shared files which have
            * not been added to My Drive.
            */
            public Watch setRestrictToMyDrive(bool restrictToMyDrive) {
                this.restrictToMyDrive = restrictToMyDrive.nullable;
                return cast(Watch) super.addQueryParams("restrictToMyDrive",
                    to!(string)(restrictToMyDrive));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether to restrict the results to changes inside the My Drive hierarchy. This omits changes to
            files such as those in the Application Data folder or shared files which have not been added to My
            Drive.
            * </p>
            */
            public bool isRestrictToMyDrive() {
                if (restrictToMyDrive.isNull) {
                    return false;
                }
                return restrictToMyDrive.get;
            }

            /**
            * A comma-separated list of spaces to query within the user corpus. Supported values are
            * 'drive', 'appDataFolder' and 'photos'.
            */
            
            private string spaces;

            /** A comma-separated list of spaces to query within the user corpus. Supported values are 'drive',
            'appDataFolder' and 'photos'. [default: drive]
            */
            public string getSpaces() {
                return spaces;
            }

            /**
            * A comma-separated list of spaces to query within the user corpus. Supported values are
            * 'drive', 'appDataFolder' and 'photos'.
            */
            public Watch setSpaces(string spaces) {
                this.spaces = spaces;
                return cast(Watch) super.addQueryParams("spaces", spaces);
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            
            private Nullable!bool supportsAllDrives;

            /** Whether the requesting application supports both My Drives and shared drives. [default: false]
            */
            public bool getSupportsAllDrives() {
                return supportsAllDrives.get;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            public Watch setSupportsAllDrives(bool supportsAllDrives) {
                this.supportsAllDrives = supportsAllDrives.nullable;
                return cast(Watch) super.addQueryParams("supportsAllDrives",
                    to!(string)(supportsAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the requesting application supports both My Drives and shared drives.
            * </p>
            */
            public bool isSupportsAllDrives() {
                if (supportsAllDrives.isNull) {
                    return false;
                }
                return supportsAllDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            
            private Nullable!bool supportsTeamDrives;

            /** Deprecated use supportsAllDrives instead. [default: false]
            */
            public bool getSupportsTeamDrives() {
                return supportsTeamDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            public Watch setSupportsTeamDrives(bool supportsTeamDrives) {
                this.supportsTeamDrives = supportsTeamDrives.nullable;
                return cast(Watch) super.addQueryParams("supportsTeamDrives",
                    to!(string)(supportsTeamDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use supportsAllDrives instead.
            * </p>
            */
            public bool isSupportsTeamDrives() {
                if (supportsTeamDrives.isNull) {
                    return false;
                }
                return supportsTeamDrives.get;
            }

            /** Deprecated use driveId instead. */
            
            private string teamDriveId;

            /** Deprecated use driveId instead.
            */
            public string getTeamDriveId() {
                return teamDriveId;
            }

            /** Deprecated use driveId instead. */
            public Watch setTeamDriveId(string teamDriveId) {
                this.teamDriveId = teamDriveId;
                return cast(Watch) super.addQueryParams("teamDriveId", teamDriveId);
            }

            public gdrive.models.channel.Channel execute() {
                return super.exec!"POST"();
            }
        }
    }

    public Channels channels() {
        return new Channels();
    }

    public class Channels {
        public Stop!(Request, Response) stop(gdrive.models.stop.Stop content) {
            Stop!(Request, Response) result = new Stop!(Request, Response)(content);
            initialize!(Request, Response, Stop)(result);
            return result;
        }

        public class Stop(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.stop.Stop, RequestT, ResponseT) {
            private static const string REST_PATH = "channels/stop";

            protected this(gdrive.models.stop.Stop content) {
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ REST_PATH;
                super(url, string[string].init);
                this.body = content;
            }

            override {
                public Stop setAlt(string alt) {
                    return cast(Stop) super.setAlt(alt);
                }

                public Stop setFields(string fields) {
                    return cast(Stop) super.setFields(fields);
                }

                public Stop setKey(string key) {
                    return cast(Stop) super.setKey(key);
                }

                public Stop setOauthToken(string oauthToken) {
                    return cast(Stop) super.setOauthToken(oauthToken);
                }

                public Stop setPrettyPrint(bool prettyPrint) {
                    return cast(Stop) super.setPrettyPrint(prettyPrint);
                }

                public Stop setQuotaUser(string quotaUser) {
                    return cast(Stop) super.setQuotaUser(quotaUser);
                }

                public Stop setUserIp(string userIp) {
                    return cast(Stop) super.setUserIp(userIp);
                }
            }

            public gdrive.models.stop.Stop execute() {
                return super.exec!"POST"();
            }
        }
    }

    public Comments comments() {
        return new Comments();
    }

    public class Comments {
        public Create!(Request, Response) create(string fileId, gdrive.models.comments.Comment content) {
            Create!(Request, Response) result = new Create!(Request, Response)(fileId, content);
            initialize!(Request, Response, Create)(result);
            return result;
        }

        public class Create(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.comments.Comment, RequestT, ResponseT) {
            private static const string REST_PATH = "files/%s/comments";

            protected this(string fileId, gdrive.models.comments.Comment content) {
                import std.format : format;
                string formatedStringRestPath = format!REST_PATH(fileId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedStringRestPath;
                super(url, string[string].init);
                setFileId(fileId);
                this.body = content;
            }

            override {
                public Create setAlt(string alt) {
                    return cast(Create) super.setAlt(alt);
                }

                public Create setFields(string fields) {
                    return cast(Create) super.setFields(fields);
                }

                public Create setKey(string key) {
                    return cast(Create) super.setKey(key);
                }

                public Create setOauthToken(string oauthToken) {
                    return cast(Create) super.setOauthToken(oauthToken);
                }

                public Create setPrettyPrint(bool prettyPrint) {
                    return cast(Create) super.setPrettyPrint(prettyPrint);
                }

                public Create setQuotaUser(string quotaUser) {
                    return cast(Create) super.setQuotaUser(quotaUser);
                }

                public Create setUserIp(string userIp) {
                    return cast(Create) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Create setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            public Create set(T)(String parameterName, T value) {
                return cast(Create) super.addQueryParams(parameterName, to!(string)(value));
            }

            public gdrive.models.comments.Comment execute() {
                return super.exec!"POST"();
            }
        }

        public Delete!(Request, Response) deleteComment(string fileId, string commentId) {
            Delete!(Request, Response) result = new Delete!(Request, Response)(fileId, commentId);
            initialize!(Request, Response, Delete)(result);
            return result;
        }

        public class Delete(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.comments.Comment, RequestT, ResponseT) {
            private static const string REST_PATH = "files/%s/comments/%s";

            protected this(string fileId, string commentId) {
                import std.format : format;
                string formatedStringRestPath = format!REST_PATH(fileId, commentId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedStringRestPath;
                super(url, string[string].init);
                setFileId(fileId);
                setCommentId(commentId);
            }

            override {
                public Delete setAlt(string alt) {
                    return cast(Delete) super.setAlt(alt);
                }

                public Delete setFields(string fields) {
                    return cast(Delete) super.setFields(fields);
                }

                public Delete setKey(string key) {
                    return cast(Delete) super.setKey(key);
                }

                public Delete setOauthToken(string oauthToken) {
                    return cast(Delete) super.setOauthToken(oauthToken);
                }

                public Delete setPrettyPrint(bool prettyPrint) {
                    return cast(Delete) super.setPrettyPrint(prettyPrint);
                }

                public Delete setQuotaUser(string quotaUser) {
                    return cast(Delete) super.setQuotaUser(quotaUser);
                }

                public Delete setUserIp(string userIp) {
                    return cast(Delete) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Delete setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /** The ID of the comment. */
            
            private string commentId;

            /** The ID of the comment.
            */
            public string getCommentId() {
                return commentId;
            }

            /** The ID of the comment. */
            public Delete setCommentId(string commentId) {
                this.commentId = commentId;
                return this;
            }

            public Delete set(T)(String parameterName, T value) {
                return cast(Delete) super.addQueryParams(parameterName, to!(string)(value));
            }

            public gdrive.models.comments.Comment execute() {
                return super.exec!"DELETE"();
            }
        }

        public Get!(Request, Response) get(string fileId, string commentId) {
            Get!(Request, Response) result = new Get!(Request, Response)(fileId, commentId);
            initialize!(Request, Response, Get)(result);
            return result;
        }

        public class Get(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.comments.Comment, RequestT, ResponseT) {
            private static const string REST_PATH = "files/%s/comments/%s";

            protected this(string fileId, string commentId) {
                import std.format : format;
                string formatedStringRestPath = format!REST_PATH(fileId, commentId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedStringRestPath;
                super(url, string[string].init);
                setFileId(fileId);
                setCommentId(commentId);
            }

            override {
                public Get setAlt(string alt) {
                    return cast(Get) super.setAlt(alt);
                }

                public Get setFields(string fields) {
                    return cast(Get) super.setFields(fields);
                }

                public Get setKey(string key) {
                    return cast(Get) super.setKey(key);
                }

                public Get setOauthToken(string oauthToken) {
                    return cast(Get) super.setOauthToken(oauthToken);
                }

                public Get setPrettyPrint(bool prettyPrint) {
                    return cast(Get) super.setPrettyPrint(prettyPrint);
                }

                public Get setQuotaUser(string quotaUser) {
                return cast(Get) super.setQuotaUser(quotaUser);
                }

                public Get setUserIp(string userIp) {
                return cast(Get) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Get setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /** The ID of the comment. */
            private string commentId;

            /** The ID of the comment.
            */
            public string getCommentId() {
                return commentId;
            }

            /** The ID of the comment. */
            public Get setCommentId(string commentId) {
                this.commentId = commentId;
                return this;
            }

            /**
            * Whether to return deleted comments. Deleted comments will not include their original
            * content.
            */
            private Nullable!bool includeDeleted;

            /** Whether to return deleted comments. Deleted comments will not include their original content.
            [default: false]
            */
            public bool getIncludeDeleted() {
                return includeDeleted.get;
            }

            /**
            * Whether to return deleted comments. Deleted comments will not include their original
            * content.
            */
            public Get setIncludeDeleted(bool includeDeleted) {
                this.includeDeleted = includeDeleted.nullable;
                return cast(Get) super.addQueryParams("includeDeleted",
                    to!(string)(includeDeleted));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether to return deleted comments. Deleted comments will not include their original content.
            * </p>
            */
            public bool isIncludeDeleted() {
            if (includeDeleted.isNull) {
                return false;
            }
                return includeDeleted.get;
            }

            public Get set(T)(String parameterName, T value) {
                return cast(Get) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            public gdrive.models.comments.Comment execute() {
                return super.exec!"GET"();
            }
        }

        public List!(Request, Response) list(string fileId) {
            List!(Request, Response) result = new List!(Request, Response)(fileId);
            initialize!(Request, Response, List)(result);
            return result;
        }

        public class List(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.commentlist.CommentList, RequestT, ResponseT) {
            private static const string REST_PATH = "files/%s/comments";

            protected this(string fileId) {
                import std.format : format;
                string formatedStringRestPath = format!REST_PATH(fileId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedStringRestPath;
                super(url, string[string].init);
                setFileId(fileId);
            }

            override {
                public List setAlt(string alt) {
                    return cast(List) super.setAlt(alt);
                }

                public List setFields(string fields) {
                    return cast(List) super.setFields(fields);
                }

                public List setKey(string key) {
                    return cast(List) super.setKey(key);
                }

                public List setOauthToken(string oauthToken) {
                   return cast(List) super.setOauthToken(oauthToken);
                }

                public List setPrettyPrint(bool prettyPrint) {
                    return cast(List) super.setPrettyPrint(prettyPrint);
                }

                public List setQuotaUser(string quotaUser) {
                    return cast(List) super.setQuotaUser(quotaUser);
                }

                public List setUserIp(string userIp) {
                    return cast(List) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public List setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /**
            * Whether to include deleted comments. Deleted comments will not include their original
            * content.
            */
            
            private Nullable!bool includeDeleted;

            /** Whether to include deleted comments. Deleted comments will not include their original content.
            [default: false]
            */
            public bool getIncludeDeleted() {
                return includeDeleted.get;
            }

            /**
            * Whether to include deleted comments. Deleted comments will not include their original
            * content.
            */
            public List setIncludeDeleted(bool includeDeleted) {
                this.includeDeleted = includeDeleted.nullable;
                return cast(List) super.addQueryParams("includeDeleted",
                    to!(string)(includeDeleted));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether to include deleted comments. Deleted comments will not include their original content.
            * </p>
            */
            public bool isIncludeDeleted() {
            if (includeDeleted.isNull) {
                return false;
            }
                return includeDeleted.get;
            }

            /** The maximum number of comments to return per page. */
            private int pageSize;

            /** The maximum number of comments to return per page. [default: 20] [minimum: 1] [maximum: 100]
            */
            public int getPageSize() {
                return pageSize;
            }

            /** The maximum number of comments to return per page. */
            public List setPageSize(int pageSize) {
                this.pageSize = pageSize;
                return cast(List) super.addQueryParams("pageSize",
                    to!(string)(pageSize));
            }

            /**
            * The token for continuing a previous list request on the next page. This should be set to
            * the value of 'nextPageToken' from the previous response.
            */
            private string pageToken;

            /** The token for continuing a previous list request on the next page. This should be set to the value
            of 'nextPageToken' from the previous response.
            */
            public string getPageToken() {
                return pageToken;
            }

            /**
            * The token for continuing a previous list request on the next page. This should be set to
            * the value of 'nextPageToken' from the previous response.
            */
            public List setPageToken(string pageToken) {
                this.pageToken = pageToken;
                return cast(List) super.addQueryParams("pageToken", pageToken);
            }

            /** The minimum value of 'modifiedTime' for the result comments (RFC 3339 date-time). */
            private string startModifiedTime;

            /** The minimum value of 'modifiedTime' for the result comments (RFC 3339 date-time).
            */
            public string getStartModifiedTime() {
                return startModifiedTime;
            }

            /** The minimum value of 'modifiedTime' for the result comments (RFC 3339 date-time). */
            public List setStartModifiedTime(string startModifiedTime) {
                this.startModifiedTime = startModifiedTime;
                return cast(List) super.addQueryParams("startModifiedTime",
                    startModifiedTime);
            }

            public List set(T)(String parameterName, T value) {
                return cast(List) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            public gdrive.models.commentlist.CommentList execute() {
                return super.exec!"GET"();
            }
        }

        public Update!(Request, Response) update(string fileId, string commentId,
            gdrive.models.comments.Comment content) {
            Update!(Request, Response) result =
                new Update!(Request, Response)(fileId, commentId, content);
            initialize!(Request, Response, Update)(result);
            return result;
        }

        public class Update(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.comments.Comment, RequestT, ResponseT) {
            private static const string REST_PATH = "files/%s/comments/%s";

            protected this(string fileId, string commentId,
                gdrive.models.comments.Comment content) {
                import std.format : format;
                string formatedStringRestPath = format!REST_PATH(fileId, commentId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedStringRestPath;
                super(url, string[string].init);
                this.body = content;
                setFileId(fileId);
                setCommentId(commentId);
            }

            override {
                public Update setAlt(string alt) {
                    return cast(Update) super.setAlt(alt);
                }
                
                public Update setFields(string fields) {
                    return cast(Update) super.setFields(fields);
                }

                public Update setKey(string key) {
                    return cast(Update) super.setKey(key);
                }

                public Update setOauthToken(string oauthToken) {
                    return cast(Update) super.setOauthToken(oauthToken);
                }

                public Update setPrettyPrint(bool prettyPrint) {
                    return cast(Update) super.setPrettyPrint(prettyPrint);
                }

                public Update setQuotaUser(string quotaUser) {
                    return cast(Update) super.setQuotaUser(quotaUser);
                }

                public Update setUserIp(string userIp) {
                    return cast(Update) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Update setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /** The ID of the comment. */
            private string commentId;

            /** The ID of the comment.
            */
            public string getCommentId() {
                return commentId;
            }

            /** The ID of the comment. */
            public Update setCommentId(string commentId) {
                this.commentId = commentId;
                return this;
            }

            public Update set(T)(String parameterName, T value) {
                return cast(Update) super.addQueryParams(parameterName,
                to!(string)(value));
            }

            public gdrive.models.comments.Comment execute() {
                return super.exec!"PATCH"();
            }
        }
    }

    public Drives drives() {
        return new Drives();
    }

    public class Drives {
        public Create!(Request, Response) create(string requestId,
            gdrive.models.Drive.Drive content) {
            Create!(Request, Response) result = new Create!(Request, Response)(requestId, content);
            initialize!(Request, Response, Create)(result);
            return result;
        }

        public class Create(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.Drive.Drive, RequestT, ResponseT) {
            private static const string REST_PATH = "drives";

            protected this(string requestId, gdrive.models.Drive.Drive content) {
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ REST_PATH;
                super(url, string[string].init);
                this.body = content;
            }

            override {
                public Create setAlt(string alt) {
                    return cast(Create) super.setAlt(alt);
                }

                
                public Create setFields(string fields) {
                    return cast(Create) super.setFields(fields);
                }

                
                public Create setKey(string key) {
                    return cast(Create) super.setKey(key);
                }

                
                public Create setOauthToken(string oauthToken) {
                    return cast(Create) super.setOauthToken(oauthToken);
                }

                
                public Create setPrettyPrint(bool prettyPrint) {
                    return cast(Create) super.setPrettyPrint(prettyPrint);
                }

                
                public Create setQuotaUser(string quotaUser) {
                    return cast(Create) super.setQuotaUser(quotaUser);
                }

                
                public Create setUserIp(string userIp) {
                    return cast(Create) super.setUserIp(userIp);
                }
            }

            /**
            * An ID, such as a random UUID, which uniquely identifies this user's request for idempotent
            * creation of a shared drive. A repeated request by the same user and with the same request
            * ID will avoid creating duplicates by attempting to create the same shared drive. If the
            * shared drive already exists a 409 error will be returned.
            */
            private string requestId;

            /** An ID, such as a random UUID, which uniquely identifies this user's request for idempotent creation
            of a shared drive. A repeated request by the same user and with the same request ID will avoid
            creating duplicates by attempting to create the same shared drive. If the shared drive already
            exists a 409 error will be returned.
            */
            public string getRequestId() {
                return requestId;
            }

            /**
            * An ID, such as a random UUID, which uniquely identifies this user's request for idempotent
            * creation of a shared drive. A repeated request by the same user and with the same request
            * ID will avoid creating duplicates by attempting to create the same shared drive. If the
            * shared drive already exists a 409 error will be returned.
            */
            public Create setRequestId(string requestId) {
                this.requestId = requestId;
                return cast(Create) super.addQueryParams("requestId", requestId);
            }

            public Create set(T)(String parameterName, T value) {
            return cast(Create) super.addQueryParams(parameterName,
                to!(string)(value));
            }

            public gdrive.models.Drive.Drive execute() {
                return super.exec!"POST"();
            }
        }

        public Delete!(Request, Response) deleteDrive(string driveId) {
            Delete!(Request, Response) result = new Delete!(Request, Response)(driveId);
            initialize!(Request, Response, Delete)(result);
            return result;
        }

        public class Delete(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.Drive.Drive, RequestT, ResponseT) {
            private static const string REST_PATH = "drives/%s";

            protected this(string driveId) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(driveId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                setDriveId(driveId);
            }

            override {
                public Delete setAlt(string alt) {
                    return cast(Delete) super.setAlt(alt);
                }

                public Delete setFields(string fields) {
                    return cast(Delete) super.setFields(fields);
                }

                public Delete setKey(string key) {
                    return cast(Delete) super.setKey(key);
                }

                public Delete setOauthToken(string oauthToken) {
                    return cast(Delete) super.setOauthToken(oauthToken);
                }

                public Delete setPrettyPrint(bool prettyPrint) {
                    return cast(Delete) super.setPrettyPrint(prettyPrint);
                }

                public Delete setQuotaUser(string quotaUser) {
                    return cast(Delete) super.setQuotaUser(quotaUser);
                }

                public Delete setUserIp(string userIp) {
                    return cast(Delete) super.setUserIp(userIp);
                }
            }

            /** The ID of the shared drive. */
            private string driveId;

            /** The ID of the shared drive.
            */
            public string getDriveId() {
                return driveId;
            }

            /** The ID of the shared drive. */
            public Delete setDriveId(string driveId) {
                this.driveId = driveId;
                return this;
            }

            public Delete set(T)(String parameterName, T value) {
                return cast(Delete) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            public gdrive.models.Drive.Drive execute() {
                return super.exec!"DELETE"();
            }
        }

        public Get!(Request, Response) get(string driveId) {
            Get!(Request, Response) result = new Get!(Request, Response)(driveId);
            initialize!(Request, Response, Get)(result);
            return result;
        }

        public class Get(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.Drive.Drive, RequestT, ResponseT) {
            private static const string REST_PATH = "drives/%s";

            protected this(string driveId) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(driveId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                setDriveId(driveId);
            }

            override {
                public Get setAlt(string alt) {
                    return cast(Get) super.setAlt(alt);
                }

                public Get setFields(string fields) {
                    return cast(Get) super.setFields(fields);
                }

                public Get setKey(string key) {
                    return cast(Get) super.setKey(key);
                }

                public Get setOauthToken(string oauthToken) {
                    return cast(Get) super.setOauthToken(oauthToken);
                }

                public Get setPrettyPrint(bool prettyPrint) {
                    return cast(Get) super.setPrettyPrint(prettyPrint);
                }

                public Get setQuotaUser(string quotaUser) {
                    return cast(Get) super.setQuotaUser(quotaUser);
                }

                public Get setUserIp(string userIp) {
                    return cast(Get) super.setUserIp(userIp);
                }
            }

            /** The ID of the shared drive. */
            private string driveId;

            /** The ID of the shared drive.
            */
            public string getDriveId() {
                return driveId;
            }

            /** The ID of the shared drive. */
            public Get setDriveId(string driveId) {
                this.driveId = driveId;
                return this;
            }

            /**
            * Issue the request as a domain administrator; if set to true, then the requester will be
            * granted access if they are an administrator of the domain to which the shared drive
            * belongs.
            */
            
            private Nullable!bool useDomainAdminAccess;

            /** Issue the request as a domain administrator; if set to true, then the requester will be granted
            access if they are an administrator of the domain to which the shared drive belongs. [default:
            false]
            */
            public bool getUseDomainAdminAccess() {
                return useDomainAdminAccess.get;
            }

            /**
            * Issue the request as a domain administrator; if set to true, then the requester will be
            * granted access if they are an administrator of the domain to which the shared drive
            * belongs.
            */
            public Get setUseDomainAdminAccess(bool useDomainAdminAccess) {
                this.useDomainAdminAccess = useDomainAdminAccess.nullable;
                return cast(Get) super.addQueryParams("useDomainAdminAccess",
                    to!(string)(useDomainAdminAccess));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Issue the request as a domain administrator; if set to true, then the requester will be granted
            access if they are an administrator of the domain to which the shared drive belongs.
            * </p>
            */
            public bool isUseDomainAdminAccess() {
                if (useDomainAdminAccess.isNull) {
                    return false;
                }
                return useDomainAdminAccess.get;
            }

            public Get set(T)(String parameterName, T value) {
                return cast(Get) super.addQueryParams(parameterName,
                    to!(string)(value));
            }
        }

        public Hide!(Request, Response) hide(string driveId) {
            Hide!(Request, Response) result = new Hide!(Request, Response)(driveId);
            initialize!(Request, Response, Hide)(result);
            return result;
        }

        public class Hide(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.Drive.Drive, RequestT, ResponseT) {
            private static const string REST_PATH = "drives/%s/hide";

            protected this(string driveId) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(driveId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                setDriveId(driveId);
            }

            override {
                public Hide setAlt(string alt) {
                    return cast(Hide) super.setAlt(alt);
                }

                public Hide setFields(string fields) {
                    return cast(Hide) super.setFields(fields);
                }

                public Hide setKey(string key) {
                    return cast(Hide) super.setKey(key);
                }

                public Hide setOauthToken(string oauthToken) {
                    return cast(Hide) super.setOauthToken(oauthToken);
                }

                public Hide setPrettyPrint(bool prettyPrint) {
                    return cast(Hide) super.setPrettyPrint(prettyPrint);
                }

                public Hide setQuotaUser(string quotaUser) {
                    return cast(Hide) super.setQuotaUser(quotaUser);
                }

                public Hide setUserIp(string userIp) {
                    return cast(Hide) super.setUserIp(userIp);
                }
            }

            /** The ID of the shared drive. */
            private string driveId;

            /** The ID of the shared drive.
            */
            public string getDriveId() {
                return driveId;
            }

            /** The ID of the shared drive. */
            public Hide setDriveId(string driveId) {
                this.driveId = driveId;
                return this;
            }

            public Hide set(T)(String parameterName, T value) {
                return cast(Hide) super.set(parameterName,
                    to!(string)(value));
            }
        }

        public Unhide!(Request, Response) unhide(string driveId) {
            Unhide!(Request, Response) result = new Unhide!(Request, Response)(driveId);
            initialize!(Request, Response, Unhide)(result);
            return result;
        }

        public class Unhide(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.Drive.Drive, RequestT, ResponseT) {
            private static const string REST_PATH = "drives/%s/unhide";

            protected this(string driveId) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(driveId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                setDriveId(driveId);
            }

            override {
                public Unhide setAlt(string alt) {
                    return cast(Unhide) super.setAlt(alt);
                }

                public Unhide setFields(string fields) {
                    return cast(Unhide) super.setFields(fields);
                }

                public Unhide setKey(string key) {
                    return cast(Unhide) super.setKey(key);
                }

                public Unhide setOauthToken(string oauthToken) {
                    return cast(Unhide) super.setOauthToken(oauthToken);
                }

                public Unhide setPrettyPrint(bool prettyPrint) {
                    return cast(Unhide) super.setPrettyPrint(prettyPrint);
                }

                public Unhide setQuotaUser(string quotaUser) {
                    return cast(Unhide) super.setQuotaUser(quotaUser);
                }

                public Unhide setUserIp(string userIp) {
                    return cast(Unhide) super.setUserIp(userIp);
                }
            }

            /** The ID of the shared drive. */
            private string driveId;

            /** The ID of the shared drive.
            */
            public string getDriveId() {
                return driveId;
            }

            /** The ID of the shared drive. */
            public Unhide setDriveId(string driveId) {
                this.driveId = driveId;
                return this;
            }

            public Unhide set(T)(String parameterName, T value) {
                return cast(Unhide) super.set(parameterName,
                    to!(string)(value));
            }
        }

        public Update!(Request, Response) update(string driveId,
            gdrive.models.Drive.Drive content) {
            Update!(Request, Response) result = new Update!(Request, Response)(driveId, content);
            initialize!(Request, Response, Update)(result);
            return result;
        }

        public class Update(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.Drive.Drive, RequestT, ResponseT) {
            private static const string REST_PATH = "drives/%s";

            protected this(string driveId, gdrive.models.Drive.Drive content) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(driveId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.body = content;
                setDriveId(driveId);
            }

            override {
                public Update setAlt(string alt) {
                    return cast(Update) super.setAlt(alt);
                }

                public Update setFields(string fields) {
                    return cast(Update) super.setFields(fields);
                }

                public Update setKey(string key) {
                    return cast(Update) super.setKey(key);
                }

                public Update setOauthToken(string oauthToken) {
                    return cast(Update) super.setOauthToken(oauthToken);
                }

                public Update setPrettyPrint(bool prettyPrint) {
                    return cast(Update) super.setPrettyPrint(prettyPrint);
                }

                public Update setQuotaUser(string quotaUser) {
                    return cast(Update) super.setQuotaUser(quotaUser);
                }

                public Update setUserIp(string userIp) {
                    return cast(Update) super.setUserIp(userIp);
                }
            }

            /** The ID of the shared drive. */
            private string driveId;

            /** The ID of the shared drive.
            */
            public string getDriveId() {
                return driveId;
            }

            /** The ID of the shared drive. */
            public Update setDriveId(string driveId) {
                this.driveId = driveId;
                return this;
            }

            /**
            * Issue the request as a domain administrator; if set to true, then the requester will be
            * granted access if they are an administrator of the domain to which the shared drive
            * belongs.
            */
            private Nullable!bool useDomainAdminAccess;

            /** Issue the request as a domain administrator; if set to true, then the requester will be granted
            access if they are an administrator of the domain to which the shared drive belongs. [default:
            false]
            */
            public bool getUseDomainAdminAccess() {
                return useDomainAdminAccess.get;
            }

            /**
            * Issue the request as a domain administrator; if set to true, then the requester will be
            * granted access if they are an administrator of the domain to which the shared drive
            * belongs.
            */
            public Update setUseDomainAdminAccess(bool useDomainAdminAccess) {
                this.useDomainAdminAccess = useDomainAdminAccess.nullable;
                return cast(Update) super.addQueryParams("userDomainAdminAccess",
                    to!(string)(useDomainAdminAccess));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Issue the request as a domain administrator; if set to true, then the requester will be granted
            access if they are an administrator of the domain to which the shared drive belongs.
            * </p>
            */
            public bool isUseDomainAdminAccess() {
                if (useDomainAdminAccess.isNull) {
                    return false;
                }
                return useDomainAdminAccess.get;
            }

            public Update set(T)(String parameterName, T value) {
                return cast(Update) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            public gdrive.models.Drive.Drive execute() {
                return super.exec!"POST"();
            }
        }
    }

    public Files files() {
        return new Files();
    }

    public class Files {
        public Copy!(Request, Response) copy(string fileId,
            gdrive.models.File.File content) {
            Copy!(Request, Response) result = new Copy!(Request, Response)(fileId, content);
            initialize!(Request, Response, Copy)(result);
            return result;
        }

        public class Copy(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.File.File, RequestT, ResponseT) {
            private static const string REST_PATH = "files/%s/copy";

            protected this(string fileId, gdrive.models.File.File content) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.body = content;
                setFileId(fileId);
            }

            override {
                public Copy setAlt(string alt) {
                return cast(Copy) super.setAlt(alt);
                }

                public Copy setFields(string fields) {
                return cast(Copy) super.setFields(fields);
                }

                public Copy setKey(string key) {
                    return cast(Copy) super.setKey(key);
                }

                public Copy setOauthToken(string oauthToken) {
                    return cast(Copy) super.setOauthToken(oauthToken);
                }

                public Copy setPrettyPrint(bool prettyPrint) {
                    return cast(Copy) super.setPrettyPrint(prettyPrint);
                }

                public Copy setQuotaUser(string quotaUser) {
                    return cast(Copy) super.setQuotaUser(quotaUser);
                }

                public Copy setUserIp(string userIp) {
                    return cast(Copy) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Copy setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /**
            * Deprecated. Copying files into multiple folders is no longer supported. Use shortcuts
            * instead.
            */
            private Nullable!bool enforceSingleParent;

            /** Deprecated. Copying files into multiple folders is no longer supported. Use shortcuts instead.
            [default: false]
            */
            public bool getEnforceSingleParent() {
                return enforceSingleParent.get;
            }

            /**
            * Deprecated. Copying files into multiple folders is no longer supported. Use shortcuts
            * instead.
            */
            public Copy setEnforceSingleParent(bool enforceSingleParent) {
                this.enforceSingleParent = enforceSingleParent.nullable;
                return cast(Copy) super.addQueryParams("enforceSingleParent",
                    to!(string)(enforceSingleParent));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated. Copying files into multiple folders is no longer supported. Use shortcuts instead.
            * </p>
            */
            public bool isEnforceSingleParent() {
                if (enforceSingleParent.isNull) {
                    return false;
                }
                return enforceSingleParent.get;
            }

            /**
            * Whether to ignore the domain's default visibility settings for the created file. Domain
            * administrators can choose to make all uploaded files visible to the domain by default; this
            * parameter bypasses that behavior for the request. Permissions are still inherited from
            * parent folders.
            */
            
            private Nullable!bool ignoreDefaultVisibility;

            /** Whether to ignore the domain's default visibility settings for the created file. Domain
            administrators can choose to make all uploaded files visible to the domain by default; this
            parameter bypasses that behavior for the request. Permissions are still inherited from parent
            folders. [default: false]
            */
            public bool getIgnoreDefaultVisibility() {
                return ignoreDefaultVisibility.get;
            }

            /**
            * Whether to ignore the domain's default visibility settings for the created file. Domain
            * administrators can choose to make all uploaded files visible to the domain by default; this
            * parameter bypasses that behavior for the request. Permissions are still inherited from
            * parent folders.
            */
            public Copy setIgnoreDefaultVisibility(bool ignoreDefaultVisibility) {
                this.ignoreDefaultVisibility = ignoreDefaultVisibility.nullable;
                return cast(Copy) super.addQueryParams("ignoreDefaultVisibility",
                    to!(string)(ignoreDefaultVisibility));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether to ignore the domain's default visibility settings for the created file. Domain
            administrators can choose to make all uploaded files visible to the domain by default; this
            parameter bypasses that behavior for the request. Permissions are still inherited from parent
            folders.
            * </p>
            */
            public bool isIgnoreDefaultVisibility() {
                if (ignoreDefaultVisibility.isNull) {
                    return false;
                }
                return ignoreDefaultVisibility.get;
            }

            /**
            * Specifies which additional view's permissions to include in the response. Only 'published'
            * is supported.
            */
            
            private string includePermissionsForView;

            /** Specifies which additional view's permissions to include in the response. Only 'published' is
            supported.
            */
            public string getIncludePermissionsForView() {
                return includePermissionsForView;
            }

            /**
            * Specifies which additional view's permissions to include in the response. Only 'published'
            * is supported.
            */
            public Copy setIncludePermissionsForView(string includePermissionsForView) {
                this.includePermissionsForView = includePermissionsForView;
                return cast(Copy) super.addQueryParams("includePermissionsForView",
                    includePermissionsForView);
            }

            /**
            * Whether to set the 'keepForever' field in the new head revision. This is only applicable to
            * files with binary content in Google Drive. Only 200 revisions for the file can be kept
            * forever. If the limit is reached, try deleting pinned revisions.
            */
            
            private Nullable!bool keepRevisionForever;

            /** Whether to set the 'keepForever' field in the new head revision. This is only applicable to files
            with binary content in Google Drive. Only 200 revisions for the file can be kept forever. If the
            limit is reached, try deleting pinned revisions. [default: false]
            */
            public bool getKeepRevisionForever() {
                return keepRevisionForever.get;
            }

            /**
            * Whether to set the 'keepForever' field in the new head revision. This is only applicable to
            * files with binary content in Google Drive. Only 200 revisions for the file can be kept
            * forever. If the limit is reached, try deleting pinned revisions.
            */
            public Copy setKeepRevisionForever(bool keepRevisionForever) {
                this.keepRevisionForever = keepRevisionForever.nullable;
                return cast(Copy) super.addQueryParams("keepRevisionForever",
                    to!(string)(keepRevisionForever));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>REST_PATHink Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether to set the 'keepForever' field in the new head revision. This is only applicable to files
            with binary content in Google Drive. Only 200 revisions for the file can be kept forever. If the
            limit is reached, try deleting pinned revisions.
            * </p>
            */
            public bool isKeepRevisionForever() {
                if (keepRevisionForever.isNull) {
                    return false;
                }
                return keepRevisionForever.get;
            }

            /** A language hint for OCR processing during image import (ISO 639-1 code). */
            private string ocrLanguage;

            /** A language hint for OCR processing during image import (ISO 639-1 code).
            */
            public string getOcrLanguage() {
                return ocrLanguage;
            }

            /** A language hint for OCR processing during image import (ISO 639-1 code). */
            public Copy setOcrLanguage(string ocrLanguage) {
                this.ocrLanguage = ocrLanguage;
                return cast(Copy) super.addQueryParams("ocrLanguage", ocrLanguage);
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            private Nullable!bool supportsAllDrives;

            /** Whether the requesting application supports both My Drives and shared drives. [default: false]
            */
            public bool getSupportsAllDrives() {
                return supportsAllDrives.get;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            public Copy setSupportsAllDrives(bool supportsAllDrives) {
                this.supportsAllDrives = supportsAllDrives.nullable;
                return cast(Copy) super.addQueryParams("supportsAllDrives",
                    to!(string)(supportsAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the requesting application supports both My Drives and shared drives.
            * </p>
            */
            public bool isSupportsAllDrives() {
                if (supportsAllDrives.isNull) {
                    return false;
                }
                return supportsAllDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            private Nullable!bool supportsTeamDrives;

            /** Deprecated use supportsAllDrives instead. [default: false]
            */
            public bool getSupportsTeamDrives() {
                return supportsTeamDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            public Copy setSupportsTeamDrives(bool supportsTeamDrives) {
                this.supportsTeamDrives = supportsTeamDrives.nullable;
                return cast(Copy) super.addQueryParams("supportsTeamDrives",
                    to!(string)(supportsTeamDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use supportsAllDrives instead.
            * </p>
            */
            public bool isSupportsTeamDrives() {
                if (supportsTeamDrives.isNull) {
                    return false;
                }
                return supportsTeamDrives.get;
            }

            public Copy set(T)(String parameterName, T value) {
            return cast(Copy) super.addQueryParams(parameterName,
                to!(string)(value));
            }

            public gdrive.models.File.File execute() {
                return super.exec!"POST"();
            }
        }

        public Create!(Request, Response) create(gdrive.models.File.File content) {
            Create!(Request, Response) result = new Create!(Request, Response)(content);
            initialize!(Request, Response, Create)(result);
            return result;
        }

        public Create!(Request, Response) create(gdrive.models.File.File content,
            string mediaContent) {
            Create!(Request, Response) result = new Create!(Request, Response)(content, mediaContent);
            initialize!(Request, Response, Create)(result);
            return result;
        }

        public class Create(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.File.File, RequestT, ResponseT) {
            private static const string REST_PATH = "files";

            protected this(InputStream = string)(gdrive.models.File.File content, InputStream mediaContent) {
                string url = Drive.DEFAULT_ROOT_URL ~ "/upload" ~ Drive.DEFAULT_SERVICE_PATH ~ REST_PATH;
                super(url, string[string].init);
                this.body = content;
                this.mediaContent = mediaContent;
            }

            protected this(gdrive.models.File.File content) {
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ REST_PATH;
                super(url, string[string].init);
                this.body = content;
            }

            override {
                public Create setAlt(string alt) {
                    return cast(Create) super.setAlt(alt);
                }

                public Create setFields(string fields) {
                    return cast(Create) super.setFields(fields);
                }

                public Create setKey(string key) {
                    return cast(Create) super.setKey(key);
                }

                public Create setOauthToken(string oauthToken) {
                    return cast(Create) super.setOauthToken(oauthToken);
                }

                public Create setPrettyPrint(bool prettyPrint) {
                    return cast(Create) super.setPrettyPrint(prettyPrint);
                }

                public Create setQuotaUser(string quotaUser) {
                    return cast(Create) super.setQuotaUser(quotaUser);
                }

                public Create setUserIp(string userIp) {
                    return cast(Create) super.setUserIp(userIp);
                }
            }

            /** Deprecated. Creating files in multiple folders is no longer supported. */
            private Nullable!bool enforceSingleParent;

            /** Deprecated. Creating files in multiple folders is no longer supported. [default: false]
            */
            public bool getEnforceSingleParent() {
                return enforceSingleParent.get;
            }

            /** Deprecated. Creating files in multiple folders is no longer supported. */
            public Create setEnforceSingleParent(bool enforceSingleParent) {
                this.enforceSingleParent = enforceSingleParent.nullable;
                return cast(Create) super.addQueryParams("enforceSingleParent",
                    to!(string)(enforceSingleParent));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated. Creating files in multiple folders is no longer supported.
            * </p>
            */
            public bool isEnforceSingleParent() {
                if (enforceSingleParent.isNull) {
                    return false;
                }
                return enforceSingleParent.get;
            }

            /**
            * Whether to ignore the domain's default visibility settings for the created file. Domain
            * administrators can choose to make all uploaded files visible to the domain by default; this
            * parameter bypasses that behavior for the request. Permissions are still inherited from
            * parent folders.
            */
            private Nullable!bool ignoreDefaultVisibility;

            /** Whether to ignore the domain's default visibility settings for the created file. Domain
            administrators can choose to make all uploaded files visible to the domain by default; this
            parameter bypasses that behavior for the request. Permissions are still inherited from parent
            folders. [default: false]
            */
            public bool getIgnoreDefaultVisibility() {
                return ignoreDefaultVisibility.get;
            }

            /**
            * Whether to ignore the domain's default visibility settings for the created file. Domain
            * administrators can choose to make all uploaded files visible to the domain by default; this
            * parameter bypasses that behavior for the request. Permissions are still inherited from
            * parent folders.
            */
            public Create setIgnoreDefaultVisibility(bool ignoreDefaultVisibility) {
                this.ignoreDefaultVisibility = ignoreDefaultVisibility;
                return cast(Create) super.addQueryParams("ignoreDefaultVisibility",
                    to!(string)(ignoreDefaultVisibility));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether to ignore the domain's default visibility settings for the created file. Domain
            administrators can choose to make all uploaded files visible to the domain by default; this
            parameter bypasses that behavior for the request. Permissions are still inherited from parent
            folders.
            * </p>
            */
            public bool isIgnoreDefaultVisibility() {
                if (ignoreDefaultVisibility.isNull) {
                    return false;
                }
                return ignoreDefaultVisibility.get;
            }

            /**
            * Specifies which additional view's permissions to include in the response. Only 'published'
            * is supported.
            */
            private string includePermissionsForView;

            /** Specifies which additional view's permissions to include in the response. Only 'published' is
            supported.
            */
            public string getIncludePermissionsForView() {
                return includePermissionsForView;
            }

            /**
            * Specifies which additional view's permissions to include in the response. Only 'published'
            * is supported.
            */
            public Create setIncludePermissionsForView(string includePermissionsForView) {
                this.includePermissionsForView = includePermissionsForView;
                return cast(Create) super.addQueryParams("includePermissionsForView",
                    includePermissionsForView);
            }

            /**
            * Whether to set the 'keepForever' field in the new head revision. This is only applicable to
            * files with binary content in Google Drive. Only 200 revisions for the file can be kept
            * forever. If the limit is reached, try deleting pinned revisions.
            */
            private Nullable!bool keepRevisionForever;

            /** Whether to set the 'keepForever' field in the new head revision. This is only applicable to files
            with binary content in Google Drive. Only 200 revisions for the file can be kept forever. If the
            limit is reached, try deleting pinned revisions. [default: false]
            */
            public bool getKeepRevisionForever() {
                return keepRevisionForever.get;
            }

            /**
            * Whether to set the 'keepForever' field in the new head revision. This is only applicable to
            * files with binary content in Google Drive. Only 200 revisions for the file can be kept
            * forever. If the limit is reached, try deleting pinned revisions.
            */
            public Create setKeepRevisionForever(bool keepRevisionForever) {
                this.keepRevisionForever = keepRevisionForever;
                return cast(Create) super.addQueryParams("keepRevisionForever",
                    to!(string)(keepRevisionForever));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether to set the 'keepForever' field in the new head revision. This is only applicable to files
            with binary content in Google Drive. Only 200 revisions for the file can be kept forever. If the
            limit is reached, try deleting pinned revisions.
            * </p>
            */
            public bool isKeepRevisionForever() {
                if (keepRevisionForever.isNull) {
                    return false;
                }
                return keepRevisionForever.get;
            }

            /** A language hint for OCR processing during image import (ISO 639-1 code). */
            private string ocrLanguage;

            /** A language hint for OCR processing during image import (ISO 639-1 code).
            */
            public string getOcrLanguage() {
                return ocrLanguage;
            }

            /** A language hint for OCR processing during image import (ISO 639-1 code). */
            public Create setOcrLanguage(string ocrLanguage) {
                this.ocrLanguage = ocrLanguage;
                return cast(Create) super.addQueryParams("ocrLanguage",
                    ocrLanguage);
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            private Nullable!bool supportsAllDrives;

            /** Whether the requesting application supports both My Drives and shared drives. [default: false]
            */
            public bool getSupportsAllDrives() {
                return supportsAllDrives.get;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            public Create setSupportsAllDrives(bool supportsAllDrives) {
                this.supportsAllDrives = supportsAllDrives;
                return cast(Create) super.addQueryParams("supportsAllDrives",
                    to!(string)(supportsAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the requesting application supports both My Drives and shared drives.
            * </p>
            */
            public bool isSupportsAllDrives() {
                if (supportsAllDrives.isNull) {
                    return false;
                }
                return supportsAllDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            private Nullable!bool supportsTeamDrives;

            /** Deprecated use supportsAllDrives instead. [default: false]
            */
            public bool getSupportsTeamDrives() {
                return supportsTeamDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            public Create setSupportsTeamDrives(bool supportsTeamDrives) {
                this.supportsTeamDrives = supportsTeamDrives;
                return cast(Create) super.addQueryParams("supportsTeamDrives",
                    to!(string)(supportsTeamDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use supportsAllDrives instead.
            * </p>
            */
            public bool isSupportsTeamDrives() {
                if (supportsTeamDrives.isNull) {
                    return false;
                }
                return supportsTeamDrives.get;
            }

            /** Whether to use the uploaded content as indexable text. */
            private Nullable!bool useContentAsIndexableText;

            /** Whether to use the uploaded content as indexable text. [default: false]
            */
            public bool getUseContentAsIndexableText() {
                return useContentAsIndexableText.get;
            }

            /** Whether to use the uploaded content as indexable text. */
            public Create setUseContentAsIndexableText(bool useContentAsIndexableText) {
                this.useContentAsIndexableText = useContentAsIndexableText;
                return cast(Create) super.addQueryParams("useContentAsIndexableText",
                    to!(string)(useContentAsIndexableText));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether to use the uploaded content as indexable text.
            * </p>
            */
            public bool isUseContentAsIndexableText() {
                if (useContentAsIndexableText.isNull) {
                    return false;
                }
                return useContentAsIndexableText.get;
            }

            public Create set(T)(string parameterName, T value) {
                return cast(Create) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            string mediaContent;

            public gdrive.models.File.File execute() {
                if (this.mediaContent == string.init) {
                    return super.exec!"POST"();
                } else {
                    return super.upload!"POST"(mediaContent);
                }
            }
        }

        public Delete!(Request, Response) deleteFile(string fileId) {
            Delete!(Request, Response) result = new Delete!(Request, Response)(fileId);
            initialize!(Request, Response, Delete)(result);
            return result;
        }

        public class Delete(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.File.File, RequestT, ResponseT) {
            private static const string REST_PATH = "files/%s";

            protected this(string fileId) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                setFileId(fileId);
            }

            override {
                public Delete setAlt(string alt) {
                    return cast(Delete) super.setAlt(alt);
                }

                public Delete setFields(string fields) {
                    return cast(Delete) super.setFields(fields);
                }

                public Delete setKey(string key) {
                    return cast(Delete) super.setKey(key);
                }

                public Delete setOauthToken(string oauthToken) {
                    return cast(Delete) super.setOauthToken(oauthToken);
                }

                public Delete setPrettyPrint(bool prettyPrint) {
                    return cast(Delete) super.setPrettyPrint(prettyPrint);
                }

                public Delete setQuotaUser(string quotaUser) {
                    return cast(Delete) super.setQuotaUser(quotaUser);
                }

                public Delete setUserIp(string userIp) {
                    return cast(Delete) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Delete setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /**
            * Deprecated. If an item is not in a shared drive and its last parent is deleted but the item
            * itself is not, the item will be placed under its owner's root.
            */
            
            private Nullable!bool enforceSingleParent;

            /** Deprecated. If an item is not in a shared drive and its last parent is deleted but the item itself
            is not, the item will be placed under its owner's root. [default: false]
            */
            public bool getEnforceSingleParent() {
                return enforceSingleParent.get;
            }

            /**
            * Deprecated. If an item is not in a shared drive and its last parent is deleted but the item
            * itself is not, the item will be placed under its owner's root.
            */
            public Delete setEnforceSingleParent(bool enforceSingleParent) {
                this.enforceSingleParent = enforceSingleParent.nullable;
                return cast(Delete) super.addQueryParams("enforceSingleParent",
                    to!(string)(enforceSingleParent));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated. If an item is not in a shared drive and its last parent is deleted but the item itself
            is not, the item will be placed under its owner's root.
            * </p>
            */
            public bool isEnforceSingleParent() {
                if (enforceSingleParent.isNull) {
                    return false;
                }
                return enforceSingleParent.get;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            
            private Nullable!bool supportsAllDrives;

            /** Whether the requesting application supports both My Drives and shared drives. [default: false]
            */
            public bool getSupportsAllDrives() {
                return supportsAllDrives.get;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            public Delete setSupportsAllDrives(bool supportsAllDrives) {
                this.supportsAllDrives = supportsAllDrives.nullable;
                return cast(Delete) super.addQueryParams("supportsAllDrives",
                    to!(string)(supportsAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the requesting application supports both My Drives and shared drives.
            * </p>
            */
            public bool isSupportsAllDrives() {
                if (supportsAllDrives.isNull) {
                    return false;
                }
                return supportsAllDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            
            private Nullable!bool supportsTeamDrives;

            /** Deprecated use supportsAllDrives instead. [default: false]
            */
            public bool getSupportsTeamDrives() {
                return supportsTeamDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            public Delete setSupportsTeamDrives(bool supportsTeamDrives) {
                this.supportsTeamDrives = supportsTeamDrives.nullable;
                return cast(Delete) super.addQueryParams("supportsTeamDrives",
                    to!(string)(supportsTeamDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use supportsAllDrives instead.
            * </p>
            */
            public bool isSupportsTeamDrives() {
                if (supportsTeamDrives.isNull) {
                    return false;
                }
                return supportsTeamDrives.get;
            }

            public Delete set(T)(String parameterName, T value) {
                return cast(Delete) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            public gdrive.models.File.File execute() {
                return super.exec!"DELETE"();
            }
        }

        public EmptyTrash!(Request, Response) emptyTrash() {
            EmptyTrash!(Request, Response) result = new EmptyTrash!(Request, Response)();
            initialize!(Request, Response, EmptyTrash)(result);
            return result;
        }

        public class EmptyTrash(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.File.File, RequestT, ResponseT) {
            private static const string REST_PATH = "files/trash";

            protected this() {
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ REST_PATH;
                super(url, string[string].init);
            }

            override {
                public EmptyTrash setAlt(string alt) {
                    return cast(EmptyTrash) super.setAlt(alt);
                }

                public EmptyTrash setFields(string fields) {
                    return cast(EmptyTrash) super.setFields(fields);
                }

                public EmptyTrash setKey(string key) {
                    return cast(EmptyTrash) super.setKey(key);
                }

                public EmptyTrash setOauthToken(string oauthToken) {
                    return cast(EmptyTrash) super.setOauthToken(oauthToken);
                }

                public EmptyTrash setPrettyPrint(bool prettyPrint) {
                    return cast(EmptyTrash) super.setPrettyPrint(prettyPrint);
                }

                public EmptyTrash setQuotaUser(string quotaUser) {
                    return cast(EmptyTrash) super.setQuotaUser(quotaUser);
                }

                public EmptyTrash setUserIp(string userIp) {
                    return cast(EmptyTrash) super.setUserIp(userIp);
                }
            }

            /**
            * Deprecated. If an item is not in a shared drive and its last parent is deleted but the item
            * itself is not, the item will be placed under its owner's root.
            */
            
            private Nullable!bool enforceSingleParent;

            /** Deprecated. If an item is not in a shared drive and its last parent is deleted but the item itself
            is not, the item will be placed under its owner's root. [default: false]
            */
            public bool getEnforceSingleParent() {
                return enforceSingleParent.get;
            }

            /**
            * Deprecated. If an item is not in a shared drive and its last parent is deleted but the item
            * itself is not, the item will be placed under its owner's root.
            */
            public EmptyTrash setEnforceSingleParent(bool enforceSingleParent) {
                this.enforceSingleParent = enforceSingleParent.nullable;
                return cast(EmptyTrash) super.addQueryParams("enforceSingleParent",
                    to!(string)(enforceSingleParent));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated. If an item is not in a shared drive and its last parent is deleted but the item itself
            is not, the item will be placed under its owner's root.
            * </p>
            */
            public bool isEnforceSingleParent() {
                if (enforceSingleParent.isNull) {
                    return false;
                }
                return enforceSingleParent.get;
            }

            public EmptyTrash set(T)(String parameterName, T value) {
                return cast(EmptyTrash) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            public void execute() {
                super.exec!"DELETE"();
            }
        }

        public Export!(Request, Response) exportFile(string fileId, string mimeType) {
            Export!(Request, Response) result = new Export!(Request, Response)(fileId, mimeType);
            initialize!(Request, Response, Export)(result);
            return result;
        }

        public class Export(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.File.File, RequestT, ResponseT) {
            private static const string REST_PATH = "files/%s/export";

            protected this(string fileId, string mimeType) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.fileId = fileId;
                setMimeType(mimeType);
            }

            override {
                public Export setAlt(string alt) {
                    return cast(Export) super.setAlt(alt);
                }

                public Export setFields(string fields) {
                    return cast(Export) super.setFields(fields);
                }

                public Export setKey(string key) {
                    return cast(Export) super.setKey(key);
                }

                public Export setOauthToken(string oauthToken) {
                    return cast(Export) super.setOauthToken(oauthToken);
                }

                public Export setPrettyPrint(bool prettyPrint) {
                    return cast(Export) super.setPrettyPrint(prettyPrint);
                }

                public Export setQuotaUser(string quotaUser) {
                    return cast(Export) super.setQuotaUser(quotaUser);
                }

                public Export setUserIp(string userIp) {
                    return cast(Export) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Export setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /** The MIME type of the format requested for this export. */
            private string mimeType;

            /** The MIME type of the format requested for this export.
            */
            public string getMimeType() {
                return mimeType;
            }

            /** The MIME type of the format requested for this export. */
            public Export setMimeType(string mimeType) {
                this.mimeType = mimeType;
                return cast(Export) super.addQueryParams("mimeType", mimeType);
            }

            public Export set(T)(String parameterName, T value) {
                return cast(Export) super.set(parameterName,
                    to!(string)(value));
            }

            public void executeMediaAndDownloadTo(OutputStream = OutputRange)(ref OutputStream outputStream)
            if (isOutputRange!(OutputStream, byte)) {
                outputStream.put(super.execUnparsed!"GET"());
            }
        }

        public GenerateIds!(Request, Response) generateIds() {
            GenerateIds!(Request, Response) result = new GenerateIds!(Request, Response)();
            initialize!(Request, Response, GenerateIds)(result);
            return result;
        }

        public class GenerateIds(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.generatedIds.GeneratedIds, RequestT, ResponseT) {
            private static const string REST_PATH = "files/generateIds";

            protected this() {
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ REST_PATH;
                super(url, string[string].init);
            }

            override {
                public GenerateIds setAlt(string alt) {
                return cast(GenerateIds) super.setAlt(alt);
                }

                public GenerateIds setFields(string fields) {
                    return cast(GenerateIds) super.setFields(fields);
                }

                public GenerateIds setKey(string key) {
                    return cast(GenerateIds) super.setKey(key);
                }

                public GenerateIds setOauthToken(string oauthToken) {
                    return cast(GenerateIds) super.setOauthToken(oauthToken);
                }

                public GenerateIds setPrettyPrint(bool prettyPrint) {
                    return cast(GenerateIds) super.setPrettyPrint(prettyPrint);
                }

                public GenerateIds setQuotaUser(string quotaUser) {
                    return cast(GenerateIds) super.setQuotaUser(quotaUser);
                }

                public GenerateIds setUserIp(string userIp) {
                    return cast(GenerateIds) super.setUserIp(userIp);
                }
            }

            /** The number of IDs to return. */
            private int count;

            /** The number of IDs to return. [default: 10] [minimum: 1] [maximum: 1000]
            */
            public int getCount() {
                return count;
            }

            /** The number of IDs to return. */
            public GenerateIds setCount(int count) {
                this.count = count;
                return cast(GenerateIds) super.addQueryParams("count",
                    to!(string)(count));
            }

            /**
            * The space in which the IDs can be used to create new files. Supported values are 'drive'
            * and 'appDataFolder'.
            */
            private string space;

            /** The space in which the IDs can be used to create new files. Supported values are 'drive' and
            'appDataFolder'. [default: drive]
            */
            public string getSpace() {
                return space;
            }

            /**
            * The space in which the IDs can be used to create new files. Supported values are 'drive'
            * and 'appDataFolder'.
            */
            public GenerateIds setSpace(string space) {
                this.space = space;
                return cast(GenerateIds) super.addQueryParams("space", space);
            }

            public GenerateIds set(T)(String parameterName, T value) {
                return cast(GenerateIds) super.set(parameterName,
                    to!(string)(value));
            }

            public gdrive.models.generatedIds.GeneratedIds execute() {
                return super.exec!"GET"();
            }
        }

        public Get!(Request, Response) get(string fileId) {
            Get!(Request, Response) result = new Get!(Request, Response)(fileId);
            initialize!(Request, Response, Get)(result);
            return result;
        }

        public class Get(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.File.File, RequestT, ResponseT) {
            private static const string REST_PATH = "files/%s";

            protected this(string fileId) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
            }

            override {
                public Get setAlt(string alt) {
                    return cast(Get) super.setAlt(alt);
                }

                public Get setFields(string fields) {
                    return cast(Get) super.setFields(fields);
                }

                public Get setKey(string key) {
                    return cast(Get) super.setKey(key);
                }

                public Get setOauthToken(string oauthToken) {
                    return cast(Get) super.setOauthToken(oauthToken);
                }

                public Get setPrettyPrint(bool prettyPrint) {
                    return cast(Get) super.setPrettyPrint(prettyPrint);
                }

                public Get setQuotaUser(string quotaUser) {
                    return cast(Get) super.setQuotaUser(quotaUser);
                }

                public Get setUserIp(string userIp) {
                    return cast(Get) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Get setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /**
            * Whether the user is acknowledging the risk of downloading known malware or other abusive
            * files. This is only applicable when alt=media.
            */
            private Nullable!bool acknowledgeAbuse;

            /** Whether the user is acknowledging the risk of downloading known malware or other abusive files.
            This is only applicable when alt=media. [default: false]
            */
            public bool getAcknowledgeAbuse() {
                return acknowledgeAbuse.get;
            }

            /**
            * Whether the user is acknowledging the risk of downloading known malware or other abusive
            * files. This is only applicable when alt=media.
            */
            public Get setAcknowledgeAbuse(bool acknowledgeAbuse) {
                this.acknowledgeAbuse = acknowledgeAbuse.nullable;
                return cast(Get) super.addQueryParams("acknowledgeAbuse",
                    to!(string)(acknowledgeAbuse));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the user is acknowledging the risk of downloading known malware or other abusive files.
            This is only applicable when alt=media.
            * </p>
            */
            public bool isAcknowledgeAbuse() {
                if (acknowledgeAbuse.isNull) {
                    return false;
                }
                return acknowledgeAbuse.get;
            }

            /**
            * Specifies which additional view's permissions to include in the response. Only 'published'
            * is supported.
            */
            
            private string includePermissionsForView;

            /** Specifies which additional view's permissions to include in the response. Only 'published' is
            supported.
            */
            public string getIncludePermissionsForView() {
                return includePermissionsForView;
            }

            /**
            * Specifies which additional view's permissions to include in the response. Only 'published'
            * is supported.
            */
            public Get setIncludePermissionsForView(string includePermissionsForView) {
                this.includePermissionsForView = includePermissionsForView;
                return cast(Get) super.addQueryParams("includePermissionsForView",
                    includePermissionsForView);
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            
            private Nullable!bool supportsAllDrives;

            /** Whether the requesting application supports both My Drives and shared drives. [default: false]
            */
            public bool getSupportsAllDrives() {
                return supportsAllDrives.get;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            public Get setSupportsAllDrives(bool supportsAllDrives) {
                this.supportsAllDrives = supportsAllDrives.nullable;
                return cast(Get) super.addQueryParams("supportsAllDrives",
                    to!(string)(supportsTeamDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the requesting application supports both My Drives and shared drives.
            * </p>
            */
            public bool isSupportsAllDrives() {
                if (supportsAllDrives.isNull) {
                    return false;
                }
                return supportsAllDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            private Nullable!bool supportsTeamDrives;

            /** Deprecated use supportsAllDrives instead. [default: false]
            */
            public bool getSupportsTeamDrives() {
                return supportsTeamDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            public Get setSupportsTeamDrives(bool supportsTeamDrives) {
                this.supportsTeamDrives = supportsTeamDrives.nullable;
                return cast(Get) super.addQueryParams("supportsTeamDrives",
                    to!(string)(supportsTeamDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use supportsAllDrives instead.
            * </p>
            */
            public bool isSupportsTeamDrives() {
                if (supportsTeamDrives.isNull) {
                    return false;
                }
                return supportsTeamDrives.get;
            }

            public Get set(T)(String parameterName, T value) {
                return cast(Get) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            import std.range;
            public void executeMediaAndDowloadTo(OutputStream = OutputRange)
                (OutputStream outputStream)
            if (isOutputRange!(OutputStream, byte)) {
                setAlt("media");
                outputStream.put(super.execUnparsed!"GET"());
            }

            public gdrive.models.File.File execute()() {
                return super.exec!"GET"();
            }
        }

        public List!(Request, Response) list() {
            List!(Request, Response) result = new List!(Request, Response)();
            initialize!(Request, Response, List)(result);
            return result;
        }

        public class List(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.filelist.FileList, RequestT, ResponseT) {
            private static const string REST_PATH = "files";

            protected this() {
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ REST_PATH;
                super(url, string[string].init);
            }

            override {
                public List setAlt(string alt) {
                    return cast(List) super.setAlt(alt);
                }

                public List setFields(string fields) {
                    return cast(List) super.setFields(fields);
                }

                public List setKey(string key) {
                    return cast(List) super.setKey(key);
                }

                public List setOauthToken(string oauthToken) {
                    return cast(List) super.setOauthToken(oauthToken);
                }

                public List setPrettyPrint(bool prettyPrint) {
                    return cast(List) super.setPrettyPrint(prettyPrint);
                }

                public List setQuotaUser(string quotaUser) {
                    return cast(List) super.setQuotaUser(quotaUser);
                }

                public List setUserIp(string userIp) {
                    return cast(List) super.setUserIp(userIp);
                }
            }

            /**
            * Groupings of files to which the query applies. Supported groupings are: 'user' (files
            * created by, opened by, or shared directly with the user), 'drive' (files in the specified
            * shared drive as indicated by the 'driveId'), 'domain' (files shared to the user's domain),
            * and 'allDrives' (A combination of 'user' and 'drive' for all drives where the user is a
            * member). When able, use 'user' or 'drive', instead of 'allDrives', for efficiency.
            */
            private string corpora;

            /** Groupings of files to which the query applies. Supported groupings are: 'user' (files created by,
            opened by, or shared directly with the user), 'drive' (files in the specified shared drive as
            indicated by the 'driveId'), 'domain' (files shared to the user's domain), and 'allDrives' (A
            combination of 'user' and 'drive' for all drives where the user is a member). When able, use 'user'
            or 'drive', instead of 'allDrives', for efficiency.
            */
            public string getCorpora() {
                return corpora;
            }

            /**
            * Groupings of files to which the query applies. Supported groupings are: 'user' (files
            * created by, opened by, or shared directly with the user), 'drive' (files in the specified
            * shared drive as indicated by the 'driveId'), 'domain' (files shared to the user's domain),
            * and 'allDrives' (A combination of 'user' and 'drive' for all drives where the user is a
            * member). When able, use 'user' or 'drive', instead of 'allDrives', for efficiency.
            */
            public List setCorpora(string corpora) {
                this.corpora = corpora;
                return cast(List) super.addQueryParams("corpora", corpora);
            }

            /**
            * The body of items (files/documents) to which the query applies. Deprecated: use 'corpora'
            * instead.
            */
            private string corpus;

            /** The body of items (files/documents) to which the query applies. Deprecated: use 'corpora' instead.
            */
            public string getCorpus() {
                return corpus;
            }

            /**
            * The body of items (files/documents) to which the query applies. Deprecated: use 'corpora'
            * instead.
            */
            public List setCorpus(string corpus) {
                this.corpus = corpus;
                return cast(List) super.addQueryParams("corpus", corpus);
            }

            /** ID of the shared drive to search. */
            private string driveId;

            /** ID of the shared drive to search.
            */
            public string getDriveId() {
                return driveId;
            }

            /** ID of the shared drive to search. */
            public List setDriveId(string driveId) {
                this.driveId = driveId;
                return this;
            }

            /** Whether both My Drive and shared drive items should be included in results. */
            private Nullable!bool includeItemsFromAllDrives;

            /** Whether both My Drive and shared drive items should be included in results. [default: false]
            */
            public bool getIncludeItemsFromAllDrives() {
                return includeItemsFromAllDrives.get;
            }

            /** Whether both My Drive and shared drive items should be included in results. */
            public List setIncludeItemsFromAllDrives(bool includeItemsFromAllDrives) {
                this.includeItemsFromAllDrives = includeItemsFromAllDrives.nullable;
                return cast(List) super.addQueryParams("includeItemsFromAllDrives",
                    to!(string)(includeItemsFromAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether both My Drive and shared drive items should be included in results.
            * </p>
            */
            public bool isIncludeItemsFromAllDrives() {
                if (includeItemsFromAllDrives.isNull) {
                    return false;
                }
                return includeItemsFromAllDrives.get;
            }

            /**
            * Specifies which additional view's permissions to include in the response. Only 'published'
            * is supported.
            */
            private string includePermissionsForView;

            /** Specifies which additional view's permissions to include in the response. Only 'published' is
            supported.
            */
            public string getIncludePermissionsForView() {
                return includePermissionsForView;
            }

            /**
            * Specifies which additional view's permissions to include in the response. Only 'published'
            * is supported.
            */
            public List setIncludePermissionsForView(string includePermissionsForView) {
                this.includePermissionsForView = includePermissionsForView;
                return cast(List) super.addQueryParams("includePermissionsForView",
                    includePermissionsForView);
            }

            /** Deprecated use includeItemsFromAllDrives instead. */
            private Nullable!bool includeTeamDriveItems;

            /** Deprecated use includeItemsFromAllDrives instead. [default: false]
            */
            public bool getIncludeTeamDriveItems() {
                return includeTeamDriveItems.get;
            }

            /** Deprecated use includeItemsFromAllDrives instead. */
            public List setIncludeTeamDriveItems(bool includeTeamDriveItems) {
                this.includeTeamDriveItems = includeTeamDriveItems.nullable;
                return cast(List) super.addQueryParams("includeTeamDriveItems",
                    to!(string)(includeTeamDriveItems));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use includeItemsFromAllDrives instead.
            * </p>
            */
            public bool isIncludeTeamDriveItems() {
                if (includeTeamDriveItems.isNull) {
                    return false;
                }
                return includeTeamDriveItems.get;
            }

            /**
            * The maximum number of files to return per page. Partial or empty result pages are possible
            * even before the end of the files list has been reached.
            */
            private int maxResults;

            /** The maximum number of files to return per page. Partial or empty result pages are possible even
            before the end of the files list has been reached. [default: 100] [minimum: 0]
            */
            public int getMaxResults() {
                return maxResults;
            }

            /**
            * The maximum number of files to return per page. Partial or empty result pages are possible
            * even before the end of the files list has been reached.
            */
            public List setMaxResults(int maxResults) {
                this.maxResults = maxResults;
                return cast(List) super.addQueryParams("maxResults",
                    to!(string)(maxResults));
            }

            /**
            * A comma-separated list of sort keys. Valid keys are 'createdDate', 'folder',
            * 'lastViewedByMeDate', 'modifiedByMeDate', 'modifiedDate', 'quotaBytesUsed', 'recency',
            * 'sharedWithMeDate', 'starred', 'title', and 'title_natural'. Each key sorts ascending by
            * default, but may be reversed with the 'desc' modifier. Example usage:
            * ?orderBy=folder,modifiedDate desc,title. Please note that there is a current limitation for
            * users with approximately one million files in which the requested sort order is ignored.
            */
            private string orderBy;

            /** A comma-separated list of sort keys. Valid keys are 'createdDate', 'folder', 'lastViewedByMeDate',
            'modifiedByMeDate', 'modifiedDate', 'quotaBytesUsed', 'recency', 'sharedWithMeDate', 'starred',
            'title', and 'title_natural'. Each key sorts ascending by default, but may be reversed with the
            'desc' modifier. Example usage: ?orderBy=folder,modifiedDate desc,title. Please note that there is
            a current limitation for users with approximately one million files in which the requested sort
            order is ignored.
            */
            public string getOrderBy() {
                return orderBy;
            }

            /**
            * A comma-separated list of sort keys. Valid keys are 'createdDate', 'folder',
            * 'lastViewedByMeDate', 'modifiedByMeDate', 'modifiedDate', 'quotaBytesUsed', 'recency',
            * 'sharedWithMeDate', 'starred', 'title', and 'title_natural'. Each key sorts ascending by
            * default, but may be reversed with the 'desc' modifier. Example usage:
            * ?orderBy=folder,modifiedDate desc,title. Please note that there is a current limitation for
            * users with approximately one million files in which the requested sort order is ignored.
            */
            public List setOrderBy(string orderBy) {
                this.orderBy = orderBy;
                return cast(List) super.addQueryParams("orderBy", orderBy);
            }

            /** Page token for files. */
            private string pageToken;

            /** Page token for files.
            */
            public string getPageToken() {
                return pageToken;
            }

            /** Page token for files. */
            public List setPageToken(string pageToken) {
                this.pageToken = pageToken;
                return cast(List) super.addQueryParams("pageToken", pageToken);
            }

            /** This parameter is deprecated and has no function. */
            private string projection;

            /** This parameter is deprecated and has no function.
            */
            public string getProjection() {
                return projection;
            }

            /** This parameter is deprecated and has no function. */
            public List setProjection(string projection) {
                this.projection = projection;
                return cast(List) super.addQueryParams("projection", projection);
            }

            /** Query string for searching files. */
            private string q;

            /** Query string for searching files.
            */
            public string getQ() {
                return q;
            }

            /** Query string for searching files. */
            public List setQ(string q) {
                this.q = q;
                return cast(List) super.addQueryParams("q", q);
            }

            /**
            * A comma-separated list of spaces to query. Supported values are 'drive', 'appDataFolder'
            * and 'photos'.
            */
            private string spaces;

            /** A comma-separated list of spaces to query. Supported values are 'drive', 'appDataFolder' and
            'photos'.
            */
            public string getSpaces() {
                return spaces;
            }

            /**
            * A comma-separated list of spaces to query. Supported values are 'drive', 'appDataFolder'
            * and 'photos'.
            */
            public List setSpaces(string spaces) {
                this.spaces = spaces;
                return cast(List) super.addQueryParams("spaces", spaces);
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            private Nullable!bool supportsAllDrives;

            /** Whether the requesting application supports both My Drives and shared drives. [default: false]
            */
            public bool getSupportsAllDrives() {
                return supportsAllDrives.get;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            public List setSupportsAllDrives(bool supportsAllDrives) {
                this.supportsAllDrives = supportsAllDrives.nullable;
                return cast(List) super.addQueryParams("supportsAllDrives",
                    to!(string)(supportsAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the requesting application supports both My Drives and shared drives.
            * </p>
            */
            public bool isSupportsAllDrives() {
                if (supportsAllDrives.isNull) {
                    return false;
                }
                return supportsAllDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            private Nullable!bool supportsTeamDrives;

            /** Deprecated use supportsAllDrives instead. [default: false]
            */
            public bool getSupportsTeamDrives() {
                return supportsTeamDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            public List setSupportsTeamDrives(bool supportsTeamDrives) {
                this.supportsTeamDrives = supportsTeamDrives.nullable;
                return cast(List) super.addQueryParams("supportsTeamDrives",
                    to!(string)(supportsTeamDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use supportsAllDrives instead.
            * </p>
            */
            public bool isSupportsTeamDrives() {
                if (supportsTeamDrives.isNull) {
                    return false;
                }
                return supportsTeamDrives.get;
            }

            /** Deprecated use driveId instead. */
            private string teamDriveId;

            /** Deprecated use driveId instead.
            */
            public string getTeamDriveId() {
                return teamDriveId;
            }

            /** Deprecated use driveId instead. */
            public List setTeamDriveId(string teamDriveId) {
                this.teamDriveId = teamDriveId;
                return cast(List) super.addQueryParams("teamDriveId", teamDriveId);
            }

            public List set(T)(string parameterName, T value) {
                return cast(List) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            public gdrive.models.filelist.FileList execute() {
                return super.exec!"GET"();
            }
        }

        public Update!(Request, Response) update(string fileId, gdrive.models.File.File content) {
            Update!(Request, Response) result = new Update!(Request, Response)(fileId, content);
            initialize!(Request, Response, Update)(result);
            return result;
        }

        public auto update
            (string fileId, gdrive.models.File.File content, string mediaContent) {
            Update!(Request, Response) result = new Update!(Request, Response)
                (fileId, content, mediaContent);
            initialize!(Request, Response, Update)(result);
            return result;
        }

        public class Update(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.File.File, RequestT, ResponseT) {
            private static const string REST_PATH = "files/%s";

            protected this(string fileId, gdrive.models.File.File content) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.body = content;
            }

            protected this(string fileId, gdrive.models.File.File content,
                string mediaContent) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId);
                string url = Drive.DEFAULT_ROOT_URL ~ "/upload" ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.body = content;
                this.mediaContent = mediaContent;
            }

            override {
                public Update setAlt(string alt) {
                    return cast(Update) super.setAlt(alt);
                }

                public Update setFields(string fields) {
                    return cast(Update) super.setFields(fields);
                }

                public Update setKey(string key) {
                    return cast(Update) super.setKey(key);
                }

                public Update setOauthToken(string oauthToken) {
                    return cast(Update) super.setOauthToken(oauthToken);
                }

                public Update setPrettyPrint(bool prettyPrint) {
                    return cast(Update) super.setPrettyPrint(prettyPrint);
                }

                public Update setQuotaUser(string quotaUser) {
                    return cast(Update) super.setQuotaUser(quotaUser);
                }

                public Update setUserIp(string userIp) {
                    return cast(Update) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Update setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /** A comma-separated list of parent IDs to add. */
            private string addParents;

            /** A comma-separated list of parent IDs to add.
            */
            public string getAddParents() {
                return addParents;
            }

            /** A comma-separated list of parent IDs to add. */
            public Update setAddParents(string addParents) {
                this.addParents = addParents;
                return cast(Update) super.addQueryParams("addParents", addParents);
            }

            /**
            * Deprecated. Adding files to multiple folders is no longer supported. Use shortcuts instead.
            */
            private Nullable!bool enforceSingleParent;

            /** Deprecated. Adding files to multiple folders is no longer supported. Use shortcuts instead.
            [default: false]
            */
            public bool getEnforceSingleParent() {
                return enforceSingleParent.get;
            }

            /**
            * Deprecated. Adding files to multiple folders is no longer supported. Use shortcuts instead.
            */
            public Update setEnforceSingleParent(bool enforceSingleParent) {
                this.enforceSingleParent = enforceSingleParent.nullable;
                return cast(Update) super.addQueryParams("enforceSingleParent",
                    to!(string)(enforceSingleParent));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated. Adding files to multiple folders is no longer supported. Use shortcuts instead.
            * </p>
            */
            public bool isEnforceSingleParent() {
                if (enforceSingleParent.isNull) {
                    return false;
                }
                return enforceSingleParent.get;
            }

            /**
            * Specifies which additional view's permissions to include in the response. Only 'published'
            * is supported.
            */
            private string includePermissionsForView;

            /** Specifies which additional view's permissions to include in the response. Only 'published' is
            supported.
            */
            public string getIncludePermissionsForView() {
                return includePermissionsForView;
            }

            /**
            * Specifies which additional view's permissions to include in the response. Only 'published'
            * is supported.
            */
            public Update setIncludePermissionsForView(string includePermissionsForView) {
                this.includePermissionsForView = includePermissionsForView;
                return cast(Update) super.addQueryParams("includePermissionsForView",
                    includePermissionsForView);
            }

            /**
            * Whether to set the 'keepForever' field in the new head revision. This is only applicable to
            * files with binary content in Google Drive. Only 200 revisions for the file can be kept
            * forever. If the limit is reached, try deleting pinned revisions.
            */
            private Nullable!bool keepRevisionForever;

            /** Whether to set the 'keepForever' field in the new head revision. This is only applicable to files
            with binary content in Google Drive. Only 200 revisions for the file can be kept forever. If the
            limit is reached, try deleting pinned revisions. [default: false]
            */
            public bool getKeepRevisionForever() {
                return keepRevisionForever.get;
            }

            /**
            * Whether to set the 'keepForever' field in the new head revision. This is only applicable to
            * files with binary content in Google Drive. Only 200 revisions for the file can be kept
            * forever. If the limit is reached, try deleting pinned revisions.
            */
            public Update setKeepRevisionForever(bool keepRevisionForever) {
                this.keepRevisionForever = keepRevisionForever.nullable;
                return cast(Update) super.addQueryParams("keepRevisionForever",
                    to!(string)(keepRevisionForever));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether to set the 'keepForever' field in the new head revision. This is only applicable to files
            with binary content in Google Drive. Only 200 revisions for the file can be kept forever. If the
            limit is reached, try deleting pinned revisions.
            * </p>
            */
            public bool isKeepRevisionForever() {
                if (keepRevisionForever.isNull) {
                    return false;
                }
                return keepRevisionForever.get;
            }

            /** A language hint for OCR processing during image import (ISO 639-1 code). */
            private string ocrLanguage;

            /** A language hint for OCR processing during image import (ISO 639-1 code).
            */
            public string getOcrLanguage() {
                return ocrLanguage;
            }

            /** A language hint for OCR processing during image import (ISO 639-1 code). */
            public Update setOcrLanguage(string ocrLanguage) {
                this.ocrLanguage = ocrLanguage;
                return cast(Update) super.addQueryParams("ocrLanguage", ocrLanguage);
            }

            /** A comma-separated list of parent IDs to remove. */
            private string removeParents;

            /** A comma-separated list of parent IDs to remove.
            */
            public string getRemoveParents() {
                return removeParents;
            }

            /** A comma-separated list of parent IDs to remove. */
            public Update setRemoveParents(string removeParents) {
                this.removeParents = removeParents;
                return cast(Update) super.addQueryParams("removeParents", removeParents);
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            private Nullable!bool supportsAllDrives;

            /** Whether the requesting application supports both My Drives and shared drives. [default: false]
            */
            public bool getSupportsAllDrives() {
                return supportsAllDrives.get;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            public Update setSupportsAllDrives(bool supportsAllDrives) {
                this.supportsAllDrives = supportsAllDrives.nullable;
                return cast(Update) super.addQueryParams("supportsAllDrives",
                    to!(string)(supportsAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the requesting application supports both My Drives and shared drives.
            * </p>
            */
            public bool isSupportsAllDrives() {
                if (supportsAllDrives.isNull) {
                    return false;
                }
                return supportsAllDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            
            private Nullable!bool supportsTeamDrives;

            /** Deprecated use supportsAllDrives instead. [default: false]
            */
            public bool getSupportsTeamDrives() {
                return supportsTeamDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            public Update setSupportsTeamDrives(bool supportsTeamDrives) {
                this.supportsTeamDrives = supportsTeamDrives.nullable;
                return cast(Update) super.addQueryParams("supportsTeamDrives",
                    to!(string)(supportsAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use supportsAllDrives instead.
            * </p>
            */
            public bool isSupportsTeamDrives() {
                if (supportsTeamDrives.isNull) {
                    return false;
                }
                return supportsTeamDrives.get;
            }

            /** Whether to use the uploaded content as indexable text. */
            private Nullable!bool useContentAsIndexableText;

            /** Whether to use the uploaded content as indexable text. [default: false]
            */
            public bool getUseContentAsIndexableText() {
                return useContentAsIndexableText.get;
            }

            /** Whether to use the uploaded content as indexable text. */
            public Update setUseContentAsIndexableText(bool useContentAsIndexableText) {
                this.useContentAsIndexableText = useContentAsIndexableText;
                return cast(Update) super.addQueryParams("useContentAsIndexableText",
                    to!(string)(useContentAsIndexableText));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether to use the uploaded content as indexable text.
            * </p>
            */
            public bool isUseContentAsIndexableText() {
                if (useContentAsIndexableText.isNull) {
                    return false;
                }
                return useContentAsIndexableText.get;
            }

            public Update set(T)(String parameterName, T value) {
                return cast(Update) super.set(parameterName,
                    to!(string)(value));
            }

            string mediaContent;

            public gdrive.models.File.File execute() {
                if (mediaContent == "") {
                    return super.exec!"PATCH"();
                } else {
                    return super.upload!("PATCH")(mediaContent);
                }
            }
        }

        public Watch!(Request, Response) watch(string fileId,
            gdrive.models.channel.Channel content) {
            Watch!(Request, Response) result = new Watch!(Request, Response)(fileId, content);
            initialize!(Request, Response, Watch)(result);
            return result;
        }

        public class Watch(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.channel.Channel, RequestT, ResponseT) {
            private static const string REST_PATH = "files/%s/watch";

            protected this(string fileId,
                gdrive.models.channel.Channel content) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.fileId = fileId;
                this.body = content;
            }

            override {
                public Watch setAlt(string alt) {
                    return cast(Watch) super.setAlt(alt);
                }

                public Watch setFields(string fields) {
                    return cast(Watch) super.setFields(fields);
                }

                public Watch setKey(string key) {
                    return cast(Watch) super.setKey(key);
                }

                public Watch setOauthToken(string oauthToken) {
                    return cast(Watch) super.setOauthToken(oauthToken);
                }

                public Watch setPrettyPrint(bool prettyPrint) {
                    return cast(Watch) super.setPrettyPrint(prettyPrint);
                }

                public Watch setQuotaUser(string quotaUser) {
                    return cast(Watch) super.setQuotaUser(quotaUser);
                }

                public Watch setUserIp(string userIp) {
                    return cast(Watch) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Watch setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /**
            * Whether the user is acknowledging the risk of downloading known malware or other abusive
            * files. This is only applicable when alt=media.
            */
            private Nullable!bool acknowledgeAbuse;

            /** Whether the user is acknowledging the risk of downloading known malware or other abusive files.
            This is only applicable when alt=media. [default: false]
            */
            public bool getAcknowledgeAbuse() {
                return acknowledgeAbuse.get;
            }

            /**
            * Whether the user is acknowledging the risk of downloading known malware or other abusive
            * files. This is only applicable when alt=media.
            */
            public Watch setAcknowledgeAbuse(bool acknowledgeAbuse) {
                this.acknowledgeAbuse = acknowledgeAbuse.nullable;
                return cast(Watch) super.addQueryParams("acknowledgeAbuse",
                    to!(string)(acknowledgeAbuse));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the user is acknowledging the risk of downloading known malware or other abusive files.
            This is only applicable when alt=media.
            * </p>
            */
            public bool isAcknowledgeAbuse() {
                if (acknowledgeAbuse.isNull) {
                    return false;
                }
                return acknowledgeAbuse.get;
            }

            /**
            * Specifies which additional view's permissions to include in the response. Only 'published'
            * is supported.
            */
            private string includePermissionsForView;

            /** Specifies which additional view's permissions to include in the response. Only 'published' is
            supported.
            */
            public string getIncludePermissionsForView() {
                return includePermissionsForView;
            }

            /**
            * Specifies which additional view's permissions to include in the response. Only 'published'
            * is supported.
            */
            public Watch setIncludePermissionsForView(string includePermissionsForView) {
                this.includePermissionsForView = includePermissionsForView;
                return cast(Watch) super.addQueryParams("includePermissionsForView",
                    includePermissionsForView);
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            private Nullable!bool supportsAllDrives;

            /** Whether the requesting application supports both My Drives and shared drives. [default: false]
            */
            public bool getSupportsAllDrives() {
                return supportsAllDrives.get;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            public Watch setSupportsAllDrives(bool supportsAllDrives) {
                this.supportsAllDrives = supportsAllDrives.nullable;
                return cast(Watch) super.addQueryParams("supportsAllDrives",
                    to!(string)(supportsAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the requesting application supports both My Drives and shared drives.
            * </p>
            */
            public bool isSupportsAllDrives() {
                if (supportsAllDrives.isNull) {
                    return false;
                }
                return supportsAllDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            private Nullable!bool supportsTeamDrives;

            /** Deprecated use supportsAllDrives instead. [default: false]
            */
            public bool getSupportsTeamDrives() {
                return supportsTeamDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            public Watch setSupportsTeamDrives(bool supportsTeamDrives) {
                this.supportsTeamDrives = supportsTeamDrives.nullable;
                return cast(Watch) super.addQueryParams("supportsTeamDrives",
                    to!(string)(supportsTeamDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use supportsAllDrives instead.
            * </p>
            */
            public bool isSupportsTeamDrives() {
                if (supportsTeamDrives.isNull) {
                    return false;
                }
                return supportsTeamDrives.get;
            }

            public Watch set(T)(string parameterName, T value) {
                return cast(Watch) super.set(parameterName,
                    to!(string)(value));
            }

            public gdrive.models.channel.Channel execute() {
                return super.exec!"POST"();
            }
        }
    }

    public Permissions permissions() {
        return new Permissions();
    }

    public class Permissions {
        public Create!(Request, Response) create(string fileId,
            gdrive.models.Permission.Permission content) {
            Create!(Request, Response) result = new Create!(Request, Response)(fileId, content);
            initialize!(Request, Response, Create)(result);
            return result;
        }

        public class Create(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.Permission.Permission, RequestT, ResponseT) {
            public static const string REST_PATH = "files/%s/permissions";

            protected this(string fileId,
                gdrive.models.Permission.Permission content) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.body = content;
                this.fileId = fileId;
            }
        
            override {
                public Create setAlt(string alt) {
                    return cast(Create) super.setAlt(alt);
                }

                public Create setFields(string fields) {
                    return cast(Create) super.setFields(fields);
                }

                public Create setKey(string key) {
                    return cast(Create) super.setKey(key);
                }

                public Create setOauthToken(string oauthToken) {
                    return cast(Create) super.setOauthToken(oauthToken);
                }

                public Create setPrettyPrint(bool prettyPrint) {
                    return cast(Create) super.setPrettyPrint(prettyPrint);
                }

                public Create setQuotaUser(string quotaUser) {
                    return cast(Create) super.setQuotaUser(quotaUser);
                }

                public Create setUserIp(string userIp) {
                    return cast(Create) super.setUserIp(userIp);
                }
            }

            /** The ID of the file or shared drive. */
            private string fileId;

            /** The ID of the file or shared drive.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file or shared drive. */
            public Create setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /** A plain text custom message to include in the notification email. */
            private string emailMessage;

            /** A plain text custom message to include in the notification email.
            */
            public string getEmailMessage() {
                return emailMessage;
            }

            /** A plain text custom message to include in the notification email. */
            public Create setEmailMessage(string emailMessage) {
                this.emailMessage = emailMessage;
                return cast(Create) super.addQueryParams("emailMessasge",
                    emailMessage);
            }

            /** Deprecated. See moveToNewOwnersRoot for details. */
            private Nullable!bool enforceSingleParent;

            /** Deprecated. See moveToNewOwnersRoot for details. [default: false]
            */
            public bool getEnforceSingleParent() {
                return enforceSingleParent.get;
            }

            /** Deprecated. See moveToNewOwnersRoot for details. */
            public Create setEnforceSingleParent(bool enforceSingleParent) {
                this.enforceSingleParent = enforceSingleParent.nullable;
                return cast(Create) super.addQueryParams("enforceSingleParent",
                    to!(string)(enforceSingleParent));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated. See moveToNewOwnersRoot for details.
            * </p>
            */
            public bool isEnforceSingleParent() {
                if (enforceSingleParent.isNull) {
                    return false;
                }
                return enforceSingleParent.get;
            }

            /**
            * This parameter will only take effect if the item is not in a shared drive and the request
            * is attempting to transfer the ownership of the item. If set to true, the item will be moved
            * to the new owner's My Drive root folder and all prior parents removed. If set to false,
            * parents are not changed.
            */
            private Nullable!bool moveToNewOwnersRoot;

            /** This parameter will only take effect if the item is not in a shared drive and the request is
            attempting to transfer the ownership of the item. If set to true, the item will be moved to the new
            owner's My Drive root folder and all prior parents removed. If set to false, parents are not
            changed. [default: false]
            */
            public bool getMoveToNewOwnersRoot() {
                return moveToNewOwnersRoot.get;
            }

            /**
            * This parameter will only take effect if the item is not in a shared drive and the request
            * is attempting to transfer the ownership of the item. If set to true, the item will be moved
            * to the new owner's My Drive root folder and all prior parents removed. If set to false,
            * parents are not changed.
            */
            public Create setMoveToNewOwnersRoot(bool moveToNewOwnersRoot) {
                this.moveToNewOwnersRoot = moveToNewOwnersRoot.nullable;
                return cast(Create) super.addQueryParams("moveToNewOwnersRoot",
                    to!(string)(moveToNewOwnersRoot));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * This parameter will only take effect if the item is not in a shared drive and the request is
            attempting to transfer the ownership of the item. If set to true, the item will be moved to the new
            owner's My Drive root folder and all prior parents removed. If set to false, parents are not
            changed.
            * </p>
            */
            public bool isMoveToNewOwnersRoot() {
                if (moveToNewOwnersRoot.isNull) {
                    return false;
                }
                return moveToNewOwnersRoot.get;
            }

            /**
            * Whether to send a notification email when sharing to users or groups. This defaults to true
            * for users and groups, and is not allowed for other requests. It must not be disabled for
            * ownership transfers.
            */
            private Nullable!bool sendNotificationEmail;

            /** Whether to send a notification email when sharing to users or groups. This defaults to true for
            users and groups, and is not allowed for other requests. It must not be disabled for ownership
            transfers.
            */
            public bool getSendNotificationEmail() {
                return sendNotificationEmail.get;
            }

            /**
            * Whether to send a notification email when sharing to users or groups. This defaults to true
            * for users and groups, and is not allowed for other requests. It must not be disabled for
            * ownership transfers.
            */
            public Create setSendNotificationEmail(bool sendNotificationEmail) {
                this.sendNotificationEmail = sendNotificationEmail.nullable;
                return cast(Create) super.addQueryParams("sendNotificationEmail",
                    to!(string)(sendNotificationEmail));
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            private Nullable!bool supportsAllDrives;

            /** Whether the requesting application supports both My Drives and shared drives. [default: false]
            */
            public bool getSupportsAllDrives() {
                return supportsAllDrives.get;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            public Create setSupportsAllDrives(bool supportsAllDrives) {
                this.supportsAllDrives = supportsAllDrives.nullable;
                return cast(Create) super.addQueryParams("supportsAllDrives",
                    to!(string)(supportsAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the requesting application supports both My Drives and shared drives.
            * </p>
            */
            public bool isSupportsAllDrives() {
                if (supportsAllDrives.isNull) {
                return false;
                }
                return supportsAllDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            private Nullable!bool supportsTeamDrives;

            /** Deprecated use supportsAllDrives instead. [default: false]
            */
            public bool getSupportsTeamDrives() {
                return supportsTeamDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            public Create setSupportsTeamDrives(bool supportsTeamDrives) {
                this.supportsTeamDrives = supportsTeamDrives.nullable;
                return cast(Create) super.addQueryParams("supportsTeamDrives",
                    to!(string)(supportsTeamDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use supportsAllDrives instead.
            * </p>
            */
            public bool isSupportsTeamDrives() {
                if (supportsTeamDrives.isNull) {
                    return false;
                }
                return supportsTeamDrives.get;
            }

            /**
            * Whether to transfer ownership to the specified user and downgrade the current owner to a
            * writer. This parameter is required as an acknowledgement of the side effect.
            */
            
            private Nullable!bool transferOwnership;

            /** Whether to transfer ownership to the specified user and downgrade the current owner to a writer.
            This parameter is required as an acknowledgement of the side effect. [default: false]
            */
            public bool getTransferOwnership() {
                return transferOwnership.get;
            }

            /**
            * Whether to transfer ownership to the specified user and downgrade the current owner to a
            * writer. This parameter is required as an acknowledgement of the side effect.
            */
            public Create setTransferOwnership(bool transferOwnership) {
                this.transferOwnership = transferOwnership.nullable;
                return cast(Create) super.addQueryParams("transferOwnership",
                    to!(string)(transferOwnership));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether to transfer ownership to the specified user and downgrade the current owner to a writer.
            This parameter is required as an acknowledgement of the side effect.
            * </p>
            */
            public bool isTransferOwnership() {
                if (transferOwnership.isNull) {
                    return false;
                }
                return transferOwnership.get;
            }

            /**
            * Issue the request as a domain administrator; if set to true, then the requester will be
            * granted access if the file ID parameter refers to a shared drive and the requester is an
            * administrator of the domain to which the shared drive belongs.
            */
            private Nullable!bool useDomainAdminAccess;

            /** Issue the request as a domain administrator; if set to true, then the requester will be granted
            access if the file ID parameter refers to a shared drive and the requester is an administrator of
            the domain to which the shared drive belongs. [default: false]
            */
            public bool getUseDomainAdminAccess() {
                return useDomainAdminAccess.get;
            }

            /**
            * Issue the request as a domain administrator; if set to true, then the requester will be
            * granted access if the file ID parameter refers to a shared drive and the requester is an
            * administrator of the domain to which the shared drive belongs.
            */
            public Create setUseDomainAdminAccess(bool useDomainAdminAccess) {
                this.useDomainAdminAccess = useDomainAdminAccess.nullable;
                return cast(Create) super.addQueryParams("useDomainAdminAccess",    
                    to!(string)(useDomainAdminAccess));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Issue the request as a domain administrator; if set to true, then the requester will be granted
            access if the file ID parameter refers to a shared drive and the requester is an administrator of
            the domain to which the shared drive belongs.
            * </p>
            */
            public bool isUseDomainAdminAccess() {
                if (useDomainAdminAccess.isNull) {
                    return false;
                }
                return useDomainAdminAccess.get;
            }

            public Create set(T)(string parameterName, T value) {
                return cast(Create) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            public gdrive.models.Permission.Permission execute() {
                return super.exec!"POST"();
            }
        }

        public Delete!(Request, Response) deletePermission(string fileId, string permissionId) {
            Delete!(Request, Response) result = new Delete!(Request, Response)(fileId, permissionId);
            initialize!(Request, Response, Delete)(result);
            return result;
        }

        public class Delete(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.Permission.Permission, RequestT, ResponseT) {
            public static const string REST_PATH = "files/%s/permissions/%s";

            protected this(string fileId, string permissionId) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId, permissionId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.fileId = fileId;
                this.permissionId = permissionId;
            }

            override {
                public Delete setAlt(string alt) {
                    return cast(Delete) super.setAlt(alt);
                }

                public Delete setFields(string fields) {
                    return cast(Delete) super.setFields(fields);
                }

                public Delete setKey(string key) {
                    return cast(Delete) super.setKey(key);
                }

                public Delete setOauthToken(string oauthToken) {
                    return cast(Delete) super.setOauthToken(oauthToken);
                }

                public Delete setPrettyPrint(bool prettyPrint) {
                    return cast(Delete) super.setPrettyPrint(prettyPrint);
                }

                public Delete setQuotaUser(string quotaUser) {
                    return cast(Delete) super.setQuotaUser(quotaUser);
                }

                public Delete setUserIp(string userIp) {
                    return cast(Delete) super.setUserIp(userIp);
                }
            }

            /** The ID of the file or shared drive. */
            private string fileId;

            /** The ID of the file or shared drive.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file or shared drive. */
            public Delete setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /** The ID of the permission. */
            private string permissionId;

            /** The ID of the permission.
            */
            public string getPermissionId() {
            return permissionId;
            }

            /** The ID of the permission. */
            public Delete setPermissionId(string permissionId) {
                this.permissionId = permissionId;
                return this;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            private Nullable!bool supportsAllDrives;

            /** Whether the requesting application supports both My Drives and shared drives. [default: false]
            */
            public bool getSupportsAllDrives() {
                return supportsAllDrives.get;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            public Delete setSupportsAllDrives(bool supportsAllDrives) {
                this.supportsAllDrives = supportsAllDrives.nullable;
                return cast(Delete) super.addQueryParams("supportsAllDrives",
                    to!(string)(isSupportsAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the requesting application supports both My Drives and shared drives.
            * </p>
            */
            public bool isSupportsAllDrives() {
                if (supportsAllDrives.isNull) {
                    return false;
                }
                return supportsAllDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            private Nullable!bool supportsTeamDrives;

            /** Deprecated use supportsAllDrives instead. [default: false]
            */
            public bool getSupportsTeamDrives() {
                return supportsTeamDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            public Delete setSupportsTeamDrives(bool supportsTeamDrives) {
                this.supportsTeamDrives = supportsTeamDrives.nullable;
                return cast(Delete) super.addQueryParams("supportsTeamDrives",
                    to!(string)(supportsTeamDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use supportsAllDrives instead.
            * </p>
            */
            public bool isSupportsTeamDrives() {
                if (supportsTeamDrives.isNull) {
                    return false;
                }
                return supportsTeamDrives.get;
            }

            /**
            * Issue the request as a domain administrator; if set to true, then the requester will be
            * granted access if the file ID parameter refers to a shared drive and the requester is an
            * administrator of the domain to which the shared drive belongs.
            */
            private Nullable!bool useDomainAdminAccess;

            /** Issue the request as a domain administrator; if set to true, then the requester will be granted
            access if the file ID parameter refers to a shared drive and the requester is an administrator of
            the domain to which the shared drive belongs. [default: false]
            */
            public bool getUseDomainAdminAccess() {
                return useDomainAdminAccess.get;
            }

            /**
            * Issue the request as a domain administrator; if set to true, then the requester will be
            * granted access if the file ID parameter refers to a shared drive and the requester is an
            * administrator of the domain to which the shared drive belongs.
            */
            public Delete setUseDomainAdminAccess(bool useDomainAdminAccess) {
                this.useDomainAdminAccess = useDomainAdminAccess.nullable;
                return cast(Delete) super.addQueryParams("useDomainAdminAccess",
                    to!(string)(useDomainAdminAccess));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Issue the request as a domain administrator; if set to true, then the requester will be granted
            access if the file ID parameter refers to a shared drive and the requester is an administrator of
            the domain to which the shared drive belongs.
            * </p>
            */
            public bool isUseDomainAdminAccess() {
                if (useDomainAdminAccess.isNull) {
                    return false;
                }
                return useDomainAdminAccess.get;
            }

            public Delete set(T)(String parameterName, T value) {
                return cast(Delete) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            public void execute() {
                super.exec!"DELETE"();
            }
        }

        public Get!(Request, Response) deletePermission(string fileId, string permissionId) {
            Get!(Request, Response) result = new Get!(Request, Response)(fileId, permissionId);
            initialize!(Request, Response, Get)(result);
            return result;
        }

        public class Get(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.Permission.Permission, RequestT, ResponseT) {
            public static const string REST_PATH = "files/%s/permissions/%s";

            protected this(string fileId, string permissionId) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId, permissionId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.fileId = fileId;
                this.permissionId = permissionId;
            }

            override {
                public Get setAlt(string alt) {
                    return cast(Get) super.setAlt(alt);
                }

                public Get setFields(string fields) {
                    return cast(Get) super.setFields(fields);
                }

                public Get setKey(string key) {
                    return cast(Get) super.setKey(key);
                }

                public Get setOauthToken(string oauthToken) {
                    return cast(Get) super.setOauthToken(oauthToken);
                }

                public Get setPrettyPrint(bool prettyPrint) {
                    return cast(Get) super.setPrettyPrint(prettyPrint);
                }

                public Get setQuotaUser(string quotaUser) {
                    return cast(Get) super.setQuotaUser(quotaUser);
                }

                public Get setUserIp(string userIp) {
                    return cast(Get) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Get setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /** The ID of the permission. */
            private string permissionId;

            /** The ID of the permission.
            */
            public string getPermissionId() {
                return permissionId;
            }

            /** The ID of the permission. */
            public Get setPermissionId(string permissionId) {
                this.permissionId = permissionId;
                return this;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            private Nullable!bool supportsAllDrives;

            /** Whether the requesting application supports both My Drives and shared drives. [default: false]
            */
            public bool getSupportsAllDrives() {
                return supportsAllDrives.get;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            public Get setSupportsAllDrives(bool supportsAllDrives) {
                this.supportsAllDrives = supportsAllDrives.nullable;
                return cast(Get) super.addQueryParams("supportsAllDrives",
                    to!(string)(supportsAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the requesting application supports both My Drives and shared drives.
            * </p>
            */
            public bool isSupportsAllDrives() {
                if (supportsAllDrives.isNull) {
                    return false;
                }
                return supportsAllDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            private Nullable!bool supportsTeamDrives;

            /** Deprecated use supportsAllDrives instead. [default: false]
            */
            public bool getSupportsTeamDrives() {
                return supportsTeamDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            public Get setSupportsTeamDrives(bool supportsTeamDrives) {
                this.supportsTeamDrives = supportsTeamDrives.nullable;
                return cast(Get) super.addQueryParams("supportsTeamDrives",
                    to!(string)(supportsTeamDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use supportsAllDrives instead.
            * </p>
            */
            public bool isSupportsTeamDrives() {
                if (supportsTeamDrives.isNull) {
                    return false;
                }
                return supportsTeamDrives.get;
            }

            /**
            * Issue the request as a domain administrator; if set to true, then the requester will be
            * granted access if the file ID parameter refers to a shared drive and the requester is an
            * administrator of the domain to which the shared drive belongs.
            */
            
            private Nullable!bool useDomainAdminAccess;

            /** Issue the request as a domain administrator; if set to true, then the requester will be granted
            access if the file ID parameter refers to a shared drive and the requester is an administrator of
            the domain to which the shared drive belongs. [default: false]
            */
            public bool getUseDomainAdminAccess() {
                return useDomainAdminAccess.get;
            }

            /**
            * Issue the request as a domain administrator; if set to true, then the requester will be
            * granted access if the file ID parameter refers to a shared drive and the requester is an
            * administrator of the domain to which the shared drive belongs.
            */
            public Get setUseDomainAdminAccess(bool useDomainAdminAccess) {
                this.useDomainAdminAccess = useDomainAdminAccess.nullable;
                return cast(Get) super.addQueryParams("useDomainAdminAccess",
                    to!(string)(useDomainAdminAccess));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Issue the request as a domain administrator; if set to true, then the requester will be granted
            access if the file ID parameter refers to a shared drive and the requester is an administrator of
            the domain to which the shared drive belongs.
            * </p>
            */
            public bool isUseDomainAdminAccess() {
                if (useDomainAdminAccess.isNull) {
                    return false;
                }
                return useDomainAdminAccess.get;
            }

            public Get set(T)(string parameterName, T value) {
                return cast(Get) super.set(parameterName,
                    to!(string)(value));
            }
        }

        public List!(Request, Response) list(string fileId) {
            List!(Request, Response) result = new List!(Request, Response)(fileId);
            initialize!(Request, Response, List)(result);
            return result;
        }

        public class List(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.permissionlist.PermissionList, RequestT, ResponseT) {
            public static const string REST_PATH = "files/%s/permissions";

            protected this(string fileId) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.fileId = fileId;
            }

            override {
                public List setAlt(string alt) {
                    return cast(List) super.setAlt(alt);
                }

                public List setFields(string fields) {
                    return cast(List) super.setFields(fields);
                }

                public List setKey(string key) {
                    return cast(List) super.setKey(key);
                }

                public List setOauthToken(string oauthToken) {
                    return cast(List) super.setOauthToken(oauthToken);
                }

                public List setPrettyPrint(bool prettyPrint) {
                    return cast(List) super.setPrettyPrint(prettyPrint);
                }

                public List setQuotaUser(string quotaUser) {
                    return cast(List) super.setQuotaUser(quotaUser);
                }

                public List setUserIp(string userIp) {
                    return cast(List) super.setUserIp(userIp);
                }
            }

            /** The ID of the file or shared drive. */
            private string fileId;

            /** The ID of the file or shared drive.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file or shared drive. */
            public List setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /**
            * Specifies which additional view's permissions to include in the response. Only 'published'
            * is supported.
            */
            private string includePermissionsForView;

            /** Specifies which additional view's permissions to include in the response. Only 'published' is
            supported.
            */
            public string getIncludePermissionsForView() {
                return includePermissionsForView;
            }

            /**
            * Specifies which additional view's permissions to include in the response. Only 'published'
            * is supported.
            */
            public List setIncludePermissionsForView(string includePermissionsForView) {
                this.includePermissionsForView = includePermissionsForView;
                return cast(List) super.addQueryParams("includePermissionsForView",
                    includePermissionsForView);
            }

            /**
            * The maximum number of permissions to return per page. When not set for files in a shared
            * drive, at most 100 results will be returned. When not set for files that are not in a
            * shared drive, the entire list will be returned.
            */
            private int pageSize;

            /** The maximum number of permissions to return per page. When not set for files in a shared drive, at
            most 100 results will be returned. When not set for files that are not in a shared drive, the
            entire list will be returned.
            [minimum: 1] [maximum: 100]
            */
            public int getPageSize() {
                return pageSize;
            }

            /**
            * The maximum number of permissions to return per page. When not set for files in a shared
            * drive, at most 100 results will be returned. When not set for files that are not in a
            * shared drive, the entire list will be returned.
            */
            public List setPageSize(int pageSize) {
                this.pageSize = pageSize;
                return cast(List) super.addQueryParams("pageSize",
                    to!(string)(pageSize));
            }

            /**
            * The token for continuing a previous list request on the next page. This should be set to
            * the value of 'nextPageToken' from the previous response.
            */
            private string pageToken;

            /** The token for continuing a previous list request on the next page. This should be set to the value
            of 'nextPageToken' from the previous response.
            */
            public string getPageToken() {
                return pageToken;
            }

            /**
            * The token for continuing a previous list request on the next page. This should be set to
            * the value of 'nextPageToken' from the previous response.
            */
            public List setPageToken(string pageToken) {
                this.pageToken = pageToken;
                return cast(List) super.addQueryParams("pageToken",
                    pageToken);
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            private Nullable!bool supportsAllDrives;

            /** Whether the requesting application supports both My Drives and shared drives. [default: false]
            */
            public bool getSupportsAllDrives() {
                return supportsAllDrives.get;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            public List setSupportsAllDrives(bool supportsAllDrives) {
                this.supportsAllDrives = supportsAllDrives.nullable;
                return cast(List) super.addQueryParams("supportsAllDrives",
                    to!(string)(supportsAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the requesting application supports both My Drives and shared drives.
            * </p>
            */
            public bool isSupportsAllDrives() {
                if (supportsAllDrives.isNull) {
                    return false;
                }
                return supportsAllDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            
            private Nullable!bool supportsTeamDrives;

            /** Deprecated use supportsAllDrives instead. [default: false]
            */
            public bool getSupportsTeamDrives() {
                return supportsTeamDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            public List setSupportsTeamDrives(bool supportsTeamDrives) {
                this.supportsTeamDrives = supportsTeamDrives.nullable;
                return cast(List) super.addQueryParams("supportsTeamDrives",
                    to!(string)(supportsTeamDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use supportsAllDrives instead.
            * </p>
            */
            public bool isSupportsTeamDrives() {
                if (supportsTeamDrives.isNull) {
                    return false;
                }
                return supportsTeamDrives.get;
            }

            /**
            * Issue the request as a domain administrator; if set to true, then the requester will be
            * granted access if the file ID parameter refers to a shared drive and the requester is an
            * administrator of the domain to which the shared drive belongs.
            */
            private Nullable!bool useDomainAdminAccess;

            /** Issue the request as a domain administrator; if set to true, then the requester will be granted
            access if the file ID parameter refers to a shared drive and the requester is an administrator of
            the domain to which the shared drive belongs. [default: false]
            */
            public bool getUseDomainAdminAccess() {
                return useDomainAdminAccess.get;
            }

            /**
            * Issue the request as a domain administrator; if set to true, then the requester will be
            * granted access if the file ID parameter refers to a shared drive and the requester is an
            * administrator of the domain to which the shared drive belongs.
            */
            public List setUseDomainAdminAccess(bool useDomainAdminAccess) {
                this.useDomainAdminAccess = useDomainAdminAccess.nullable;
                return cast(List) super.addQueryParams("useDomainAdminAccess",
                    to!(string)(useDomainAdminAccess));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Issue the request as a domain administrator; if set to true, then the requester will be granted
            access if the file ID parameter refers to a shared drive and the requester is an administrator of
            the domain to which the shared drive belongs.
            * </p>
            */
            public bool isUseDomainAdminAccess() {
                if (useDomainAdminAccess.isNull) {
                    return false;
                }
                return useDomainAdminAccess.get;
            }

            public List set(T)(string parameterName, T value) {
                return cast(List) super.set(parameterName, 
                to!(string)(value));
            }

            public gdrive.models.permissionlist.PermissionList execute() {
                return super.exec!"GET"();
            }
        }

        public Update!(Request, Response) update(string fileId, string permissionId,
            gdrive.models.Permission.Permission content) {
            Update!(Request, Response) result = new Update!(Request, Response)(fileId, permissionId, content);
            initialize!(Request, Response, Update)(result);
            return result;
        }

        public class Update(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.Permission.Permission, RequestT, ResponseT) {
            public static const string REST_PATH = "files/%s/permissions/%s";

            protected this(string fileId, string permissionId,
                gdrive.models.Permission.Permission content) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId, permissionId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.fileId = fileId;
                this.permissionId = permissionId;
                this.body = content;
            }

            override {
                public Update setAlt(string alt) {
                    return cast(Update) super.setAlt(alt);
                }

                public Update setFields(string fields) {
                    return cast(Update) super.setFields(fields);
                }

                public Update setKey(string key) {
                    return cast(Update) super.setKey(key);
                }

                public Update setOauthToken(string oauthToken) {
                    return cast(Update) super.setOauthToken(oauthToken);
                }

                public Update setPrettyPrint(bool prettyPrint) {
                    return cast(Update) super.setPrettyPrint(prettyPrint);
                }

                public Update setQuotaUser(string quotaUser) {
                    return cast(Update) super.setQuotaUser(quotaUser);
                }

                public Update setUserIp(string userIp) {
                    return cast(Update) super.setUserIp(userIp);
                }
            }

            /** The ID of the file or shared drive. */
            private string fileId;

            /** The ID of the file or shared drive.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file or shared drive. */
            public Update setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /** The ID of the permission. */
            private string permissionId;

            /** The ID of the permission.
            */
            public string getPermissionId() {
                return permissionId;
            }

            /** The ID of the permission. */
            public Update setPermissionId(string permissionId) {
                this.permissionId = permissionId;
                return this;
            }

            /** Whether to remove the expiration date. */
            private Nullable!bool removeExpiration;

            /** Whether to remove the expiration date. [default: false]
            */
            public bool getRemoveExpiration() {
                return removeExpiration.get;
            }

            /** Whether to remove the expiration date. */
            public Update setRemoveExpiration(bool removeExpiration) {
                this.removeExpiration = removeExpiration.nullable;
                return cast(Update) super.addQueryParams("removeExpiration",
                    to!(string)(removeExpiration));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether to remove the expiration date.
            * </p>
            */
            public bool isRemoveExpiration() {
                if (removeExpiration.isNull) {
                    return false;
                }
                return removeExpiration.get;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            
            private Nullable!bool supportsAllDrives;

            /** Whether the requesting application supports both My Drives and shared drives. [default: false]
            */
            public bool getSupportsAllDrives() {
                return supportsAllDrives.get;
            }

            /** Whether the requesting application supports both My Drives and shared drives. */
            public Update setSupportsAllDrives(bool supportsAllDrives) {
                this.supportsAllDrives = supportsAllDrives.nullable;
                return cast(Update) super.addQueryParams("supportsAllDrives",
                    to!(string)(supportsAllDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the requesting application supports both My Drives and shared drives.
            * </p>
            */
            public bool isSupportsAllDrives() {
                if (supportsAllDrives.isNull) {
                    return false;
                }
                return supportsAllDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            
            private Nullable!bool supportsTeamDrives;

            /** Deprecated use supportsAllDrives instead. [default: false]
            */
            public bool getSupportsTeamDrives() {
                return supportsTeamDrives.get;
            }

            /** Deprecated use supportsAllDrives instead. */
            public Update setSupportsTeamDrives(bool supportsTeamDrives) {
                this.supportsTeamDrives = supportsTeamDrives.nullable;
                return cast(Update) super.addQueryParams("supportsTeamDrives",
                    to!(string)(supportsTeamDrives));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Deprecated use supportsAllDrives instead.
            * </p>
            */
            public bool isSupportsTeamDrives() {
                if (supportsTeamDrives.isNull) {
                    return false;
                }
                return supportsTeamDrives.get;
            }

            /**
            * Whether to transfer ownership to the specified user and downgrade the current owner to a
            * writer. This parameter is required as an acknowledgement of the side effect.
            */
            private Nullable!bool transferOwnership;

            /** Whether to transfer ownership to the specified user and downgrade the current owner to a writer.
            This parameter is required as an acknowledgement of the side effect. [default: false]
            */
            public bool getTransferOwnership() {
                return transferOwnership.get;
            }

            /**
            * Whether to transfer ownership to the specified user and downgrade the current owner to a
            * writer. This parameter is required as an acknowledgement of the side effect.
            */
            public Update setTransferOwnership(bool transferOwnership) {
                this.transferOwnership = transferOwnership.nullable;
                return cast(Update) super.addQueryParams("transferOwnership",
                    to!(string)(transferOwnership));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether to transfer ownership to the specified user and downgrade the current owner to a writer.
            This parameter is required as an acknowledgement of the side effect.
            * </p>
            */
            public bool isTransferOwnership() {
                if (transferOwnership.isNull) {
                    return false;
                }
                return transferOwnership.get;
            }

            /**
            * Issue the request as a domain administrator; if set to true, then the requester will be
            * granted access if the file ID parameter refers to a shared drive and the requester is an
            * administrator of the domain to which the shared drive belongs.
            */
            
            private Nullable!bool useDomainAdminAccess;

            /** Issue the request as a domain administrator; if set to true, then the requester will be granted
            access if the file ID parameter refers to a shared drive and the requester is an administrator of
            the domain to which the shared drive belongs. [default: false]
            */
            public bool getUseDomainAdminAccess() {
                return useDomainAdminAccess.get;
            }

            /**
            * Issue the request as a domain administrator; if set to true, then the requester will be
            * granted access if the file ID parameter refers to a shared drive and the requester is an
            * administrator of the domain to which the shared drive belongs.
            */
            public Update setUseDomainAdminAccess(bool useDomainAdminAccess) {
                this.useDomainAdminAccess = useDomainAdminAccess.nullable;
                return cast(Update) super.addQueryParams("useDomainAdminAccess",
                    to!(string)(useDomainAdminAccess));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Issue the request as a domain administrator; if set to true, then the requester will be granted
            access if the file ID parameter refers to a shared drive and the requester is an administrator of
            the domain to which the shared drive belongs.
            * </p>
            */
            public bool isUseDomainAdminAccess() {
                if (useDomainAdminAccess.isNull) {
                    return false;
                }
                return useDomainAdminAccess.get;
            }

            public Update set(T)(string parameterName, T value) {
                return cast(Update) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            public gdrive.models.Permission.Permission execute() {
                return super.exec!"PATCH"();
            }
        }
    }

    public Replies replies() {
        return new Replies();
    }

    public class Replies {
        public Create!(Request, Response) create(string fileId, string commentId,
            gdrive.models.reply.Reply content) {
            Create!(Request, Response) result = new Create!(Request, Response)(fileId, commentId, content);
            initialize!(Request, Response, Create)(result);
            return result;
        }

        public class Create(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.reply.Reply, RequestT, ResponseT) {
            public static const string REST_PATH = "files/%s/commentId/%s/replies";

            protected this(string fileId, string commentId,
                gdrive.models.reply.Reply content) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId, commentId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.fileId = fileId;
                this.commentId = commentId;
                this.body = content;
            }

            override {
                public Create setAlt(string alt) {
                    return cast(Create) super.setAlt(alt);
                }

                public Create setFields(string fields) {
                    return cast(Create) super.setFields(fields);
                }

                public Create setKey(string key) {
                    return cast(Create) super.setKey(key);
                }

                public Create setOauthToken(string oauthToken) {
                    return cast(Create) super.setOauthToken(oauthToken);
                }

                public Create setPrettyPrint(bool prettyPrint) {
                    return cast(Create) super.setPrettyPrint(prettyPrint);
                }

                public Create setQuotaUser(string quotaUser) {
                    return cast(Create) super.setQuotaUser(quotaUser);
                }

                public Create setUserIp(string userIp) {
                    return cast(Create) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Create setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /** The ID of the comment. */
            private string commentId;

            /** The ID of the comment.
            */
            public string getCommentId() {
                return commentId;
            }

            /** The ID of the comment. */
            public Create setCommentId(string commentId) {
                this.commentId = commentId;
                return this;
            }

            public Create set(T)(string parameterName, T value) {
                return cast(Create) super.addQueryParams(parameterName, 
                    to!(string)(value));
            }

            public gdrive.models.reply.Reply execute() {
                return super.exec!"POST"();
            }
        }

        public Delete!(Request, Response) deleteReply(string fileId, string commentId, string replyId) {
            Delete!(Request, Response) result = new Delete!(Request, Response)
                (fileId, commentId, replyId);
            initialize!(Request, Response, Delete)(result);
            return result;
        }

        public class Delete(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.reply.Reply, RequestT, ResponseT) {
            public static const string REST_PATH = "files/%s/commentId/%s/replies/%s";

            protected this(string fileId, string commentId, string replyId) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId, commentId, replyId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.fileId = fileId;
                this.commentId = commentId;
                this.replyId = replyId;
            }

            override {
                public Delete setAlt(string alt) {
                    return cast(Delete) super.setAlt(alt);
                }

                public Delete setFields(string fields) {
                    return cast(Delete) super.setFields(fields);
                }

                public Delete setKey(string key) {
                    return cast(Delete) super.setKey(key);
                }

                public Delete setOauthToken(string oauthToken) {
                    return cast(Delete) super.setOauthToken(oauthToken);
                }

                public Delete setPrettyPrint(bool prettyPrint) {
                    return cast(Delete) super.setPrettyPrint(prettyPrint);
                }

                public Delete setQuotaUser(string quotaUser) {
                    return cast(Delete) super.setQuotaUser(quotaUser);
                }

                public Delete setUserIp(string userIp) {
                    return cast(Delete) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Delete setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /** The ID of the comment. */
            private string commentId;

            /** The ID of the comment.
            */
            public string getCommentId() {
                return commentId;
            }

            /** The ID of the comment. */
            public Delete setCommentId(string commentId) {
                this.commentId = commentId;
                return this;
            }

            /** The ID of the reply. */
            private string replyId;

            /** The ID of the reply.
            */
            public string getReplyId() {
                return replyId;
            }

            /** The ID of the reply. */
            public Delete setReplyId(string replyId) {
                this.replyId = replyId;
                return this;
            }

            public Delete set(T)(string parameterName, T value) {
                return cast(Delete) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            public void execute() {
                super.exec!"DELETE"();
            }
        }

        public Get!(Request, Response) get(string fileId, string commentId,
            string replyId) {
            Get!(Request, Response) result = new Get!(Request, Response)
                (fileId, commentId, replyId);
            initialize!(Request, Response, Get)(result);
            return result;
        }

        public class Get(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.reply.Reply, RequestT, ResponseT) {
            public static const string REST_PATH = "files/%s/commentId/%s/replies/%s";

            protected this(string fileId, string commentId,
                string replyId) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId, commentId, replyId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.fileId = fileId;
                this.commentId = commentId;
                this.replyId = replyId;
            }

            override {
                public Get setAlt(string alt) {
                    return cast(Get) super.setAlt(alt);
                }

                public Get setFields(string fields) {
                    return cast(Get) super.setFields(fields);
                }

                public Get setKey(string key) {
                    return cast(Get) super.setKey(key);
                }

                public Get setOauthToken(string oauthToken) {
                    return cast(Get) super.setOauthToken(oauthToken);
                }

                public Get setPrettyPrint(bool prettyPrint) {
                    return cast(Get) super.setPrettyPrint(prettyPrint);
                }

                public Get setQuotaUser(string quotaUser) {
                    return cast(Get) super.setQuotaUser(quotaUser);
                }

                public Get setUserIp(string userIp) {
                    return cast(Get) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Get setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /** The ID of the comment. */
            private string commentId;

            /** The ID of the comment.
            */
            public string getCommentId() {
                return commentId;
            }

            /** The ID of the comment. */
            public Get setCommentId(string commentId) {
                this.commentId = commentId;
                return this;
            }

            /** The ID of the reply. */
            private string replyId;

            /** The ID of the reply.
            */
            public string getReplyId() {
                return replyId;
            }

            /** The ID of the reply. */
            public Get setReplyId(string replyId) {
                this.replyId = replyId;
                return this;
            }

            /**
            * Whether to return deleted replies. Deleted replies will not include their original content.
            */
            private Nullable!bool includeDeleted;

            /** Whether to return deleted replies. Deleted replies will not include their original content.
            [default: false]
            */
            public bool getIncludeDeleted() {
                return includeDeleted.get;
            }

            /**
            * Whether to return deleted replies. Deleted replies will not include their original content.
            */
            public Get setIncludeDeleted(bool includeDeleted) {
                this.includeDeleted = includeDeleted.nullable;
                return cast(Get) super.addQueryParams("includeDeleted",
                    to!(string)(includeDeleted));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether to return deleted replies. Deleted replies will not include their original content.
            * </p>
            */
            public bool isIncludeDeleted() {
                if (includeDeleted.isNull) {
                    return false;
                }
                return includeDeleted.get;
            }

            public Get set(T)(string parameterName, T value) {
                return cast(Get) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            public gdrive.models.reply.Reply execute() {
                return super.exec!"GET"();
            }
        }
    }
    public Revisions revisions() {
        return new Revisions();        
    }

    public class Revisions {
        public Delete!(Request, Response) deleteRevision(string fileId, string revisionId) {
            Delete!(Request, Response) result = new Delete!(Request, Response)(fileId, revisionId);
            initialize!(Request, Response, Delete)(result);
            return result;
        }

        public class Delete(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.revision.Revision, RequestT, ResponseT) {
            public static const string REST_PATH = "files/%s/revisions/%s";

            protected this(string fileId, string revisionId) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId, revisionId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.fileId = fileId;
                this.revisionId = revisionId;
            }

            override {
                public Delete setAlt(string alt) {
                    return cast(Delete) super.setAlt(alt);
                }

                public Delete setFields(string fields) {
                    return cast(Delete) super.setFields(fields);
                }

                public Delete setKey(string key) {
                    return cast(Delete) super.setKey(key);
                }

                public Delete setOauthToken(string oauthToken) {
                    return cast(Delete) super.setOauthToken(oauthToken);
                }

                public Delete setPrettyPrint(bool prettyPrint) {
                    return cast(Delete) super.setPrettyPrint(prettyPrint);
                }

                public Delete setQuotaUser(string quotaUser) {
                    return cast(Delete) super.setQuotaUser(quotaUser);
                }

                public Delete setUserIp(string userIp) {
                    return cast(Delete) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Delete setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /** The ID of the revision. */
            private string revisionId;

            /** The ID of the revision.
            */
            public string getRevisionId() {
                return revisionId;
            }

            /** The ID of the revision. */
            public Delete setRevisionId(string revisionId) {
                this.revisionId = revisionId;
                return this;
            }

            public Delete set(T)(string parameterName, T value) {
                return cast(Delete) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            public void execute() {
                super.exec!"DELETE"();
            }
        }

        public Get!(Request, Response) get(string fileId, string revisionId) {
            Get!(Request, Response) result = new Get!(Request, Response)(fileId, revisionId);
            initialize!(Request, Response, Get)(result);
            return result;
        }

        public class Get(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.revision.Revision, RequestT, ResponseT) {
            public static const string REST_PATH = "files/%s/revisions/%s";

            protected this(string fileId, string revisionId) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId, revisionId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.fileId = fileId;
                this.revisionId = revisionId;
            }

            override {
                public Get setAlt(string alt) {
                    return cast(Get) super.setAlt(alt);
                }

                public Get setFields(string fields) {
                    return cast(Get) super.setFields(fields);
                }

                public Get setKey(string key) {
                    return cast(Get) super.setKey(key);
                }

                public Get setOauthToken(string oauthToken) {
                    return cast(Get) super.setOauthToken(oauthToken);
                }

                public Get setPrettyPrint(bool prettyPrint) {
                    return cast(Get) super.setPrettyPrint(prettyPrint);
                }

                public Get setQuotaUser(string quotaUser) {
                    return cast(Get) super.setQuotaUser(quotaUser);
                }

                public Get setUserIp(string userIp) {
                    return cast(Get) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Get setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /** The ID of the revision. */
            private string revisionId;

            /** The ID of the revision.
            */
            public string getRevisionId() {
                return revisionId;
            }

            /** The ID of the revision. */
            public Get setRevisionId(string revisionId) {
                this.revisionId = revisionId;
                return this;
            }

            /**
            * Whether the user is acknowledging the risk of downloading known malware or other abusive
            * files. This is only applicable when alt=media.
            */
            private Nullable!bool acknowledgeAbuse;

            /** Whether the user is acknowledging the risk of downloading known malware or other abusive files.
            This is only applicable when alt=media. [default: false]
            */
            public bool getAcknowledgeAbuse() {
                return acknowledgeAbuse.get;
            }

            /**
            * Whether the user is acknowledging the risk of downloading known malware or other abusive
            * files. This is only applicable when alt=media.
            */
            public Get setAcknowledgeAbuse(bool acknowledgeAbuse) {
                this.acknowledgeAbuse = acknowledgeAbuse.nullable;
                return cast(Get) super.addQueryParams("acknowledgeAbuse",
                    to!(string)(acknowledgeAbuse));
            }

            /**
            * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
            *
            * <p>
            * Boolean properties can have four possible values:
            * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
            * or {@link Boolean#FALSE}.
            * </p>
            *
            * <p>
            * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
            * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
            * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
            * </p>
            *
            * <p>
            * Whether the user is acknowledging the risk of downloading known malware or other abusive files.
            This is only applicable when alt=media.
            * </p>
            */
            public bool isAcknowledgeAbuse() {
                if (acknowledgeAbuse.isNull) {
                    return false;
                }
                return acknowledgeAbuse.get;
            }

            public Get set(T)(string parameterName, T value) {
                return cast(Get) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            import std.range;
            public void executeMediaAndDowloadTo(OutputStream = OutputRange)
                (OutputStream outputStream)
            if (isOutputRange!(OutputStream, byte)) {
                setAlt("media");
                outputStream.put(super.execUnparsed!"GET"());
            }

            public gdrive.models.File.File execute()() {
                return super.exec!"GET"();
            }
        }

        public List!(Request, Response) list(string fileId) {
            List!(Request, Response) result = new List!(Request, Response)(fileId);
            initialize!(Request, Response, List)(result);
            return result;
        }

        public class List(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.revisionlist.RevisionList, RequestT, ResponseT) {
            public static const string REST_PATH = "files/%s/revisions";

            protected this(string fileId) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.fileId = fileId;
            }

            override {
                public List setAlt(string alt) {
                    return cast(List) super.setAlt(alt);
                }

                public List setFields(string fields) {
                    return cast(List) super.setFields(fields);
                }

                public List setKey(string key) {
                    return cast(List) super.setKey(key);
                }

                public List setOauthToken(string oauthToken) {
                    return cast(List) super.setOauthToken(oauthToken);
                }

                public List setPrettyPrint(bool prettyPrint) {
                    return cast(List) super.setPrettyPrint(prettyPrint);
                }

                public List setQuotaUser(string quotaUser) {
                    return cast(List) super.setQuotaUser(quotaUser);
                }

                public List setUserIp(string userIp) {
                    return cast(List) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public List setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /** The maximum number of revisions to return per page. */
            private int pageSize;

            /** The maximum number of revisions to return per page. [default: 200] [minimum: 1] [maximum: 1000]
            */
            public int getPageSize() {
                return pageSize;
            }

            /** The maximum number of revisions to return per page. */
            public List setPageSize(int pageSize) {
                this.pageSize = pageSize;
                return cast(List) super.addQueryParams("pageSize",
                    to!(string)(pageSize));
            }

            /**
            * The token for continuing a previous list request on the next page. This should be set to
            * the value of 'nextPageToken' from the previous response.
            */
            private string pageToken;

            /** The token for continuing a previous list request on the next page. This should be set to the value
            of 'nextPageToken' from the previous response.
            */
            public string getPageToken() {
                return pageToken;
            }

            /**
            * The token for continuing a previous list request on the next page. This should be set to
            * the value of 'nextPageToken' from the previous response.
            */
            public List setPageToken(string pageToken) {
                this.pageToken = pageToken;
                return cast(List) super.addQueryParams("pageToken", pageToken);
            }

            public List set(T)(string parameterName, T value) {
                return cast(List) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            public gdrive.models.revisionlist.RevisionList execute() {
                return super.exec!"GET"();
            }
        }

        public Update!(Request, Response) update(string fileId, string revisionId,
            gdrive.models.revision.Revision content) {
            Update!(Request, Response) result = new Update!(Request, Response)
                (fileId, revisionId, content);
            initialize!(Request, Response, Update)(result);
            return result;
        }

        public class Update(RequestT = Request, ResponseT = Response) :
            APIRequest!(gdrive.models.revision.Revision, RequestT, ResponseT) {
            public static const string REST_PATH = "files/%s/revisions/%s";

            protected this(string fileId, string revisionId,
                gdrive.models.revision.Revision content) {
                import std.format : format;
                string formatedRestPath = format!REST_PATH(fileId, revisionId);
                string url = Drive.DEFAULT_ROOT_URL ~ Drive.DEFAULT_SERVICE_PATH ~ formatedRestPath;
                super(url, string[string].init);
                this.fileId = fileId;
            }

            override {
                public Update setAlt(string alt) {
                    return cast(Update) super.setAlt(alt);
                }

                public Update setFields(string fields) {
                    return cast(Update) super.setFields(fields);
                }

                public Update setKey(string key) {
                    return cast(Update) super.setKey(key);
                }

                public Update setOauthToken(string oauthToken) {
                    return cast(Update) super.setOauthToken(oauthToken);
                }

                public Update setPrettyPrint(bool prettyPrint) {
                    return cast(Update) super.setPrettyPrint(prettyPrint);
                }

                public Update setQuotaUser(string quotaUser) {
                    return cast(Update) super.setQuotaUser(quotaUser);
                }

                public Update setUserIp(string userIp) {
                    return cast(Update) super.setUserIp(userIp);
                }
            }

            /** The ID of the file. */
            private string fileId;

            /** The ID of the file.
            */
            public string getFileId() {
                return fileId;
            }

            /** The ID of the file. */
            public Update setFileId(string fileId) {
                this.fileId = fileId;
                return this;
            }

            /** The ID of the revision. */
            private string revisionId;

            /** The ID of the revision.
            */
            public string getRevisionId() {
                return revisionId;
            }

            /** The ID of the revision. */
            public Update setRevisionId(string revisionId) {
                this.revisionId = revisionId;
                return this;
            }

            public Update set(T)(string parameterName, T value) {
                return cast(Update) super.addQueryParams(parameterName,
                    to!(string)(value));
            }

            public gdrive.models.revision.Revision execute() {
                return super.exec!"PATCH"();
            }
        }
    }
}