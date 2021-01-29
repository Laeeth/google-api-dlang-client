//          Copyright Author 2021.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module gmail;

public class Gmail {
    /**
    * The default encoded root URL of the service. This is determined when the library is generated
    * and normally should not be changed.
    *
    * @since 1.7
    */
    public static const string DEFAULT_ROOT_URL = "https://gmail.googleapis.com/";

    /**
    * The default encoded service path of the service. This is determined when the library is
    * generated and normally should not be changed.
    *
    * @since 1.7
    */
    public static const string DEFAULT_SERVICE_PATH = "";

    /**
    * The default encoded base URL of the service. This is determined when the library is generated
    * and normally should not be changed.
    */
    public static const string DEFAULT_BASE_URL = DEFAULT_ROOT_URL + DEFAULT_SERVICE_PATH;

    private Client client;

    this(string credentialsFile) {
        this.client = new Client(credentialsFile, "gmail");
    }

    public void initialize(RequestT, ResponseT, alias Service)
        (Service!(RequestT, ResponseT) req) {
        req.setOauthToken(client.getToken());
    }

    public Users users() {
        return new Users();
    }

    public class Users {
        public GetProfile!(Request, Response) getProfile(string userId) {
            GetProfile!(Request, Response) result = new GetProfile!(Request, Response)(userId);
            initialize!(Request, Response, GetProfile)(result);
            return result;
        }

        public class GetProfile(RequestT = Request, ResponseT = Response) :
            APIRequest!(gmail.models.profile.Profile, RequestT, ResponseT) {
            private static const string REST_PATH = "gmail/v1/users/%s/profile";

            protected this(string userId) {
                enforce(userId, RequiredMessage!"userId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId));
                setUserId(userId);
            }

            override {
                public GetProfile setAccessToken(string accessToken) {
                    return cast(GetProfile) super.setAccessToken(accessToken);
                }

                public GetProfile setAlt(string alt) {
                    return cast(GetProfile) super.setAlt(alt);
                }

                public GetProfile setCallback(string callback) {
                    return cast(GetProfile) super.setCallback(callback);
                }

                public GetProfile setFields(string fields) {
                    return cast(GetProfile) super.setFields(fields);
                }

                public GetProfile setKey(string key) {
                    return cast(GetProfile) super.setKey(key);
                }

                public GetProfile setOauthToken(string oauthToken) {
                    return cast(GetProfile) super.setOauthToken(oauthToken);
                }

                public GetProfile setPrettyPrint(bool prettyPrint) {
                    return cast(GetProfile) super.setPrettyPrint(prettyPrint);
                }

                public GetProfile setQuotaUser(string quotaUser) {
                    return cast(GetProfile) super.setQuotaUser(quotaUser);
                }

                public GetProfile setUploadType(string uploadType) {
                    return cast(GetProfile) super.setUploadType(uploadType);
                }

                public GetProfile setUploadProtocol(string uploadProtocol) {
                    return cast(GetProfile) super.setUploadProtocol(uploadProtocol);
                }
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the authenticated
            * user.
            */
            private string userId;

            /** The user's email address. The special value `me` can be used to indicate the authenticated user.
            [default: me]
            */
            public string getUserId() {
                return userId;
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the authenticated
            * user.
            */
            public GetProfile setUserId(string userId) {
                this.userId = userId;
                return this;
            }

            override public GetProfile set(T)(string parameterName, T value) {
                return cast(GetProfile) super.set!T(parameterName, value);
            }

            public gmail.models.profile.Profile execute() {
                return super.exec!"GET"();
            }
        }

        public Stop!(Request, Response) stop(string userId) {
            Stop!(Request, Response) result = new Stop!(Request, Response)(userId);
            initialize!(Request, Response, Stop)(result);
            return result;
        }

        public class Stop(RequestT = Request, ResponseT = Response) :
            APIRequest!(gmail.models.profile.Profile, RequestT, ResponseT) {
            private static const string REST_PATH = "gmail/v1/users/%s/stop";

            protected this(string userId) {
                enforce(userId, RequiredMessage!"userId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId));
                setUserId(userId);
            }

            override {
                public Stop set$Xgafv(string $Xgafv) {
                    return cast(Stop) super.set$Xgafv($Xgafv);
                }

                public Stop setAccessToken(string accessToken) {
                    return cast(Stop) super.setAccessToken(accessToken);
                }

                public Stop setAlt(string alt) {
                    return cast(Stop) super.setAlt(alt);
                }

                public Stop setCallback(string callback) {
                    return cast(Stop) super.setCallback(callback);
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

                public Stop setUploadType(string uploadType) {
                    return cast(Stop) super.setUploadType(uploadType);
                }

                public Stop setUploadProtocol(string uploadProtocol) {
                    return cast(Stop) super.setUploadProtocol(uploadProtocol);
                }
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the authenticated
            * user.
            */
            private string userId;

            /** The user's email address. The special value `me` can be used to indicate the authenticated user.
            [default: me]
            */
            public string getUserId() {
                return userId;
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the authenticated
            * user.
            */
            public Stop setUserId(string userId) {
                this.userId = userId;
                return this;
            }

            override public Stop set(T)(string parameterName, T value) {
                return cast(Stop) super.set!T(parameterName, value);
            }

            public void execute() {
                super.exec!"POST"();
            }
        }

        public Watch!(Request, Response) watch(string userId,
            gmail.models.watchrequest.WatchRequest content) {
            Watch!(Request, Response) result = new Watch!(Request, Response)(userId, content);
            initialize!(Request, Response, Watch)(result);
            return result;
        }

        public class Watch(RequestT = Request, ResponseT = Response) :
            APIRequest!(gmail.models.watchrequest.WatchRequest, RequestT, ResponseT) {
            private static const string REST_PATH = "gmail/v1/users/%s/watch";

            protected this(string userId,
                gmail.models.watchrequest.WatchRequest content) {
                enforce(userId, RequiredMessage!"userId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId), content);
                setUserId(userId);
            }

            override {
                public Watch set$Xgafv(string $Xgafv) {
                    return cast(Watch) super.set$Xgafv($Xgafv);
                }

                public Watch setAccessToken(string accessToken) {
                    return cast(Watch) super.setAccessToken(accessToken);
                }

                public Watch setAlt(string alt) {
                    return cast(Watch) super.setAlt(alt);
                }

                public Watch setCallback(string callback) {
                    return cast(Watch) super.setCallback(callback);
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

                public Watch setUploadType(string uploadType) {
                    return cast(Watch) super.setUploadType(uploadType);
                }

                public Watch setUploadProtocol(string uploadProtocol) {
                    return cast(Watch) super.setUploadProtocol(uploadProtocol);
                }
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the authenticated
            * user.
            */
            private string userId;

            /** The user's email address. The special value `me` can be used to indicate the authenticated user.
            [default: me]
            */
            public string getUserId() {
                return userId;
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the authenticated
            * user.
            */
            public Watch setUserId(string userId) {
                this.userId = userId;
                return this;
            }

            override public Watch set(T)(string parameterName, T value) {
                return cast(Watch) super.set!T(parameterName, value);
            }

            public gmail.models.watchrequest.WatchRequest execute() {
                return super.exec!"POST"();
            }
        }

    }

    public Drafts drafts() {
        return new Drafts();
    }

    public class Drafts {
        public Create!(Request, Response) create(string userId,
            gmail.models.draft.Draft content) {
            Create!(Request, Response) result = new Create!(Request, Response)(userId, content);
            initialize!(Request, Response, Create)(result);
            return result;
        }

        public Create!(Request, Response) create(string userId,
                gmail.models.draft.Draft content, string mediaContent) {
            Create!(Request, Response) result = new Create!(Request, Response)(userId, content, mediaContent);
            initialize(Request, Response, Create)(result);
            return result;
        }

        public class Create(RequestT = Request, ResponseT = Response) :
            APIRequest!(gmail.models.draft.Draft, RequestT, ResponseT) {
            private static const string REST_PATH = "gmail/v1/users/%s/drafts";

            protected this(string userId,
                gmail.models.watchrequest.WatchRequest content) {
                enforce(userId, RequiredMessage!"userId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId), content);
                setUserId(userId);
            }

            protected this(string userId,
                gmail.models.watchrequest.WatchRequest content, string mediaContent) {
                enforce(userId, RequiredMessage!"userId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId), content, mediaContent);
                setUserId(userId);
            }

            override {
                public Create set$Xgafv(string $Xgafv) {
                    return cast(Create) super.set$Xgafv($Xgafv);
                }

                public Create setAccessToken(string accessToken) {
                    return cast(Create) super.setAccessToken(accessToken);
                }

                public Create setAlt(string alt) {
                    return cast(Create) super.setAlt(alt);
                }

                public Create setCallback(string callback) {
                    return cast(Create) super.setCallback(callback);
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

                public Create setUploadType(string uploadType) {
                    return cast(Create) super.setUploadType(uploadType);
                }

                public Create setUploadProtocol(string uploadProtocol) {
                    return cast(Create) super.setUploadProtocol(uploadProtocol);
                }
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            private string userId;

            /** The user's email address. The special value `me` can be used to indicate the authenticated user.
            [default: me]
            */
            public string getUserId() {
                return userId;
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            public Create setUserId(string userId) {
                this.userId = userId;
                return this;
            }

            override public Create set(T)(string parameterName, T value) {
                return cast(Create) super.set!T(parameterName, value);
            }

            public gmail.models.draft.Draft execute() {
                return super.set!"POST"();
            }
        }

        public Delete!(Request, Response) delete_(string userId, string id) {
            Delete!(Request, Response) result = new Delete!(Request, Response)(userId, id);
            initialize(Request, Response, Delete)(result);
            return result;
        }

        public class Delete(RequestT = Request, ResponseT = Response) :
            APIRequest!(gmail.models.draft.Draft, RequestT, ResponseT) {
            private static const string REST_PATH = "gmail/v1/users/%s/drafts/%s";

            protected this(string userId, string id) {
                enforce(userId, RequiredMessage!"userId");
                enforce(id, RequiredMessage!"id");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId, id));
                setUserId(userId);
                setId(id);
            }

            override {
                public Delete set$Xgafv(string $Xgafv) {
                    return cast(Delete) super.set$Xgafv($Xgafv);
                }

                public Delete setAccessToken(string accessToken) {
                    return cast(Delete) super.setAccessToken(accessToken);
                }

                public Delete setAlt(string alt) {
                    return cast(Delete) super.setAlt(alt);
                }

                public Delete setCallback(string callback) {
                    return cast(Delete) super.setCallback(callback);
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

                public Delete setUploadType(string uploadType) {
                    return cast(Delete) super.setUploadType(uploadType);
                }

                public Delete setUploadProtocol(string uploadProtocol) {
                    return cast(Delete) super.setUploadProtocol(uploadProtocol);
                }
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            private string userId;

            /** The user's email address. The special value `me` can be used to indicate the authenticated user.
            [default: me]
            */
            public string getUserId() {
                return userId;
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            public Delete setUserId(string userId) {
                this.userId = userId;
                return this;
            }

            /** The ID of the draft to delete. */
            private string id;

            /** The ID of the draft to delete.
            */
            public string getId() {
                return id;
            }

            /** The ID of the draft to delete. */
            public Delete setId(string id) {
                this.id = id;
                return this;
            }

            override public Delete set(T)(string parameterName, T value) {
                return cast(Delete) super.set!T(parameterName, value);
            }

            public void execute() {
                super.exec!"DELETE"();
            }
        }

        public List!(Request, Response) list(string userId) {
            List!(Request, Response) result = new List!(Request, Response)(userId);
            initialize(Request, Response, List)(result);
            return result;
        }

        public class List(RequestT = Request, ResponseT = Response) :
            APIRequest!(gmail.models.listdraftsresponse.ListDraftsResponse, RequestT, ResponseT) {
            private static const string REST_PATH = "gmail/v1/users/%s/drafts";

            protected this(string userId) {
                enforce(userId, RequiredMessage!"userId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId));
                setUserId(userId);
            }

            override {
                public List set$Xgafv(string $Xgafv) {
                  return cast(List) super.set$Xgafv($Xgafv);
                }

                public List setAccessToken(string accessToken) {
                  return cast(List) super.setAccessToken(accessToken);
                }

                public List setAlt(string alt) {
                  return cast(List) super.setAlt(alt);
                }

                public List setCallback(string callback) {
                  return cast(List) super.setCallback(callback);
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

                public List setUploadType(string uploadType) {
                  return cast(List) super.setUploadType(uploadType);
                }

                public List setUploadProtocol(string uploadProtocol) {
                  return cast(List) super.setUploadProtocol(uploadProtocol);
                }
            }

            /**
             * The user's email address. The special value `me` can be used to indicate the
             * authenticated user.
             */
            private string userId;

            /** The user's email address. The special value `me` can be used to indicate the authenticated user.
            [default: me]
             */
            public string getUserId() {
              return userId;
            }

            /**
             * The user's email address. The special value `me` can be used to indicate the
             * authenticated user.
             */
            public List setUserId(string userId) {
              this.userId = userId;
              return this;
            }

            /** Include drafts from `SPAM` and `TRASH` in the results. */
            private Nullable!bool includeSpamTrash;

            /** Include drafts from `SPAM` and `TRASH` in the results. [default: false]
             */
            public bool getIncludeSpamTrash() {
              return includeSpamTrash.get;
            }

            /** Include drafts from `SPAM` and `TRASH` in the results. */
            public List setIncludeSpamTrash(bool includeSpamTrash) {
              this.includeSpamTrash = includeSpamTrash.nullable;
              return cast(List) super.set!bool("includeSpamTrash", includeSpamTrash);
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
             * Include drafts from `SPAM` and `TRASH` in the results.
             * </p>
             */
            public bool isIncludeSpamTrash() {
              if (includeSpamTrash.isNull) {
                return false;
              }
              return includeSpamTrash.get;
            }

            /** Maximum number of drafts to return. */
            private long maxResults;

            /** Maximum number of drafts to return. [default: 100]
             */
            public long getMaxResults() {
              return maxResults;
            }

            /** Maximum number of drafts to return. */
            public List setMaxResults(long maxResults) {
              this.maxResults = maxResults;
              return cast(List) super.set!long("maxResults", maxResults);
            }

            /** Page token to retrieve a specific page of results in the list. */
            private string pageToken;

            /** Page token to retrieve a specific page of results in the list.
             */
            public string getPageToken() {
              return pageToken;
            }

            /** Page token to retrieve a specific page of results in the list. */
            public List setPageToken(string pageToken) {
              this.pageToken = pageToken;
              return cast(List) super.set("pageToken", pageToken);
            }

            /**
             * Only return draft messages matching the specified query. Supports the same query format
             * as the Gmail search box. For example, `"from:someuser@example.com rfc822msgid:
             * is:unread"`.
             */
            private string q;

            /** Only return draft messages matching the specified query. Supports the same query format as the
            Gmail search box. For example, `"from:someuser@example.com rfc822msgid: is:unread"`.
             */
            public string getQ() {
              return q;
            }

            /**
             * Only return draft messages matching the specified query. Supports the same query format
             * as the Gmail search box. For example, `"from:someuser@example.com rfc822msgid:
             * is:unread"`.
             */
            public List setQ(string q) {
              this.q = q;
              return cast(List) super.set("q", q);
            }

            override public List set(T)(string parameterName, T value) {
              return cast(List) super.set!T(parameterName, value);
            }

            public gmail.models.listdraftsresponse.ListDraftsResponse execute() {
                return super.exec!"GET"();
            }
        }

        public Send!(Request, Response) send(string userId,
            gmail.models.draft.Draft content) {
            Send!(Request, Response) result = new Send!(Request, Response)(userId, content);
            initialize(Request, Response, Send)(result);
            return result;
        }

        public Send!(Request, Response) send(string userId,
            gmail.models.draft.Draft content, string mediaContent) {
            Send!(Request, Response) result = new Send!(Request, Response)(userId, content, mediaContent);
            initialize(Request, Response, Send)(result);
            return result;
        }

        public class Send(RequestT = Request, ResponseT = Response) :
            APIRequest!(gmail.models.draft.Draft, RequestT, ResponseT) {
            private static const string REST_PATH = "gmail/v1/users/%s/drafts/send";

            protected this(string userId,
                gmail.models.draft.Draft content) {
                enforce(userId, RequiredMessage!"userId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId), content);
                setUserId(userId);
            }

            protected this(string userId,
                gmail.models.draft.Draft content, string mediaContent) {
                enforce(userId, RequiredMessage!"userId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId), content, mediaContent);
                setUserId(userId);
            }

            override {
                public Send set$Xgafv(string $Xgafv) {
                    return cast(Send) super.set$Xgafv($Xgafv);
                }

                public Send setAccessToken(string accessToken) {
                    return cast(Send) super.setAccessToken(accessToken);
                }

                public Send setAlt(string alt) {
                    return cast(Send) super.setAlt(alt);
                }

                public Send setCallback(string callback) {
                    return cast(Send) super.setCallback(callback);
                }

                public Send setFields(string fields) {
                    return cast(Send) super.setFields(fields);
                }

                public Send setKey(string key) {
                    return cast(Send) super.setKey(key);
                }

                public Send setOauthToken(string oauthToken) {
                    return cast(Send) super.setOauthToken(oauthToken);
                }

                public Send setPrettyPrint(bool prettyPrint) {
                    return cast(Send) super.setPrettyPrint(prettyPrint);
                }

                public Send setQuotaUser(string quotaUser) {
                    return cast(Send) super.setQuotaUser(quotaUser);
                }

                public Send setUploadType(string uploadType) {
                    return cast(Send) super.setUploadType(uploadType);
                }

                public Send setUploadProtocol(string uploadProtocol) {
                    return cast(Send) super.setUploadProtocol(uploadProtocol);
                }
            }

            /**
             * The user's email address. The special value `me` can be used to indicate the
             * authenticated user.
             */
            private string userId;

            /** The user's email address. The special value `me` can be used to indicate the authenticated user.
             *  [default: me]
             */
            public string getUserId() {
                return userId;
            }

            /**
             * The user's email address. The special value `me` can be used to indicate the
             * authenticated user.
             */
            public Send setUserId(string userId) {
                this.userId = userId;
                return this;
            }

            override public Send set(T)(string parameterName, T value) {
                return cast(Send) super.set!T(parameterName, value);
            }

            public gmail.models.draft.Draft execute() {
                return super.exec!"POST"();
            }
        }

        public Update!(Request, Response) update(string userId,
            string id, gmail.models.draft.Draft content) {
            Update!(Request, Response) result = new Update!(Request, Response)(userId, id, content);
            initialize(Request, Response, Update)(result);
            return result;
        }

        public Update!(Request, Response) update(string userId, string id,
            gmail.models.draft.Draft content, string mediaContent) {
            Update!(Request, Response) result = new Update!(Request, Response)(userId, id, content, mediaContent);
            initialize(Request, Response, Update)(result);
            return result;
        }

        public class Update(RequestT = Request, ResponseT = Response) :
            APIRequest!(gmail.models.draft.Draft, RequestT, ResponseT) {
            private static const string REST_PATH = "gmail/v1/users/%s/drafts/%s";

            protected this(string userId, string id,
                gmail.models.draft.Draft content) {
                enforce(userId, RequiredMessage!"userId");
                enforce(id, RequiredMessage!"id");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId, id), content);
                setUserId(userId);
                setId(id);
            }

            protected this(string userId, string id,
                gmail.models.draft.Draft content, string mediaContent) {
                enforce(userId, RequiredMessage!"userId");
                enforce(id, RequiredMessage!"id");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId, id),
                        content, mediaContent);
                setUserId(userId);
                setId(id);
            }

            override {
                public Update set$Xgafv(string $Xgafv) {
                    return cast(Update) super.set$Xgafv($Xgafv);
                }

                public Update setAccessToken(string accessToken) {
                    return cast(Update) super.setAccessToken(accessToken);
                }

                public Update setAlt(string alt) {
                    return cast(Update) super.setAlt(alt);
                }

                public Update setCallback(string callback) {
                    return cast(Update) super.setCallback(callback);
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

                public Update setUploadType(string uploadType) {
                    return cast(Update) super.setUploadType(uploadType);
                }

                public Update setUploadProtocol(string uploadProtocol) {
                    return cast(Update) super.setUploadProtocol(uploadProtocol);
                }
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            private string userId;

            /** The user's email address. The special value `me` can be used to indicate the authenticated user.
             *  [default: me]
            */
            public string getUserId() {
                return userId;
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            public Update setUserId(string userId) {
                this.userId = userId;
                return this;
            }

            /** The ID of the draft to update. */
            private string id;

            /** The ID of the draft to update.
            */
            public string getId() {
                return id;
            }

            /** The ID of the draft to update. */
            public Update setId(string id) {
                this.id = id;
                return this;
            }

            override public Update set(T)(string parameterName, T value) {
                return cast(Update) super.set!T(parameterName, value);
            }

            public gmail.models.draft.Draft execute() {
                return super.exec!"PUT"();
            }
        }
    }

    public History history() {
        return new History();
    }

    public class History {
        public List!(Request, Response) list(string userId) {
            List!(Request, Response) result = new List!(Request, Response)(userId);
            initialize!(Request, Response, List)(result);
            return result;
        }

        public class List(RequestT = Request, ResponseT = Response) :
            APIRequest!(gmail.models.listhistoryresponse.ListHistoryResponse, RequestT, ResponseT) {
            private static const string REST_PATH = "gmail/v1/users/%s/history";

            protected this(string userId) {
                enforce(userId, RequiredMessage!"userId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId));
                setUserId(userId);
            }


            override {
                public List set$Xgafv(string $Xgafv) {
                    return cast(List) super.set$Xgafv($Xgafv);
                }

                public List setAccessToken(string accessToken) {
                    return cast(List) super.setAccessToken(accessToken);
                }

                public List setAlt(string alt) {
                    return cast(List) super.setAlt(alt);
                }

                public List setCallback(string callback) {
                    return cast(List) super.setCallback(callback);
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

                public List setUploadType(string uploadType) {
                    return cast(List) super.setUploadType(uploadType);
                }

                public List setUploadProtocol(string uploadProtocol) {
                    return cast(List) super.setUploadProtocol(uploadProtocol);
                }
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            private string userId;

            /** The user's email address. The special value `me` can be used to indicate the authenticated user.
             *  [default: me]
            */
            public string getUserId() {
                return userId;
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            public List setUserId(string userId) {
                this.userId = userId;
                return this;
            }

            /** History types to be returned by the function */
            private string[] historyTypes;

            /** History types to be returned by the function
            */
            public string[] getHistoryTypes() {
                return historyTypes;
            }

            /** History types to be returned by the function */
            public List setHistoryTypes(string[] historyTypes) {
                this.historyTypes = historyTypes;
                return this;
            }

            /** Only return messages with a label matching the ID. */
            private string labelId;

            /** Only return messages with a label matching the ID.
            */
            public string getLabelId() {
                return labelId;
            }

            /** Only return messages with a label matching the ID. */
            public List setLabelId(string labelId) {
                this.labelId = labelId;
                return cast(List) super.set("labelId", labelId);
            }

            /** The maximum number of history records to return. */
            private long maxResults;

            /** The maximum number of history records to return. [default: 100]
            */
            public long getMaxResults() {
                return maxResults;
            }

            /** The maximum number of history records to return. */
            public List setMaxResults(long maxResults) {
                this.maxResults = maxResults;
                return cast(List) super.set!long("maxResults", maxResults);
            }

            /** Page token to retrieve a specific page of results in the list. */
            private string pageToken;

            /** Page token to retrieve a specific page of results in the list.
            */
            public string getPageToken() {
                return pageToken;
            }

            /** Page token to retrieve a specific page of results in the list. */
            public List setPageToken(string pageToken) {
                this.pageToken = pageToken;
                return cast(List) super.set("pageToken", pageToken);
            }

            /**
            * Required. Returns history records after the specified `startHistoryId`. The supplied
            * `startHistoryId` should be obtained from the `historyId` of a message, thread, or
            * previous `list` response. History IDs increase chronologically but are not contiguous
            * with random gaps in between valid IDs. Supplying an invalid or out of date
            * `startHistoryId` typically returns an `HTTP 404` error code. A `historyId` is typically
            * valid for at least a week, but in some rare circumstances may be valid for only a few
            * hours. If you receive an `HTTP 404` error response, your application should perform a
            * full sync. If you receive no `nextPageToken` in the response, there are no updates to
            * retrieve and you can store the returned `historyId` for a future request.
            */
            private long long startHistoryId;

            /** Required. Returns history records after the specified `startHistoryId`. The supplied
                `startHistoryId` should be obtained from the `historyId` of a message, thread, or previous `list`
                response. History IDs increase chronologically but are not contiguous with random gaps in between
                valid IDs. Supplying an invalid or out of date `startHistoryId` typically returns an `HTTP 404`
                error code. A `historyId` is typically valid for at least a week, but in some rare circumstances
                may be valid for only a few hours. If you receive an `HTTP 404` error response, your application
                should perform a full sync. If you receive no `nextPageToken` in the response, there are no updates
                to retrieve and you can store the returned `historyId` for a future request.
            */
            public long long getStartHistoryId() {
                return startHistoryId;
            }

            /**
            * Required. Returns history records after the specified `startHistoryId`. The supplied
            * `startHistoryId` should be obtained from the `historyId` of a message, thread, or
            * previous `list` response. History IDs increase chronologically but are not contiguous
            * with random gaps in between valid IDs. Supplying an invalid or out of date
            * `startHistoryId` typically returns an `HTTP 404` error code. A `historyId` is typically
            * valid for at least a week, but in some rare circumstances may be valid for only a few
            * hours. If you receive an `HTTP 404` error response, your application should perform a
            * full sync. If you receive no `nextPageToken` in the response, there are no updates to
            * retrieve and you can store the returned `historyId` for a future request.
            */
            public List setStartHistoryId(long long startHistoryId) {
                this.startHistoryId = startHistoryId;
                return cast(List) super.set!(long long)("startHistoryId", startHistoryId);
            }

            public List set(T)(string parameterName, T value) {
                return cast(List) super.set!T(parameterName, value);
            }

            public gmail.models.listhistoryresponse.ListHistoryResponse execute() {
                return super.exec!"GET"();
            }
        }


    }

    public Labels labels() {
        return new Labels();
    }

    public class Labels {
        public Create!(Request, Response) create(string userId,
            gmail.models.label.Label content) {
            Create!(Request, Response) result = new Create!(Request, Response)(userId, content);
            initialize!(Request, Response, Create)(result);
            return result;
        }

        public class Create(RequestT = Request, ResponseT = Response) :
            APIRequest!(gmail.models.label.Label, RequestT, ResponseT) {
            private static const string REST_PATH = "gmail/v1/users/%s/labels";

            protected this(string userId,
                gmail.models.label.Label content) {
                enforce(userId, RequiredMessage!"userId");
                enforce(content !is null, RequoredMessage!"content");
                enforce(content.getLabelListVisibility, RequiredMessage!"Label.getLabelListVisibility()");
                enforce(content.getMessageListVisibility, RequiredMessage!"Label.getMessageListVisibility()");
                enforce(content.getName, RequiredMessage!"Label.getName()");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId), content);
                setUserId(userId);
            }

            public Create set$Xgafv(string $Xgafv) {
                return cast(Create) super.set$Xgafv($Xgafv);
            }

            public Create setAccessToken(string accessToken) {
                return cast(Create) super.setAccessToken(accessToken);
            }

            public Create setAlt(string alt) {
                return cast(Create) super.setAlt(alt);
            }

            public Create setCallback(string callback) {
                return cast(Create) super.setCallback(callback);
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

            public Create setUploadType(string uploadType) {
            return (Create) super.setUploadType(uploadType);
            }

            public Create setUploadProtocol(string uploadProtocol) {
                return cast(Create) super.setUploadProtocol(uploadProtocol);
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            private string userId;

            /** The user's email address. The special value `me` can be used to indicate the authenticated user.
             *  [default: me]
            */
            public string getUserId() {
                return userId;
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            public Create setUserId(string userId) {
                this.userId = userId;
                return this;
            }

            override public Create set(T)(string parameterName, T value) {
                return cast(Create) super.set!T(parameterName, value);
            }

            public gmail.models.label.Label execute() {
                return super.exec!"POST"();
            }
        }

        public Delete!(Request, Response) delete_(string userId, string id) {
            Delete!(Request, Response) result = new Delete!(Request, Response)(userId, id);
            initialize!(Request, Response, Delete)(result);
            return result;
        }

        public class Delete(RequestT = Request, ResponseT = Response) :
            APIRequest!(gmail.models.label.Label, RequestT, ResponseT) {
            private static const string REST_PATH = "gmail/v1/users/%s/labels/%s";

            protected this(string userId,
                gmail.models.label.Label content) {
                enforce(userId, RequiredMessage!"userId");
                enforce(id, RequiredMessage!"id");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId, id));
                setUserId(userId);
                setId(id);
            }

            override {
                public Delete set$Xgafv(string $Xgafv) {
                    return cast(Delete) super.set$Xgafv($Xgafv);
                }

                public Delete setAccessToken(string accessToken) {
                    return cast(Delete) super.setAccessToken(accessToken);
                }

                public Delete setAlt(string alt) {
                    return cast(Delete) super.setAlt(alt);
                }

                public Delete setCallback(string callback) {
                    return cast(Delete) super.setCallback(callback);
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

                public Delete setUploadType(string uploadType) {
                    return cast(Delete) super.setUploadType(uploadType);
                }

                public Delete setUploadProtocol(string uploadProtocol) {
                    return (Delete) super.setUploadProtocol(uploadProtocol);
                }
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            private string userId;

            /** The user's email address. The special value `me` can be used to indicate the authenticated user.
             *  [default: me]
            */
            public string getUserId() {
                return userId;
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            public Delete setUserId(string userId) {
                this.userId = userId;
                return this;
            }

            /** The ID of the label to delete. */
            private string id;

            /** The ID of the label to delete.
            */
            public string getId() {
                return id;
            }

            /** The ID of the label to delete. */
            public Delete setId(string id) {
                this.id = id;
                return this;
            }

            override public Delete set(T)(string parameterName, T value) {
                return cast(Delete) super.set!T(parameterName, value);
            }

            public void execute() {
                super.exec!"DELETE"();
            }
        }

        /**
        * Gets the specified label.
        *
        * Create a request for the method "labels.get".
        *
        * This request holds the parameters needed by the gmail server.  After setting any optional
        * parameters, call the {@link Get#execute()} method to invoke the remote operation.
        *
        * @param userId The user's email address. The special value `me` can be used to indicate the authenticated user.
        *        [default: me]
        * @param id The ID of the label to retrieve.
        * @return the request
        */
        public Get!(Request, Response) get(string userId, string id) {
            Get!(Request, Response) result = new Get!(Request, Response)(userId, id);
            initialize!(Request, Response, Get)(result);
            return result;
        }

        public class Get (RequestT = Request, ResponseT = Response) :
            APIRequest!(gmail.models.label.Label, RequestT, ResponseT) {

            private static const string REST_PATH = "gmail/v1/users/%s/labels/%s";

            /**
            * Gets the specified label.
            *
            * Create a request for the method "labels.get".
            *
            * This request holds the parameters needed by the the gmail server.  After setting any optional
            * parameters, call the {@link Get#execute()} method to invoke the remote operation. <p> {@link
            * Get#initialize(com.google.api.client.googleapis.services.AbstractGoogleClientRequest)} must be
            * called to initialize this instance immediately after invoking the constructor. </p>
            *
            * @param userId The user's email address. The special value `me` can be used to indicate the authenticated user.
            *        [default: me]
            * @param id The ID of the label to retrieve.
            * @since 1.13
            */
            protected Get(string userId, string id) {
                enforce(userId, RequiredMessage!"userId");
                enforce(id, RequiredMessage!"id");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId, id))
                setUserId(userId);
                setId(id);
            }

            override {
                public Get set$Xgafv(string $Xgafv) {
                    return cast(Get) super.set$Xgafv($Xgafv);
                }

                public Get setAccessToken(string accessToken) {
                    return cast(Get) super.setAccessToken(accessToken);
                }

                public Get setAlt(string alt) {
                    return cast(Get) super.setAlt(alt);
                }

                public Get setCallback(string callback) {
                    return cast(Get) super.setCallback(callback);
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

                public Get setUploadType(string uploadType) {
                    return cast(Get) super.setUploadType(uploadType);
                }

                public Get setUploadProtocol(string uploadProtocol) {
                    return cast(Get) super.setUploadProtocol(uploadProtocol);
                }
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            private string userId;

            /** The user's email address. The special value `me` can be used to indicate the authenticated user.
             *  [default: me]
             */
            public string getUserId() {
                return userId;
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            public Get setUserId(string userId) {
                this.userId = userId;
                return this;
            }

            /** The ID of the label to retrieve. */
            private string id;

            /** The ID of the label to retrieve.
            */
            public string getId() {
                return id;
            }

            /** The ID of the label to retrieve. */
            public Get setId(string id) {
                this.id = id;
                return this;
            }

            override public Get set(T)(string parameterName, T value) {
                return cast(Get) super.set!T(parameterName, value);
            }

            public gmail.models.label.Label execute() {
                return super.exec!"GET"();
            }
        }

        /**
        * Lists all labels in the user's mailbox.
        *
        * Create a request for the method "labels.list".
        *
        * This request holds the parameters needed by the gmail server.  After setting any optional
        * parameters, call the {@link List#execute()} method to invoke the remote operation.
        *
        * @param userId The user's email address. The special value `me` can be used to indicate the authenticated user.
        *        [default: me]
        * @return the request
        */
        public List!(Request, Response) list(string userId) {
            List!(Request, Response) result = new List!(Request, Response)(userId);
            initialize!(Request, Response, List)(result);
            return result;
        }

        public class List(RequestT = Request, ResponseT = Response) :
            APIRequest!(gmail.models.listlabelsresponse.ListLabelsResponse, RequestT, ResponseT) {
            private static const string REST_PATH = "gmail/v1/users/%s/labels";

            /**
            * Lists all labels in the user's mailbox.
            *
            * Create a request for the method "labels.list".
            *
            * This request holds the parameters needed by the the gmail server.  After setting any optional
            * parameters, call the {@link List#execute()} method to invoke the remote operation. <p> {@link
            * List#initialize(com.google.api.client.googleapis.services.AbstractGoogleClientRequest)} must be
            * called to initialize this instance immediately after invoking the constructor. </p>
            *
            * @param userId The user's email address. The special value `me` can be used to indicate the authenticated user.
            *        [default: me]
            * @since 1.13
            */
            protected List(string userId) {
                enforce(userId, RequiredMessage!"userId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId));
                setUserId(userId);
            }

            override {
                public List set$Xgafv(string $Xgafv) {
                    return cast(List) super.set$Xgafv($Xgafv);
                }

                public List setAccessToken(string accessToken) {
                    return cast(List) super.setAccessToken(accessToken);
                }

                public List setAlt(string alt) {
                    return cast(List) super.setAlt(alt);
                }

                public List setCallback(string callback) {
                    return cast(List) super.setCallback(callback);
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

                public List setUploadType(string uploadType) {
                    return cast(List) super.setUploadType(uploadType);
                }

                public List setUploadProtocol(string uploadProtocol) {
                    return cast(List) super.setUploadProtocol(uploadProtocol);
                }
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            private string userId;

            /** The user's email address. The special value `me` can be used to indicate the authenticated user.
             *  [default: me]
            */
            public string getUserId() {
                return userId;
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            public List setUserId(string userId) {
                this.userId = userId;
                return this;
            }

            override public List set(T)(string parameterName, T value) {
                return cast(List) super.set!T(parameterName, value);
            }

            public gmail.models.listlabelsresponse.ListLabelsResponse execute() {
                return super.exec!"GET"();
            }
        }

        /**
        * Patch the specified label.
        *
        * Create a request for the method "labels.patch".
        *
        * This request holds the parameters needed by the gmail server.  After setting any optional
        * parameters, call the {@link Patch#execute()} method to invoke the remote operation.
        *
        * @param userId The user's email address. The special value `me` can be used to indicate the authenticated user.
        *        [default: me]
        * @param id The ID of the label to update.
        * @param content the {@link com.google.api.services.gmail.model.Label}
        * @return the request
        */
        public Patch!(Request, Response) patch(string userId, string id,
            gmail.models.label.Label content) {
            Patch!(Request, Response) result = new Patch!(Request, Response)(userId, id, content);
            initialize!(Request, Response, Patch)(result);
            return result;
        }

        public class Patch(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gmail.models.label.Label, RequestT, ResponseT) {

            private static const string REST_PATH = "gmail/v1/users/%s/labels/%s";

            /**
            * Patch the specified label.
            *
            * Create a request for the method "labels.patch".
            *
            * This request holds the parameters needed by the the gmail server.  After setting any optional
            * parameters, call the {@link Patch#execute()} method to invoke the remote operation. <p> {@link
            * Patch#initialize(com.google.api.client.googleapis.services.AbstractGoogleClientRequest)} must
            * be called to initialize this instance immediately after invoking the constructor. </p>
            *
            * @param userId The user's email address. The special value `me` can be used to indicate the authenticated user.
        *        [default: me]
            * @param id The ID of the label to update.
            * @param content the {@link com.google.api.services.gmail.model.Label}
            * @since 1.13
            */
            protected Patch(string userId, string id, gmail.models.label.Label content) {
                enforce(userId, RequiredMessage!"userId");
                enforce(id, RequiredMessage!"id");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId, id), content);
            }

            override {
                public Patch set$Xgafv(string $Xgafv) {
                    return (Patch) super.set$Xgafv($Xgafv);
                }

                public Patch setAccessToken(string accessToken) {
                    return cast(Patch) super.setAccessToken(accessToken);
                }

                public Patch setAlt(string alt) {
                    return cast(Patch) super.setAlt(alt);
                }

                public Patch setCallback(string callback) {
                    return cast(Patch) super.setCallback(callback);
                }

                public Patch setFields(string fields) {
                    return cast(Patch) super.setFields(fields);
                }

                public Patch setKey(string key) {
                    return cast(Patch) super.setKey(key);
                }

                public Patch setOauthToken(string oauthToken) {
                    return cast(Patch) super.setOauthToken(oauthToken);
                }

                public Patch setPrettyPrint(bool prettyPrint) {
                    return cast(Patch) super.setPrettyPrint(prettyPrint);
                }

                public Patch setQuotaUser(string quotaUser) {
                    return cast(Patch) super.setQuotaUser(quotaUser);
                }

                public Patch setUploadType(string uploadType) {
                    return cast(Patch) super.setUploadType(uploadType);
                }

                public Patch setUploadProtocol(string uploadProtocol) {
                    return cast(Patch) super.setUploadProtocol(uploadProtocol);
                }
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            private string userId;

            /** The user's email address. The special value `me` can be used to indicate the authenticated user.
             *  [default: me]
             */
            public string getUserId() {
                return userId;
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            public Patch setUserId(string userId) {
                this.userId = userId;
                return this;
            }

            /** The ID of the label to update. */
            private string id;

            /** The ID of the label to update.
            */
            public string getId() {
                return id;
            }

            /** The ID of the label to update. */
            public Patch setId(string id) {
                this.id = id;
                return this;
            }

            override public Patch set(T)(string parameterName, T value) {
                return cast(Patch) super.set!T(parameterName, value);
            }

            public gmail.models.label.Label execute() {
                return super.exec!"PATCH"();
            }
        }
        /**
        * Updates the specified label.
        *
        * Create a request for the method "labels.update".
        *
        * This request holds the parameters needed by the gmail server.  After setting any optional
        * parameters, call the {@link Update#execute()} method to invoke the remote operation.
        *
        * @param userId The user's email address. The special value `me` can be used to indicate the authenticated user.
        *        [default: me]
        * @param id The ID of the label to update.
        * @param content the {@link com.google.api.services.gmail.model.Label}
        * @return the request
        */
        public Update(Request, Response) update(string userId, string id, gmail.models.label.Label content) {
            Update(Request, Response) result = new Update!(Request, Response)(userId, id, content);
            initialize!(Request, Response, Update)(result);
            return result;
        }

        public class Update(RequestT = Request, ResponseT = Response) :
            APIRequest!(gmail.models.label.Label, RequestT, ResponseT) {
            private static final String REST_PATH = "gmail/v1/users/%s/labels/%s";

            /**
            * Updates the specified label.
            *
            * Create a request for the method "labels.update".
            *
            * This request holds the parameters needed by the the gmail server.  After setting any optional
            * parameters, call the {@link Update#execute()} method to invoke the remote operation. <p> {@link
            * Update#initialize(com.google.api.client.googleapis.services.AbstractGoogleClientRequest)} must
            * be called to initialize this instance immediately after invoking the constructor. </p>
            *
            * @param userId The user's email address. The special value `me` can be used to indicate the authenticated user.
        *        [default: me]
            * @param id The ID of the label to update.
            * @param content the {@link com.google.api.services.gmail.model.Label}
            * @since 1.13
            */
            protected Update(string userId, string id, gmail.models.label.Label content) {
                enforce(userId, RequiredMessage!"userId");
                enforce(id, RequiredMessage!"id");
                enforce(content.getId(), RequiredMessage!"Label.getId()");
                enforce(content.getLabelListVisibility() !is null, RequiredMessage!"Label.getLabelListVisibility()");
                enforce(content.getMessageListVisibility() !is null, RequiredMessage!"Label.getMessageListVisibility()");

                super(DEFAULT_BASE_URL ~ format!(userId, id), content);
                setUserId(userId);
                setId(id);
            }

            override {
                public Update set$Xgafv(string $Xgafv) {
                    return cast(Update) super.set$Xgafv($Xgafv);
                }

                public Update setAccessToken(string accessToken) {
                    return cast(Update) super.setAccessToken(accessToken);
                }

                public Update setAlt(string alt) {
                    return cast(Update) super.setAlt(alt);
                }

                public Update setCallback(string callback) {
                    return cast(Update) super.setCallback(callback);
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

                public Update setUploadType(string uploadType) {
                    return cast(Update) super.setUploadType(uploadType);
                }

                public Update setUploadProtocol(string uploadProtocol) {
                    return cast(Update) super.setUploadProtocol(uploadProtocol);
                }
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            private string userId;

            /** The user's email address. The special value `me` can be used to indicate the authenticated user.
             *  [default: me]
             */
            public string getUserId() {
                return userId;
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            public Update setUserId(string userId) {
                this.userId = userId;
                return this;
            }

            /** The ID of the label to update. */
            private string id;

            /** The ID of the label to update.
            */
            public string getId() {
                return id;
            }

            /** The ID of the label to update. */
            public Update setId(string id) {
                this.id = id;
                return this;
            }

            public Update set(T)(string parameterName, T value) {
                return cast(Update) super.set!T(parameterName, value);
            }

            public gmail.models.label.Label execute() {
                return super.exec!"PUT"();
            }
        }
    }

    public Messages messages() {
        return new Messages();
    }

    public class Messages {
        /**
        * Deletes many messages by message ID. Provides no guarantees that messages were not already
        * deleted or even existed at all.
        *
        * Create a request for the method "messages.batchDelete".
        *
        * This request holds the parameters needed by the gmail server.  After setting any optional
        * parameters, call the {@link BatchDelete#execute()} method to invoke the remote operation.
        *
        * @param userId The user's email address. The special value `me` can be used to indicate the authenticated user.
        *        [default: me]
        * @param content the {@link com.google.api.services.gmail.model.BatchDeleteMessagesRequest}
        * @return the request
        */
        public BatchDelete!(Request, Response) batchDelete(string userId, gmail.models.batchdeletemessagesrequest.BatchDeleteMessagesRequest content) {
            BatchDelete!(Request, Response) result = new BatchDelete!(Request, Response)(userId, content);
            initialize!(Request, Response, BatchDelete)(result);
            return result;
        }

        public class BatchDelete extends GmailRequest<Void> {

            private static final String REST_PATH = "gmail/v1/users/%s/messages/batchDelete";

            /**
            * Deletes many messages by message ID. Provides no guarantees that messages were not already
            * deleted or even existed at all.
            *
            * Create a request for the method "messages.batchDelete".
            *
            * This request holds the parameters needed by the the gmail server.  After setting any optional
            * parameters, call the {@link BatchDelete#execute()} method to invoke the remote operation. <p>
            * {@link
            * BatchDelete#initialize(com.google.api.client.googleapis.services.AbstractGoogleClientRequest)}
            * must be called to initialize this instance immediately after invoking the constructor. </p>
            *
            * @param userId The user's email address. The special value `me` can be used to indicate the authenticated user.
            *        [default: me]
            * @param content the {@link com.google.api.services.gmail.model.BatchDeleteMessagesRequest}
            * @since 1.13
            */
            protected BatchDelete(string userId, gmail.models.batchdeletemessagesrequest.BatchDeleteMessagesRequest content) {
                enforce(userId, RequiredMessage!"userId");
                super(DEFAULT_BASE_URL ~ format!REST_PATH(userId), content);
            }

            override {
                public BatchDelete set$Xgafv(string $Xgafv) {
                    return cast(BatchDelete) super.set$Xgafv($Xgafv);
                }

                public BatchDelete setAccessToken(string accessToken) {
                    return cast(BatchDelete) super.setAccessToken(accessToken);
                }

                public BatchDelete setAlt(string alt) {
                    return cast(BatchDelete) super.setAlt(alt);
                }

                public BatchDelete setCallback(string callback) {
                    return cast(BatchDelete) super.setCallback(callback);
                }

                public BatchDelete setFields(string fields) {
                    return cast(BatchDelete) super.setFields(fields);
                }

                public BatchDelete setKey(string key) {
                    return cast(BatchDelete) super.setKey(key);
                }

                public BatchDelete setOauthToken(string oauthToken) {
                    return cast(BatchDelete) super.setOauthToken(oauthToken);
                }

                public BatchDelete setPrettyPrint(bool prettyPrint) {
                    return cast(BatchDelete) super.setPrettyPrint(prettyPrint);
                }

                public BatchDelete setQuotaUser(string quotaUser) {
                    return cast(BatchDelete) super.setQuotaUser(quotaUser);
                }

                public BatchDelete setUploadType(string uploadType) {
                    return cast(BatchDelete) super.setUploadType(uploadType);
                }

                public BatchDelete setUploadProtocol(string uploadProtocol) {
                    return cast(BatchDelete) super.setUploadProtocol(uploadProtocol);
                }
            }

            /**
            * The user's email address. The special value `me` can be used to indicate the
            * authenticated user.
            */
            private string userId;

            /** The user's email address. The special value `me` can be used to indicate the authenticated user.
             *  [default: me]
             */
            public string getUserId() {
                return userId;
            }

            /**
             * The user's email address. The special value `me` can be used to indicate the
             * authenticated user.
             */
            public BatchDelete setUserId(string userId) {
                this.userId = userId;
                return this;
            }

            override public BatchDelete set(T)(string parameterName, T value) {
                return cast(BatchDelete) super.set!T(parameterName, value);
            }

            public gmail.models.batchdeletemessagesrequest.BatchDeleteMessagesRequest execute() {
                return super.exec!"DELETE"();
            }
        }
    }
}
