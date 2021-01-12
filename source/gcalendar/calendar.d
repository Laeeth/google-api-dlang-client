module gcalendar.calendar;

import std.format : format;
import client;
import gcalendar.apirequest;
import gcalendar.models.acl;
import gcalendar.models.aclrule;
import gcalendar.models.channel;
import requests;
import std.exception : enforce;
import std.typecons : nullable, Nullable;

public class Calendar {
    /**
    * The default encoded root URL of the service. This is determined when the library is generated
    * and normally should not be changed.
    *
    */
    public static const string DEFAULT_ROOT_URL = "https://www.googleapis.com/";

    /**
    * The default encoded service path of the service. This is determined when the library is
    * generated and normally should not be changed.
    *
    * @since 1.7
    */
    public static const string DEFAULT_SERVICE_PATH = "calendar/v3/";

    /**
    * The default encoded base URL of the service. This is determined when the library is generated
    * and normally should not be changed.
    */
    public static const string DEFAULT_BASE_URL = DEFAULT_ROOT_URL ~ DEFAULT_SERVICE_PATH;

    private Client client;

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

    public Acl acl() {
        return new Acl();
    }

    public class Acl {
        public Delete!(Request, Response) delete_(string calendarId, string ruleId) {
            Delete!(Request, Response) result = new Delete!(Request, Response)(calendarId, ruleId);
            initialize!(Request, Response, Delete)(result);
            return result;
        }

        public class Delete(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.acl.Acl, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/acl/%s";

            protected this(string calendarId, string ruleId) {
                enforce(calendarId, RequiredMessage!"calendarId");
                enforce(ruleId, RequiredMessage!"ruleId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId, ruleId));
                this.calendarId = calendarId;
                this.ruleId = ruleId;
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

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Delete setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /** ACL rule identifier. */
            private string ruleId;

            /** ACL rule identifier.
            */
            public string getRuleId() {
                return ruleId;
            }

            /** ACL rule identifier. */
            public Delete setRuleId(string ruleId) {
                this.ruleId = ruleId;
                return this;
            }

            override public Delete set(T)(string parameterName, T value) {
               return cast(Delete) super.set!T(parameterName, value);
            }

            public void execute() {
                super.exec!"DELETE"();
            }
        }

        public Get!(Request, Response) get(string calendarId, string ruleId) {
            Get!(Request, Response) result = new Get!(Request, Response)(calendarId, ruleId);
            initialize!(Request, Response, Get)(result);
            return result;
        }

        public class Get(RequestT = Request, ResponseT = Response) :
            APIRequest!(gcalendar.models.acl.Acl, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/acl/%s";

            protected this(string calendarId, string ruleId) {
                calendarId = enforce(calendarId, RequiredMessage!"calendarId");
                ruleId = enforce(ruleId, RequiredMessage!"ruleId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId, ruleId));
                this.calendarId = calendarId;
                this.ruleId = ruleId;
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

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Get setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /** ACL rule identifier. */
            private string ruleId;

            /** ACL rule identifier.
            */
            public string getRuleId() {
                return ruleId;
            }

            /** ACL rule identifier. */
            public Get setRuleId(string ruleId) {
                this.ruleId = ruleId;
                return this;
            }

            override public Get set(T)(string parameterName, T value) {
                return cast(Get) super.set!(T)(parameterName, value);
            }

            public gcalendar.models.acl.Acl execute() {
                return super.exec!"GET"();
            }
        }

        public Insert!(Request, Response) insert(string calendarId,
            gcalendar.models.aclrule.AclRule content) {
            Insert!(Request, Response) result = new Insert!(Request, Response)(calendarId, content);
            initialize!(Request, Response, Insert)(result);
            return result;
        }

        public class Insert(RequestT = Request, ResponseT = Response) :
            APIRequest!(gcalendar.models.aclrule.AclRule, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/acl";

            protected this(string calendarId, gcalendar.models.aclrule.AclRule content) {
                calendarId = enforce(calendarId, RequiredMessage!("calendarId"));
                enforce(!content.isNull, RequiredMessage!"content");
                enforce(content.getRole(), RequiredMessage!"AclRule.getRole()");
                enforce(!content.getScope().isNull, RequiredMessage!"AclRule.getScope()");
                enforce(content.getScope().getType(), RequiredMessage!"AclRule.getScope().getType()");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId), content);
                this.calendarId = calendarId;
            }

            override {
                public Insert setAlt(string alt) {
                    return cast(Insert) super.setAlt(alt);
                }

                public Insert setFields(string fields) {
                    return cast(Insert) super.setFields(fields);
                }

                public Insert setKey(string key) {
                    return cast(Insert) super.setKey(key);
                }

                public Insert setOauthToken(string oauthToken) {
                    return cast(Insert) super.setOauthToken(oauthToken);
                }

                public Insert setPrettyPrint(bool prettyPrint) {
                    return cast(Insert) super.setPrettyPrint(prettyPrint);
                }

                public Insert setQuotaUser(string quotaUser) {
                    return cast(Insert) super.setQuotaUser(quotaUser);
                }

                public Insert setUserIp(string userIp) {
                    return cast(Insert) super.setUserIp(userIp);
                }
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Insert setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /**
            * Whether to send notifications about the calendar sharing change. Optional. The default is
            * True.
            */
            private Nullable!bool sendNotifications;

            /** Whether to send notifications about the calendar sharing change. Optional. The default is True.
            */
            public bool getSendNotifications() {
                return sendNotifications.get;
            }

            /**
            * Whether to send notifications about the calendar sharing change. Optional. The default is
            * True.
            */
            public Insert setSendNotifications(bool sendNotifications) {
                this.sendNotifications = sendNotifications.nullable;
                return cast(Insert) super.set!(bool)("sendNotifications", sendNotifications);
            }

            
            override public Insert set(T = string)(string parameterName, T value) {
                return cast(Insert) super.set!(T)(parameterName, value);
            }

            public gcalendar.models.aclrule.AclRule execute() {
                return super.exec!"POST"();
            }
        }

        public List!(Request, Response) list(string calendarId) {
            List!(Request, Response) result = new List!(Request, Response)(calendarId);
            initialize!(Request, Response, List)(result);
            return result;
        }

        public class List(RequestT = Request, ResponseT = Response) :
            APIRequest!(gcalendar.models.acl.Acl, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/acl";

            protected this(string calendarId) {
                calendarId = enforce(calendarId, RequiredMessage!("calendarId"));

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId));
                this.calendarId = calendarId;
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
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public List setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /**
            * Maximum number of entries returned on one result page. By default the value is 100 entries.
            * The page size can never be larger than 250 entries. Optional.
            */
            private int maxResults;

            /** Maximum number of entries returned on one result page. By default the value is 100 entries. The
            page size can never be larger than 250 entries. Optional.
            [minimum: 1]
            */
            public int getMaxResults() {
                return maxResults;
            }

            /**
            * Maximum number of entries returned on one result page. By default the value is 100 entries.
            * The page size can never be larger than 250 entries. Optional.
            */
            public List setMaxResults(int maxResults) {
                this.maxResults = maxResults;
                return cast(List) super.set!(int)("maxResults", maxResults);
            }

            /** Token specifying which result page to return. Optional. */
            private string pageToken;

            /** Token specifying which result page to return. Optional.
            */
            public string getPageToken() {
                return pageToken;
            }

            /** Token specifying which result page to return. Optional. */
            public List setPageToken(string pageToken) {
                this.pageToken = pageToken;
                return cast(List) super.set("pageToken", pageToken);
            }

            /**
            * Whether to include deleted ACLs in the result. Deleted ACLs are represented by role equal
            * to "none". Deleted ACLs will always be included if syncToken is provided. Optional. The
            * default is False.
            */
            private Nullable!bool showDeleted;

            /** Whether to include deleted ACLs in the result. Deleted ACLs are represented by role equal to
            "none". Deleted ACLs will always be included if syncToken is provided. Optional. The default is
            False.
            */
            public bool getShowDeleted() {
                return showDeleted.get;
            }

            /**
            * Whether to include deleted ACLs in the result. Deleted ACLs are represented by role equal
            * to "none". Deleted ACLs will always be included if syncToken is provided. Optional. The
            * default is False.
            */
            public List setShowDeleted(bool showDeleted) {
                this.showDeleted = showDeleted.nullable;
                return cast(List) super.set!(bool)("showDeleted", showDeleted);
            }

            /**
            * Token obtained from the nextSyncToken field returned on the last page of results from the
            * previous list request. It makes the result of this list request contain only entries that
            * have changed since then. All entries deleted since the previous list request will always be
            * in the result set and it is not allowed to set showDeleted to False. If the syncToken
            * expires, the server will respond with a 410 GONE response code and the client should clear
            * its storage and perform a full synchronization without any syncToken. Learn more about
            * incremental synchronization. Optional. The default is to return all entries.
            */
            private string syncToken;

            /** Token obtained from the nextSyncToken field returned on the last page of results from the previous
            list request. It makes the result of this list request contain only entries that have changed since
            then. All entries deleted since the previous list request will always be in the result set and it
            is not allowed to set showDeleted to False. If the syncToken expires, the server will respond with
            a 410 GONE response code and the client should clear its storage and perform a full synchronization
            without any syncToken. Learn more about incremental synchronization. Optional. The default is to
            return all entries.
            */
            public string getSyncToken() {
                return syncToken;
            }

            /**
            * Token obtained from the nextSyncToken field returned on the last page of results from the
            * previous list request. It makes the result of this list request contain only entries that
            * have changed since then. All entries deleted since the previous list request will always be
            * in the result set and it is not allowed to set showDeleted to False. If the syncToken
            * expires, the server will respond with a 410 GONE response code and the client should clear
            * its storage and perform a full synchronization without any syncToken. Learn more about
            * incremental synchronization. Optional. The default is to return all entries.
            */
            public List setSyncToken(string syncToken) {
                this.syncToken = syncToken;
                return cast(List) super.set("syncToken", syncToken);
            }

            override public List set(T = string)(string parameterName, T value) {
                return cast(List) super.set!(T)(parameterName, value);
            }

            public gcalendar.models.acl.Acl execute() {
                return super.exec!"GET"();
            }
        }

        public Patch!(Request, Response) patch(string calendarId, string ruleId,
            gcalendar.models.aclrule.AclRule content) {
            Patch!(Request, Response) result = new Patch!(Request, Response)
                (calendarId, ruleId, content);
            initialize!(Request, Response, Patch)(result);
            return result;
        }

        public class Patch(RequestT = Request, ResponseT = Response) :
            APIRequest!(gcalendar.models.aclrule.AclRule, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/acl/%s";

            protected this(string calendarId, string ruleId,
                gcalendar.models.aclrule.AclRule content) {
                calendarId = enforce(calendarId, RequiredMessage!"calendarId");
                ruleId = enforce(ruleId, RequiredMessage!"ruleId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId, ruleId), content);
                this.calendarId = calendarId;
                this.ruleId = ruleId;
            }

            override {
                public Patch setAlt(string alt) {
                    return cast(Patch) super.setAlt(alt);
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

                public Patch setUserIp(string userIp) {
                    return cast(Patch) super.setUserIp(userIp);
                }
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Patch setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /** ACL rule identifier. */
            private string ruleId;

            /** ACL rule identifier.
            */
            public string getRuleId() {
                return ruleId;
            }

            /** ACL rule identifier. */
            public Patch setRuleId(string ruleId) {
                this.ruleId = ruleId;
                return this;
            }

            /**
            * Whether to send notifications about the calendar sharing change. Note that there are no
            * notifications on access removal. Optional. The default is True.
            */
            private Nullable!bool sendNotifications;

            /** Whether to send notifications about the calendar sharing change. Note that there are no
            notifications on access removal. Optional. The default is True.
            */
            public bool getSendNotifications() {
                return sendNotifications.get;
            }

            /**
            * Whether to send notifications about the calendar sharing change. Note that there are no
            * notifications on access removal. Optional. The default is True.
            */
            public Patch setSendNotifications(bool sendNotifications) {
                this.sendNotifications = sendNotifications;
                return cast(Patch) super.set!(bool)("sendNotifications", sendNotifications);
            }

            override public Patch set(T = string)(string parameterName, T value) {
                return cast(Patch) super.set!(T)(parameterName, value);
            }

            public gcalendar.models.aclrule.AclRule execute() {
                return super.exec!"PATCH"();
            }
        }

        public Update!(Request, Response) update(string calendarId, string ruleId,
            gcalendar.models.aclrule.AclRule content) {
            Update!(Request, Response) result = new Update!(Request, Response)(calendarId, ruleId, content);
            initialize!(Request, Response, Update)(result);
            return result;
        }

        public class Update(RequestT = Request, ResponseT = Response) :
            APIRequest!(gcalendar.models.aclrule.AclRule, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/acl/%s";

            protected this(string calendarId, string ruleId, gcalendar.models.aclrule.AclRule content) {
                calendarId = enforce(calendarId, RequiredMessage!"calendarId");
                ruleId = enforce(ruleId, RequiredMessage!"ruleId");
                enforce(!content.isNull, RequiredMessage!"content");
                enforce(!content.getScope().isNull, RequiredMessage!"AclRule.getScope()");
                enforce(content.getScope().getType(), RequiredMessage!"AclRule.getScope().getType()");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId, ruleId), content);
                this.calendarId = calendarId;
                this.ruleId = ruleId;
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

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Update setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /** ACL rule identifier. */
            private string ruleId;

            /** ACL rule identifier.
            */
            public string getRuleId() {
                return ruleId;
            }

            /** ACL rule identifier. */
            public Update setRuleId(string ruleId) {
                this.ruleId = ruleId;
                return this;
            }

            /**
            * Whether to send notifications about the calendar sharing change. Note that there are no
            * notifications on access removal. Optional. The default is True.
            */
            private Nullable!bool sendNotifications;

            /** Whether to send notifications about the calendar sharing change. Note that there are no
            notifications on access removal. Optional. The default is True.
            */
            public bool getSendNotifications() {
                return sendNotifications.get;
            }

            /**
            * Whether to send notifications about the calendar sharing change. Note that there are no
            * notifications on access removal. Optional. The default is True.
            */
            public Update setSendNotifications(bool sendNotifications) {
                this.sendNotifications = sendNotifications.nullable;
                return cast(Update) super.set!bool("sendNotifications", sendNotifications);
            }

            override public Update set(T = string)(string parameterName, T value) {
                return cast(Update) super.set(T)(parameterName, value);
            }

            public gcalendar.models.aclrule.AclRule execute() {
                return super.exec!"PUT"();
            }
        }

        public Watch!(Request, Response) watch(string calendarId,
            gcalendar.models.channel.Channel content) {
            Watch!(Request, Response) result = new Watch!(Request, Response)(calendarId, content);
            initialize!(Request, Response, Watch)(result);
            return result;
        }

        public class Watch(RequestT = Request, ResponseT = Response) :
            APIRequest!(gcalendar.models.channel.Channel, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/acl/watch";

            protected this(string calendarId, gcalendar.models.channel.Channel content) {
                calendarId = enforce(calendarId, RequiredMessage!"calendarId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId), content);
                this.calendarId = calendarId;
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
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Watch setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /**
            * Maximum number of entries returned on one result page. By default the value is 100 entries.
            * The page size can never be larger than 250 entries. Optional.
            */
            private int maxResults;

            /** Maximum number of entries returned on one result page. By default the value is 100 entries. The
            page size can never be larger than 250 entries. Optional.
            [minimum: 1]
            */
            public int getMaxResults() {
                return maxResults;
            }

            /**
            * Maximum number of entries returned on one result page. By default the value is 100 entries.
            * The page size can never be larger than 250 entries. Optional.
            */
            public Watch setMaxResults(int maxResults) {
                this.maxResults = maxResults;
                return this;
            }

            /** Token specifying which result page to return. Optional. */
            private string pageToken;

            /** Token specifying which result page to return. Optional.
            */
            public string getPageToken() {
                return pageToken;
            }

            /** Token specifying which result page to return. Optional. */
            public Watch setPageToken(string pageToken) {
                this.pageToken = pageToken;
                return cast(Watch) super.set("pageToken", pageToken);
            }

            /**
            * Whether to include deleted ACLs in the result. Deleted ACLs are represented by role equal
            * to "none". Deleted ACLs will always be included if syncToken is provided. Optional. The
            * default is False.
            */
            private Nullable!bool showDeleted;

            /** Whether to include deleted ACLs in the result. Deleted ACLs are represented by role equal to
            "none". Deleted ACLs will always be included if syncToken is provided. Optional. The default is
            False.
            */
            public bool getShowDeleted() {
                return showDeleted.get;
            }

            /**
            * Whether to include deleted ACLs in the result. Deleted ACLs are represented by role equal
            * to "none". Deleted ACLs will always be included if syncToken is provided. Optional. The
            * default is False.
            */
            public Watch setShowDeleted(bool showDeleted) {
                this.showDeleted = showDeleted.nullable;
                return cast(Watch) super.set!bool("showDeleted", showDeleted);
            }

            /**
            * Token obtained from the nextSyncToken field returned on the last page of results from the
            * previous list request. It makes the result of this list request contain only entries that
            * have changed since then. All entries deleted since the previous list request will always be
            * in the result set and it is not allowed to set showDeleted to False. If the syncToken
            * expires, the server will respond with a 410 GONE response code and the client should clear
            * its storage and perform a full synchronization without any syncToken. Learn more about
            * incremental synchronization. Optional. The default is to return all entries.
            */
            private string syncToken;

            /** Token obtained from the nextSyncToken field returned on the last page of results from the previous
            list request. It makes the result of this list request contain only entries that have changed since
            then. All entries deleted since the previous list request will always be in the result set and it
            is not allowed to set showDeleted to False. If the syncToken expires, the server will respond with
            a 410 GONE response code and the client should clear its storage and perform a full synchronization
            without any syncToken. Learn more about incremental synchronization. Optional. The default is to
            return all entries.
            */
            public string getSyncToken() {
                return syncToken;
            }

            /**
            * Token obtained from the nextSyncToken field returned on the last page of results from the
            * previous list request. It makes the result of this list request contain only entries that
            * have changed since then. All entries deleted since the previous list request will always be
            * in the result set and it is not allowed to set showDeleted to False. If the syncToken
            * expires, the server will respond with a 410 GONE response code and the client should clear
            * its storage and perform a full synchronization without any syncToken. Learn more about
            * incremental synchronization. Optional. The default is to return all entries.
            */
            public Watch setSyncToken(string syncToken) {
                this.syncToken = syncToken;
                return cast(Watch) super.set("syncToken", syncToken);
            }

            override public Watch set(T)(string parameterName, T value) {
                return cast(Watch) super.set!T(parameterName, value);
            }

            public gcalendar.models.channel.Channel execute() {
                return super.exec!"POST"();
            }
        }
    }

    public CalendarList calendarList() {
        return new CalendarList();
    }

    public class CalendarList {
        public Delete!(Request, Response) delete_(string calendarId) {
            Delete!(Request, Response) result = new Delete!(Request, Response)(calendarId);
            initialize!(Request, Response, Delete)(result);
            return result;
        }

        public class Delete(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.calendarlist.CalendarList, RequestT, ResponseT) {
            private static const string REST_PATH = "users/me/calendarList/%s";

            protected this(string calendarId) {
                calendarId = enforce(calendarId, RequiredMessage!"calendarId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId));
                this.calendarId = calendarId;
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

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Delete setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            override public Delete set(T = string)(string parameterName, T value) {
                return cast(Delete) super.set!T(parameterName, value);
            }

            public void execute() {
                super.exec!"DELETE"();
            }
        }

        public Get!(Request, Response) get(string calendarId) {
            Get!(Request, Response) result = new Get!(Request, Response)(calendarId);
            initialize!(Request, Response, Get)(result);
            return result;
        }

        public class Get(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.calendarlistentry.CalendarListEntry, RequestT, ResponseT) {
            private static const string REST_PATH = "users/me/calendarList/%s";

            protected this(string calendarId) {
                calendarId = enforce(calendarId, RequiredMessage!"calendarId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId));
                this.calendarId = calendarId;
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

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Get setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            override public Get set(T = string)(string parameterName, T value) {
                return cast(Get) super.set!T(parameterName, value);
            }

            public gcalendar.models.calendarlistentry.CalendarListEntry execute() {
                return super.exec!"GET"();
            }
        }

        public Insert!(Request, Response) insert(gcalendar.models.calendarlistentry.CalendarListEntry content) {
            Insert!(Request, Response) result = new Insert!(Request, Response)(content);
            initialize!(Request, Response, Insert)(result);
            return result;
        }

        public class Insert(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.calendarlistentry.CalendarListEntry, RequestT, ResponseT) {
            private static const string REST_PATH = "users/me/calendarList";

            protected this(gcalendar.models.calendarlistentry.CalendarListEntry content) {
                enforce(!content.isNull, RequiredMessage!"content");
                enforce(content.getId(), RequiredMessage!"CalendarListEntry.getId()");

                super(DEFAULT_BASE_URL, content);
            }

            override {
                public Insert setAlt(string alt) {
                    return cast(Insert) super.setAlt(alt);
                }

                public Insert setFields(string fields) {
                    return cast(Insert) super.setFields(fields);
                }

                public Insert setKey(string key) {
                    return cast(Insert) super.setKey(key);
                }

                public Insert setOauthToken(string oauthToken) {
                    return cast(Insert) super.setOauthToken(oauthToken);
                }

                public Insert setPrettyPrint(bool prettyPrint) {
                    return cast(Insert) super.setPrettyPrint(prettyPrint);
                }

                public Insert setQuotaUser(string quotaUser) {
                    return cast(Insert) super.setQuotaUser(quotaUser);
                }

                public Insert setUserIp(string userIp) {
                    return cast(Insert) super.setUserIp(userIp);
                }
            }

            /**
            * Whether to use the foregroundColor and backgroundColor fields to write the calendar colors
            * (RGB). If this feature is used, the index-based colorId field will be set to the best
            * matching option automatically. Optional. The default is False.
            */
            private Nullable!bool colorRgbFormat;

            /** Whether to use the foregroundColor and backgroundColor fields to write the calendar colors (RGB).
            If this feature is used, the index-based colorId field will be set to the best matching option
            automatically. Optional. The default is False.
            */
            public bool getColorRgbFormat() {
                return colorRgbFormat.get;
            }

            /**
            * Whether to use the foregroundColor and backgroundColor fields to write the calendar colors
            * (RGB). If this feature is used, the index-based colorId field will be set to the best
            * matching option automatically. Optional. The default is False.
            */
            public Insert setColorRgbFormat(bool colorRgbFormat) {
                this.colorRgbFormat = colorRgbFormat.nullable;
                return cast(Insert) super.set!bool("colorRgbFormat", colorRgbFormat);
            }

            override public Insert set(T = string)(string parameterName, T value) {
                return cast(Insert) super.set!T(parameterName, value);
            }

            public gcalendar.models.calendarlistentry.CalendarListEntry execute() {
                return super.exec!"POST"();
            }
        }

        public List!(Request, Response) list() {
            List!(Request, Response) result = new List!(Request, Response)();
            initialize!(Request, Response, List)(result);
            return result;
        }

        public class List(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.calendarlist.CalendarList, RequestT, ResponseT) {
            private static const string REST_PATH = "users/me/calendarList";

            protected this() {
                super(DEFAULT_BASE_URL, content);
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
            * Maximum number of entries returned on one result page. By default the value is 100 entries.
            * The page size can never be larger than 250 entries. Optional.
            */
            
            private int maxResults;

            /** Maximum number of entries returned on one result page. By default the value is 100 entries. The
            page size can never be larger than 250 entries. Optional.
            [minimum: 1]
            */
            public int getMaxResults() {
                return maxResults;
            }

            /**
            * Maximum number of entries returned on one result page. By default the value is 100 entries.
            * The page size can never be larger than 250 entries. Optional.
            */
            public List setMaxResults(int maxResults) {
                this.maxResults = maxResults;
                return cast(List) super.set!int("maxResults", maxResults);
            }

            /**
            * The minimum access role for the user in the returned entries. Optional. The default is no
            * restriction.
            */
            private string minAccessRole;

            /** The minimum access role for the user in the returned entries. Optional. The default is no
            restriction.
            */
            public string getMinAccessRole() {
                return minAccessRole;
            }

            /**
            * The minimum access role for the user in the returned entries. Optional. The default is no
            * restriction.
            */
            public List setMinAccessRole(string minAccessRole) {
                this.minAccessRole = minAccessRole;
                return cast(List) super.set("minAccessRole", minAccessRole);
            }

            /** Token specifying which result page to return. Optional. */
            private string pageToken;

            /** Token specifying which result page to return. Optional.
            */
            public string getPageToken() {
                return pageToken;
            }

            /** Token specifying which result page to return. Optional. */
            public List setPageToken(string pageToken) {
                this.pageToken = pageToken;
                return cast(List) super.set("pageToken", pageToken);
            }

            /**
            * Whether to include deleted calendar list entries in the result. Optional. The default is
            * False.
            */
            private Nullable!bool showDeleted;

            /** Whether to include deleted calendar list entries in the result. Optional. The default is False.
            */
            public bool getShowDeleted() {
                return showDeleted.get;
            }

            /**
            * Whether to include deleted calendar list entries in the result. Optional. The default is
            * False.
            */
            public List setShowDeleted(bool showDeleted) {
                this.showDeleted = showDeleted.nullable;
                return cast(List) super.set!bool("showDeleted", showDeleted);
            }

            /** Whether to show hidden entries. Optional. The default is False. */
            private Nullable!bool showHidden;

            /** Whether to show hidden entries. Optional. The default is False.
            */
            public bool getShowHidden() {
                return showHidden.get;
            }

            /** Whether to show hidden entries. Optional. The default is False. */
            public List setShowHidden(bool showHidden) {
                this.showHidden = showHidden.nullable;
                return cast(List) super.set!bool("showHidden", showHidden);
            }

            /**
            * Token obtained from the nextSyncToken field returned on the last page of results from the
            * previous list request. It makes the result of this list request contain only entries that
            * have changed since then. If only read-only fields such as calendar properties or ACLs have
            * changed, the entry won't be returned. All entries deleted and hidden since the previous
            * list request will always be in the result set and it is not allowed to set showDeleted
            * neither showHidden to False. To ensure client state consistency minAccessRole query
            * parameter cannot be specified together with nextSyncToken. If the syncToken expires, the
            * server will respond with a 410 GONE response code and the client should clear its storage
            * and perform a full synchronization without any syncToken. Learn more about incremental
            * synchronization. Optional. The default is to return all entries.
            */
            private string syncToken;

            /** Token obtained from the nextSyncToken field returned on the last page of results from the previous
            list request. It makes the result of this list request contain only entries that have changed since
            then. If only read-only fields such as calendar properties or ACLs have changed, the entry won't be
            returned. All entries deleted and hidden since the previous list request will always be in the
            result set and it is not allowed to set showDeleted neither showHidden to False. To ensure client
            state consistency minAccessRole query parameter cannot be specified together with nextSyncToken. If
            the syncToken expires, the server will respond with a 410 GONE response code and the client should
            clear its storage and perform a full synchronization without any syncToken. Learn more about
            incremental synchronization. Optional. The default is to return all entries.
            */
            public string getSyncToken() {
                return syncToken;
            }

            /**
            * Token obtained from the nextSyncToken field returned on the last page of results from the
            * previous list request. It makes the result of this list request contain only entries that
            * have changed since then. If only read-only fields such as calendar properties or ACLs have
            * changed, the entry won't be returned. All entries deleted and hidden since the previous
            * list request will always be in the result set and it is not allowed to set showDeleted
            * neither showHidden to False. To ensure client state consistency minAccessRole query
            * parameter cannot be specified together with nextSyncToken. If the syncToken expires, the
            * server will respond with a 410 GONE response code and the client should clear its storage
            * and perform a full synchronization without any syncToken. Learn more about incremental
            * synchronization. Optional. The default is to return all entries.
            */
            public List setSyncToken(string syncToken) {
                this.syncToken = syncToken;
                return cast(List) super.set("syncToken", syncToken);
            }

            override public List set(T = string)(string parameterName, T value) {
                return cast(List) super.set!T(parameterName, value);
            }

            public gcalendar.models.calendarlist.CalendarList execute() {
                return super.exec!"GET"();
            }
        }

        public Patch!(Request, Response) patch(string calendarId,
            gcalendar.models.calendarlistentry.CalendarListEntry content) {
            Patch!(Request, Response) result = new Patch!(Request, Response)(calendarId, content);
            initialize!(Request, Response, Patch)(result);
            return result;
        }

        public class Patch(RequestT = Request, ResponseT = Response) :
            APIRequest!(gcalendar.models.calendarlistentry.CalendarListEntry, RequestT, ResponseT) {
            private static const string REST_PATH = "users/me/calendarList/%s";

            protected this(string calendarId,
                gcalendar.models.calendarlistentry.CalendarListEntry content) {
                calendarId = enforce(calendarId, RequiredMessage!"calendarId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId), content);
            }

            override {
                public Patch setAlt(string alt) {
                    return cast(Patch) super.setAlt(alt);
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

                public Patch setUserIp(string userIp) {
                    return cast(Patch) super.setUserIp(userIp);
                }
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Patch setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /**
            * Whether to use the foregroundColor and backgroundColor fields to write the calendar colors
            * (RGB). If this feature is used, the index-based colorId field will be set to the best
            * matching option automatically. Optional. The default is False.
            */
            private Nullable!bool colorRgbFormat;

            /** Whether to use the foregroundColor and backgroundColor fields to write the calendar colors (RGB).
            If this feature is used, the index-based colorId field will be set to the best matching option
            automatically. Optional. The default is False.
            */
            public bool getColorRgbFormat() {
                return colorRgbFormat.get;
            }

            /**
            * Whether to use the foregroundColor and backgroundColor fields to write the calendar colors
            * (RGB). If this feature is used, the index-based colorId field will be set to the best
            * matching option automatically. Optional. The default is False.
            */
            public Patch setColorRgbFormat(bool colorRgbFormat) {
                this.colorRgbFormat = colorRgbFormat.nullable;
                return cast(Patch) super.set!bool("colorRgbFormat", colorRgbFormat);
            }

            override public Patch set(T = string)(string parameterName, T value) {
                return cast(Patch) super.set!T(parameterName, value);
            }

            public gcalendar.models.calendarlistentry.CalendarListEntry execute() {
                return super.exec!"PATCH"();
            }
        }

        public Update!(Request, Response) update(string calendarId,
            gcalendar.models.calendarlistentry.CalendarListEntry content) {
            Update!(Request, Response) result = new Update!(Request, Response)(calendarId, content);
            initialize!(Request, Response, Update)(result);
            return result;
        }

        public class Update(RequestT = Request, ResponseT = Response) :
            APIRequest!(gcalendar.models.calendarlistentry.CalendarListEntry, RequestT, ResponseT) {
            private static const string REST_PATH = "users/me/calendarList/%s";

            protected this(string calendarId,
                gcalendar.models.calendarlistentry.CalendarListEntry content) {
                calendarId = enforce(calendarId, RequiredMessage!"calendarId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId), content);
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

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Update setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /**
            * Whether to use the foregroundColor and backgroundColor fields to write the calendar colors
            * (RGB). If this feature is used, the index-based colorId field will be set to the best
            * matching option automatically. Optional. The default is False.
            */
            private Nullable!bool colorRgbFormat;

            /** Whether to use the foregroundColor and backgroundColor fields to write the calendar colors (RGB).
            If this feature is used, the index-based colorId field will be set to the best matching option
            automatically. Optional. The default is False.
            */
            public bool getColorRgbFormat() {
                return colorRgbFormat.get;
            }

            /**
            * Whether to use the foregroundColor and backgroundColor fields to write the calendar colors
            * (RGB). If this feature is used, the index-based colorId field will be set to the best
            * matching option automatically. Optional. The default is False.
            */
            public Update setColorRgbFormat(bool colorRgbFormat) {
                this.colorRgbFormat = colorRgbFormat.nullable;
                return cast(Update) super.set!bool("colorRgbFormat", colorRgbFormat);
            }

            override public Update set(T)(string parameterName, T value) {
                return cast(Update) super.set!T(parameterName, value);
            }

            public gcalendar.models.calendarlistentry.CalendarListEntry execute() {
                return super.exec!"PUT"();
            }
        }

        public Watch!(Request, Response) watch(gcalendar.models.channel.Channel content) {
            Watch!(Request, Response) result = new Watch!(Request, Response)(content);
            initialize!(Request, Response, Watch)(result);
            return result;
        }

        public class Watch(RequestT = Request, ResponseT = Response) :
            APIRequest!(gcalendar.models.channel.Channel, RequestT, ResponseT) {
            private static const string REST_PATH = "users/me/calendarList/watch";

            protected this(gcalendar.models.channel.Channel content) {
                super(DEFAULT_BASE_URL ~ REST_PATH, content);
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
            * Maximum number of entries returned on one result page. By default the value is 100 entries.
            * The page size can never be larger than 250 entries. Optional.
            */
            private int maxResults;

            /** Maximum number of entries returned on one result page. By default the value is 100 entries. The
            page size can never be larger than 250 entries. Optional.
            [minimum: 1]
            */
            public int getMaxResults() {
                return maxResults;
            }

            /**
            * Maximum number of entries returned on one result page. By default the value is 100 entries.
            * The page size can never be larger than 250 entries. Optional.
            */
            public Watch setMaxResults(int maxResults) {
                this.maxResults = maxResults;
                return cast(Watch) super.set!int("maxResults", maxResults);
            }

            /**
            * The minimum access role for the user in the returned entries. Optional. The default is no
            * restriction.
            */
            private string minAccessRole;

            /** The minimum access role for the user in the returned entries. Optional. The default is no
            restriction.
            */
            public string getMinAccessRole() {
                return minAccessRole;
            }

            /**
            * The minimum access role for the user in the returned entries. Optional. The default is no
            * restriction.
            */
            public Watch setMinAccessRole(string minAccessRole) {
                this.minAccessRole = minAccessRole;
                return cast(Watch) super.set("minAccessRole", minAccessRole);
            }

            /** Token specifying which result page to return. Optional. */
            private string pageToken;

            /** Token specifying which result page to return. Optional.
            */
            public string getPageToken() {
                return pageToken;
            }

            /** Token specifying which result page to return. Optional. */
            public Watch setPageToken(string pageToken) {
                this.pageToken = pageToken;
                return cast(Watch) super.set("pageToken", pageToken);
            }

            /**
            * Whether to include deleted calendar list entries in the result. Optional. The default is
            * False.
            */
            private Nullable!bool showDeleted;

            /** Whether to include deleted calendar list entries in the result. Optional. The default is False.
            */
            public bool getShowDeleted() {
                return showDeleted.get;
            }

            /**
            * Whether to include deleted calendar list entries in the result. Optional. The default is
            * False.
            */
            public Watch setShowDeleted(bool showDeleted) {
                this.showDeleted = showDeleted.nullable;
                return cast(Watch) super.set!bool("showDeleted", showDeleted);
            }

            /** Whether to show hidden entries. Optional. The default is False. */
            private Nullable!bool showHidden;

            /** Whether to show hidden entries. Optional. The default is False.
            */
            public bool getShowHidden() {
                return showHidden.get;
            }

            /** Whether to show hidden entries. Optional. The default is False. */
            public Watch setShowHidden(bool showHidden) {
                this.showHidden = showHidden.nullable;
                return cast(Watch) super.set!bool("showHidden", showHidden);
            }

            /**
            * Token obtained from the nextSyncToken field returned on the last page of results from the
            * previous list request. It makes the result of this list request contain only entries that
            * have changed since then. If only read-only fields such as calendar properties or ACLs have
            * changed, the entry won't be returned. All entries deleted and hidden since the previous
            * list request will always be in the result set and it is not allowed to set showDeleted
            * neither showHidden to False. To ensure client state consistency minAccessRole query
            * parameter cannot be specified together with nextSyncToken. If the syncToken expires, the
            * server will respond with a 410 GONE response code and the client should clear its storage
            * and perform a full synchronization without any syncToken. Learn more about incremental
            * synchronization. Optional. The default is to return all entries.
            */
            private string syncToken;

            /** Token obtained from the nextSyncToken field returned on the last page of results from the previous
            list request. It makes the result of this list request contain only entries that have changed since
            then. If only read-only fields such as calendar properties or ACLs have changed, the entry won't be
            returned. All entries deleted and hidden since the previous list request will always be in the
            result set and it is not allowed to set showDeleted neither showHidden to False. To ensure client
            state consistency minAccessRole query parameter cannot be specified together with nextSyncToken. If
            the syncToken expires, the server will respond with a 410 GONE response code and the client should
            clear its storage and perform a full synchronization without any syncToken. Learn more about
            incremental synchronization. Optional. The default is to return all entries.
            */
            public string getSyncToken() {
                return syncToken;
            }

            /**
            * Token obtained from the nextSyncToken field returned on the last page of results from the
            * previous list request. It makes the result of this list request contain only entries that
            * have changed since then. If only read-only fields such as calendar properties or ACLs have
            * changed, the entry won't be returned. All entries deleted and hidden since the previous
            * list request will always be in the result set and it is not allowed to set showDeleted
            * neither showHidden to False. To ensure client state consistency minAccessRole query
            * parameter cannot be specified together with nextSyncToken. If the syncToken expires, the
            * server will respond with a 410 GONE response code and the client should clear its storage
            * and perform a full synchronization without any syncToken. Learn more about incremental
            * synchronization. Optional. The default is to return all entries.
            */
            public Watch setSyncToken(string syncToken) {
                this.syncToken = syncToken;
                return cast(Watch) super.set("syncToken", syncToken);
            }

            override public Watch set(T)(string parameterName, T value) {
                return cast(Watch) super.set!T(parameterName, value);
            }

            public gcalendar.models.channel.Channel execute() {
                return super.exec!"POST"();
            }
        }
    }

    public Calendars calendars() {
        return new Calendars();
    }

    public class Calendars {
        public Clear!(Request, Response) clear(string calendarId) {
            Clear!(Request, Response) result = new Clear!(Request, Response)(calendarId);
            initialize!(Request, Response, Clear)(result);
            return result;
        }

        public class Clear(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.calendar.Calendar, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/clear";

            protected this(string calendarId) {
                enforce(calendarId, RequiredMessage!"calendarId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId));
                this.calendarId = calendarId;
            }

            override {
                public Clear setAlt(string alt) {
                    return cast(Clear) super.setAlt(alt);
                }

                public Clear setFields(string fields) {
                    return cast(Clear) super.setFields(fields);
                }

                public Clear setKey(string key) {
                    return cast(Clear) super.setKey(key);
                }

                public Clear setOauthToken(string oauthToken) {
                    return cast(Clear) super.setOauthToken(oauthToken);
                }

                public Clear setPrettyPrint(bool prettyPrint) {
                    return cast(Clear) super.setPrettyPrint(prettyPrint);
                }

                public Clear setQuotaUser(string quotaUser) {
                    return cast(Clear) super.setQuotaUser(quotaUser);
                }

                public Clear setUserIp(string userIp) {
                    return cast(Clear) super.setUserIp(userIp);
                }
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Clear setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            override public Clear set(T)(string parameterName, T value) {
                return cast(Clear) super.set!T(parameterName, value);
            }

            public void execute() {
                super.exec!"POST"();
            }
        }

        public Delete!(Request, Response) delete_(string calendarId) {
            Delete!(Request, Response) result = new Delete!(Request, Response)(calendarId);
            initialize!(Request, Response, Delete)(result);
            return result;
        }

        public class Delete(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.calendar.Calendar, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s";

            protected this(string calendarId) {
                enforce(calendarId, RequiredMessage!"calendarId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId));
                this.calendarId = calendarId;
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

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Delete setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            override public Delete set(T)(string parameterName, T value) {
                return cast(Delete) super.set!T(parameterName, value);
            }

            public void execute() {
                super.exec!"DELETE"();
            }
        }

        public Get!(Request, Response) get(string calendarId) {
            Get!(Request, Response) result = new Get!(Request, Response)(calendarId);
            initialize!(Request, Response, Get)(result);
            return result;
        }

        public class Get(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.calendar.Calendar, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s";

            protected this(string calendarId) {
                enforce(calendarId, RequiredMessage!"calendarId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId));
                this.calendarId = calendarId;
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

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Get setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            override public Get set(T)(string parameterName, T value) {
                return cast(Get) super.set!T(parameterName, value);
            }

            public gcalendar.models.calendar.Calendar execute() {
                return super.exec!"GET"();
            }
        }

        public Insert!(Request, Response) insert(gcalendar.models.calendar.Calendar content) {
            Insert!(Request, Response) result = new Insert!(Request, Response)(content);
            initialize!(Request, Response, Insert)(result);
            return result;
        }

        public class Insert(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.calendar.Calendar, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars";

            protected this(gcalendar.models.calendar.Calendar content) {
                enforce(!content.isNull, RequiredMessage!"content");
                enforce(content.getSummary(), RequiredMessage!"Calendar.getSummary()");

                super(DEFAULT_BASE_URL ~ REST_PATH, content);
            }

            override {
                public Insert setAlt(string alt) {
                    return cast(Insert) super.setAlt(alt);
                }

                public Insert setFields(string fields) {
                    return cast(Insert) super.setFields(fields);
                }

                public Insert setKey(string key) {
                    return cast(Insert) super.setKey(key);
                }

                public Insert setOauthToken(string oauthToken) {
                    return cast(Insert) super.setOauthToken(oauthToken);
                }

                public Insert setPrettyPrint(bool prettyPrint) {
                    return cast(Insert) super.setPrettyPrint(prettyPrint);
                }

                public Insert setQuotaUser(string quotaUser) {
                    return cast(Insert) super.setQuotaUser(quotaUser);
                }

                public Insert setUserIp(string userIp) {
                    return cast(Insert) super.setUserIp(userIp);
                }

                public Insert set(T)(string parameterName, T value) {
                    return cast(Insert) super.set!T(parameterName, value);
                }
            }

            public gcalendar.models.calendar.Calendar execute() {
                return super.exec!"POST"();
            }
        }

        public Patch!(Request, Response) patch(string calendarId,
            gcalendar.models.calendar.Calendar content) {
            Patch!(Request, Response) result = new Patch!(Request, Response)(calendarId, content);
            initialize!(Request, Response, Patch)(result);
            return result;
        }

        public class Patch(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.calendar.Calendar, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s";

            protected this(string calendarId, gcalendar.models.calendar.Calendar content) {
                enforce(calendarId, RequiredMessage!"calendarId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId), content);
            }

            override {
                public Patch setAlt(string alt) {
                    return cast(Patch) super.setAlt(alt);
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

                public Patch setUserIp(string userIp) {
                    return cast(Patch) super.setUserIp(userIp);
                }
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Patch setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            override public Patch set(T)(string parameterName, T value) {
                return cast(Patch) super.set!T(parameterName, value);
            }

            public gcalendar.models.calendar.Calendar execute() {
                return super.exec!"PATCH"();
            }
        }

        public Update!(Request, Response) update(string calendarId,
            gcalendar.models.calendar.Calendar content) {
            Update!(Request, Response) result = new Update!(Request, Response)(calendarId, content);
            initialize!(Request, Response, Update)(result);
            return result;
        }

        public class Update(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.calendar.Calendar, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s";

            protected this(gcalendar.models.calendar.Calendar content) {
                enforce(calendarId, RequiredMessage!"calendarId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId), content);
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

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Update setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            override public Update set(T)(string parameterName, T value) {
                return cast(Update) super.set!T(parameterName, value);
            }

            public gcalendar.models.calendar.Calendar execute() {
                return super.exec!"PUT"();
            }
        }
    }

    public Channels channels() {
        return new Channels();
    }

    public class Channels {
        public Stop!(Request, Response) stop(gcalendar.models.channel.Channel content) {
            Stop!(Request, Response) result = new Stop!(Request, Response)(content);
            initialize!(Request, Response, Stop)(result);
            return result;
        }

        public class Stop(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.channel.Channel, RequestT, ResponseT) {
            private static const string REST_PATH = "channels/stop";

            protected this(gcalendar.models.channel.Channel content) {
                super(DEFAULT_BASE_URL ~ REST_PATH, content);
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

                public Stop set(T)(string parameterName, T value) {
                    return cast(Stop) super.set!T(parameterName, value);
                }
            }

            public void execute() {
                super.exec!"POST"();
            }
        }
    }

    public Colors colors() {
        return new Colors();
    }

    public class Colors {
        public Get!(Request, Response) get() {
            Get!(Request, Response) result = new Get!(Request, Response)();
            initialize!(Request, Response, Get)(result);
            return result;
        }

        public class Get(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.colors.Colors, RequestT, ResponseT) {
            private static const string REST_PATH = "colors";

            protected this() {
                super(DEFAULT_BASE_URL ~ REST_PATH);
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

                public Get set(T)(String parameterName, T value) {
                    return cast(Get) super.set!T(parameterName, value);
                }
            }

            public gcalendar.models.colors.Colors execute() {
                return super.exec!"GET"();
            }
        }
    }

    public Events events() {
        return new Events();
    }

    public class Events {
        public Delete!(Request, Response) delete_(string calendarId, string eventId) {
            Delete!(Request, Response) result = new Delete!(Request, Response)(calendarId, eventId);
            initialize!(Request, Response, Delete)(result);
            return result;
        }

        public class Delete(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.event.Event, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/events/%s";

            protected this(string calendarId, string eventId) {
                enforce(calendarId, RequiredMessage!"calendarId");
                enforce(eventId, RequiredMessage!"eventId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId, eventId));
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

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Delete setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /** Event identifier. */
            private string eventId;

            /** Event identifier.
            */
            public string getEventId() {
                return eventId;
            }

            /** Event identifier. */
            public Delete setEventId(string eventId) {
                this.eventId = eventId;
                return this;
            }

            /**
            * Deprecated. Please use sendUpdates instead.
            *
            * Whether to send notifications about the deletion of the event. Note that some emails might
            * still be sent even if you set the value to false. The default is false.
            */
            private Nullable!bool sendNotifications;

            /** Deprecated. Please use sendUpdates instead.
            Whether to send notifications about the deletion of the event. Note that some emails might still be
            sent even if you set the value to false. The default is false.
            */
            public bool getSendNotifications() {
                return sendNotifications.get;
            }

            /**
            * Deprecated. Please use sendUpdates instead.
            *
            * Whether to send notifications about the deletion of the event. Note that some emails might
            * still be sent even if you set the value to false. The default is false.
            */
            public Delete setSendNotifications(bool sendNotifications) {
                this.sendNotifications = sendNotifications.nullable;
                return cast(Delete) super.set!bool("sendNotifications", sendNotifications);
            }

            /** Guests who should receive notifications about the deletion of the event. */
            private string sendUpdates;

            /** Guests who should receive notifications about the deletion of the event.
            */
            public string getSendUpdates() {
                return sendUpdates;
            }

            /** Guests who should receive notifications about the deletion of the event. */
            public Delete setSendUpdates(string sendUpdates) {
                this.sendUpdates = sendUpdates;
                return cast(Delete) super.set("sendUpdates", sendUpdates);
            }

            override public Delete set(T)(string parameterName, T value) {
                return cast(Delete) super.set!T(parameterName, value);
            }

            public void execute() {
                super.exec!"DELETE"();
            }
        }

        public Get!(Request, Response) get(string calendarId, string eventId) {
            Get!(Request, Response) result = new Get!(Request, Response)(calendarId, eventId);
            initialize!(Request, Response, Get)(result);
            return result;
        }

        public class Get(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.event.Event, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/events/%s";

            protected this(string calendarId, string eventId) {
                enforce(calendarId, RequiredMessage!"calendarId");
                enforce(eventId, RequiredMessage!"eventId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId, eventId));
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

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Get setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /** Event identifier. */
            private string eventId;

            /** Event identifier.
            */
            public string getEventId() {
                return eventId;
            }

            /** Event identifier. */
            public Get setEventId(string eventId) {
                this.eventId = eventId;
                return this;
            }

            /**
            * Deprecated and ignored. A value will always be returned in the email field for the
            * organizer, creator and attendees, even if no real email address is available (i.e. a
            * generated, non-working value will be provided).
            */
            private Nullable!bool alwaysIncludeEmail;

            /** Deprecated and ignored. A value will always be returned in the email field for the organizer,
            creator and attendees, even if no real email address is available (i.e. a generated, non-working
            value will be provided).
            */
            public bool getAlwaysIncludeEmail() {
                return alwaysIncludeEmail.get;
            }

            /**
            * Deprecated and ignored. A value will always be returned in the email field for the
            * organizer, creator and attendees, even if no real email address is available (i.e. a
            * generated, non-working value will be provided).
            */
            public Get setAlwaysIncludeEmail(bool alwaysIncludeEmail) {
                this.alwaysIncludeEmail = alwaysIncludeEmail.nullable;
                return cast(Get) super.set!bool("alwaysIncludeEmail", alwaysIncludeEmail);
            }

            /**
            * The maximum number of attendees to include in the response. If there are more than the
            * specified number of attendees, only the participant is returned. Optional.
            */
            
            private int maxAttendees;

            /** The maximum number of attendees to include in the response. If there are more than the specified
            number of attendees, only the participant is returned. Optional.
            [minimum: 1]
            */
            public int getMaxAttendees() {
                return maxAttendees;
            }

            /**
            * The maximum number of attendees to include in the response. If there are more than the
            * specified number of attendees, only the participant is returned. Optional.
            */
            public Get setMaxAttendees(int maxAttendees) {
                this.maxAttendees = maxAttendees;
                return cast(Get) super.set!int("maxAttendees", maxAttendees);
            }

            /**
            * Time zone used in the response. Optional. The default is the time zone of the calendar.
            */
            private string timeZone;

            /** Time zone used in the response. Optional. The default is the time zone of the calendar.
            */
            public string getTimeZone() {
                return timeZone;
            }

            /**
            * Time zone used in the response. Optional. The default is the time zone of the calendar.
            */
            public Get setTimeZone(string timeZone) {
                this.timeZone = timeZone;
                return cast(Get) super.set("timeZone", timeZone);
            }

            override public Get set(T)(string parameterName, T value) {
                return cast(Get) super.set!T(parameterName, value);
            }

            public gcalendar.models.event.Event execute() {
                return super.exec!"GET"();
            }
        }

        public CalendarImport!(Request, Response) calendarImport(string calendarId,
            gcalendar.models.event.Event content) {
            CalendarImport!(Request, Response) result = new CalendarImport!(Request, Response)();
            initialize!(Request, Response, CalendarImport)(result);
            return result;
        }

        public class CalendarImport(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.event.Event, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/events/import";

            protected this(string calendarId,
                gcalendar.models.event.Event content) {
                enforce(calendarId, RequiredMessage!"calendarId");
                enforce(content.getICalUID(), RequiredMessage!"Event.getICalUID()");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId), content);
            }

            override {
                public CalendarImport setAlt(string alt) {
                    return cast(CalendarImport) super.setAlt(alt);
                }

                public CalendarImport setFields(string fields) {
                    return cast(CalendarImport) super.setFields(fields);
                }

                public CalendarImport setKey(string key) {
                    return cast(CalendarImport) super.setKey(key);
                }

                public CalendarImport setOauthToken(string oauthToken) {
                    return cast(CalendarImport) super.setOauthToken(oauthToken);
                }

                public CalendarImport setPrettyPrint(bool prettyPrint) {
                    return cast(CalendarImport) super.setPrettyPrint(prettyPrint);
                }

                public CalendarImport setQuotaUser(string quotaUser) {
                    return cast(CalendarImport) super.setQuotaUser(quotaUser);
                }

                public CalendarImport setUserIp(string userIp) {
                    return cast(CalendarImport) super.setUserIp(userIp);
                }
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public CalendarImport setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /**
            * Version number of conference data supported by the API client. Version 0 assumes no
            * conference data support and ignores conference data in the event's body. Version 1 enables
            * support for copying of ConferenceData as well as for creating new conferences using the
            * createRequest field of conferenceData. The default is 0.
            */
            private int conferenceDataVersion;

            /** Version number of conference data supported by the API client. Version 0 assumes no conference data
            support and ignores conference data in the event's body. Version 1 enables support for copying of
            ConferenceData as well as for creating new conferences using the createRequest field of
            conferenceData. The default is 0.
            [minimum: 0] [maximum: 1]
            */
            public int getConferenceDataVersion() {
                return conferenceDataVersion;
            }

            /**
            * Version number of conference data supported by the API client. Version 0 assumes no
            * conference data support and ignores conference data in the event's body. Version 1 enables
            * support for copying of ConferenceData as well as for creating new conferences using the
            * createRequest field of conferenceData. The default is 0.
            */
            public CalendarImport setConferenceDataVersion(int conferenceDataVersion) {
                this.conferenceDataVersion = conferenceDataVersion;
                return cast(CalendarImport) super.set!int("conferenceDataVersion", conferenceDataVersion);
            }

            /**
            * Whether API client performing operation supports event attachments. Optional. The default
            * is False.
            */
            private Nullable!bool supportsAttachments;

            /** Whether API client performing operation supports event attachments. Optional. The default is False.
            */
            public bool getSupportsAttachments() {
                return supportsAttachments.get;
            }

            /**
            * Whether API client performing operation supports event attachments. Optional. The default
            * is False.
            */
            public CalendarImport setSupportsAttachments(bool supportsAttachments) {
                this.supportsAttachments = supportsAttachments.nullable;
                return cast(CalendarImport) super.set!bool("supportsAttachments", supportsAttachments);
            }

            override public CalendarImport set(T)(string parameterName, T value) {
                return cast(CalendarImport) super.set!T(parameterName, value);
            }

            public gcalendar.models.event.Event execute() {
                return super.exec!"POST"();
            }
        }

        public Insert!(Request, Response) insert(string calendarId,
            gcalendar.models.event.Event content) {
            Insert!(Request, Response) result = new Insert!(Request, Response)();
            initialize!(Request, Response, Insert)(result);
            return result;
        }

        public class Insert(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.event.Event, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/events";

            /**
            * Creates an event.
            *
            * Create a request for the method "events.insert".
            */
            protected this(string calendarId,
                gcalendar.models.event.Event content) {
                enforce(calendarId, RequiredMessage!"calendarId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId), content);
            }

            override {
                public Insert setAlt(string alt) {
                    return cast(Insert) super.setAlt(alt);
                }

                public Insert setFields(string fields) {
                    return cast(Insert) super.setFields(fields);
                }

                public Insert setKey(string key) {
                    return cast(Insert) super.setKey(key);
                }

                public Insert setOauthToken(string oauthToken) {
                    return cast(Insert) super.setOauthToken(oauthToken);
                }

                public Insert setPrettyPrint(bool prettyPrint) {
                    return cast(Insert) super.setPrettyPrint(prettyPrint);
                }

                public Insert setQuotaUser(string quotaUser) {
                    return cast(Insert) super.setQuotaUser(quotaUser);
                }

                public Insert setUserIp(string userIp) {
                    return cast(Insert) super.setUserIp(userIp);
                }
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Insert setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /**
            * Version number of conference data supported by the API client. Version 0 assumes no
            * conference data support and ignores conference data in the event's body. Version 1 enables
            * support for copying of ConferenceData as well as for creating new conferences using the
            * createRequest field of conferenceData. The default is 0.
            */
            private int conferenceDataVersion;

            /** Version number of conference data supported by the API client. Version 0 assumes no conference data
            support and ignores conference data in the event's body. Version 1 enables support for copying of
            ConferenceData as well as for creating new conferences using the createRequest field of
            conferenceData. The default is 0.
            [minimum: 0] [maximum: 1]
            */
            public int getConferenceDataVersion() {
                return conferenceDataVersion;
            }

            /**
            * Version number of conference data supported by the API client. Version 0 assumes no
            * conference data support and ignores conference data in the event's body. Version 1 enables
            * support for copying of ConferenceData as well as for creating new conferences using the
            * createRequest field of conferenceData. The default is 0.
            */
            public Insert setConferenceDataVersion(int conferenceDataVersion) {
                this.conferenceDataVersion = conferenceDataVersion;
                return cast(Insert) super.set!int("conferenceDataVersion", conferenceDataVersion);
            }

            /**
            * The maximum number of attendees to include in the response. If there are more than the
            * specified number of attendees, only the participant is returned. Optional.
            */
            private int maxAttendees;

            /** The maximum number of attendees to include in the response. If there are more than the specified
            number of attendees, only the participant is returned. Optional.
            [minimum: 1]
            */
            public int getMaxAttendees() {
                return maxAttendees;
            }

            /**
            * The maximum number of attendees to include in the response. If there are more than the
            * specified number of attendees, only the participant is returned. Optional.
            */
            public Insert setMaxAttendees(int maxAttendees) {
                this.maxAttendees = maxAttendees;
                return cast(Insert) super.set!int("maxAttendess", maxAttendees);
            }

            /**
            * Deprecated. Please use sendUpdates instead.
            *
            * Whether to send notifications about the creation of the new event. Note that some emails
            * might still be sent even if you set the value to false. The default is false.
            */
            private Nullable!bool sendNotifications;

            /** Deprecated. Please use sendUpdates instead.
            Whether to send notifications about the creation of the new event. Note that some emails might
            still be sent even if you set the value to false. The default is false.
            */
            public bool getSendNotifications() {
                return sendNotifications.get;
            }

            /**
            * Deprecated. Please use sendUpdates instead.
            *
            * Whether to send notifications about the creation of the new event. Note that some emails
            * might still be sent even if you set the value to false. The default is false.
            */
            public Insert setSendNotifications(bool sendNotifications) {
                this.sendNotifications = sendNotifications.nullable;
                return cast(Insert) super.set!boot("sendNotifications", sendNotifications);
            }

            /**
            * Whether to send notifications about the creation of the new event. Note that some emails
            * might still be sent. The default is false.
            */
            private string sendUpdates;

            /** Whether to send notifications about the creation of the new event. Note that some emails might
            still be sent. The default is false.
            */
            public string getSendUpdates() {
                return sendUpdates;
            }

            /**
            * Whether to send notifications about the creation of the new event. Note that some emails
            * might still be sent. The default is false.
            */
            public Insert setSendUpdates(string sendUpdates) {
                this.sendUpdates = sendUpdates;
                return cast(Insert) super.set("sendUpdates", sendUpdates);
            }

            /**
            * Whether API client performing operation supports event attachments. Optional. The default
            * is False.
            */
            private Nullable!bool supportsAttachments;

            /** Whether API client performing operation supports event attachments. Optional. The default is False.
            */
            public bool getSupportsAttachments() {
                return supportsAttachments.get;
            }

            /**
            * Whether API client performing operation supports event attachments. Optional. The default
            * is False.
            */
            public Insert setSupportsAttachments(bool supportsAttachments) {
                this.supportsAttachments = supportsAttachments.nullable;
                return cast(Insert) super.set!bool("supportsAttachments", supportsAttachments);
            }

            override public Insert set(T)(string parameterName, T value) {
                return cast(Insert) super.set!T(parameterName, value);
            }

            public gcalendar.models.event.Event execute() {
                return super.exec!"POST"();
            }
        }

        public Instances!(Request, Response) instances(string calendarId, string eventId) {
            Instances!(Request, Response) result = new Instances!(Request, Response)(calendarId, eventId);
            initialize!(Request, Response, Instances)(result);
            return result;
        }

        public class Instances(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.events.Events, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/events/%s/instances";

            /**
            * Creates an event.
            *
            * Create a request for the method "events.insert".
            */
            protected this(string calendarId, string eventId) {
                enforce(calendarId, RequiredMessage!"calendarId");
                enforce(eventId, RequiredMessage!"eventId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId, eventId));
            }

            override {
                public Instances setAlt(string alt) {
                    return cast(Instances) super.setAlt(alt);
                }

                public Instances setFields(string fields) {
                    return cast(Instances) super.setFields(fields);
                }

                public Instances setKey(string key) {
                    return cast(Instances) super.setKey(key);
                }

                public Instances setOauthToken(string oauthToken) {
                    return cast(Instances) super.setOauthToken(oauthToken);
                }

                public Instances setPrettyPrint(bool prettyPrint) {
                    return cast(Instances) super.setPrettyPrint(prettyPrint);
                }

                public Instances setQuotaUser(string quotaUser) {
                    return cast(Instances) super.setQuotaUser(quotaUser);
                }

                public Instances setUserIp(string userIp) {
                    return cast(Instances) super.setUserIp(userIp);
                }
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Instances setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /** Recurring event identifier. */
            private string eventId;

            /** Recurring event identifier.
            */
            public string getEventId() {
                return eventId;
            }

            /** Recurring event identifier. */
            public Instances setEventId(string eventId) {
                this.eventId = eventId;
                return this;
            }

            /**
            * Deprecated and ignored. A value will always be returned in the email field for the
            * organizer, creator and attendees, even if no real email address is available (i.e. a
            * generated, non-working value will be provided).
            */
            private Nullable!bool alwaysIncludeEmail;

            /** Deprecated and ignored. A value will always be returned in the email field for the organizer,
            creator and attendees, even if no real email address is available (i.e. a generated, non-working
            value will be provided).
            */
            public bool getAlwaysIncludeEmail() {
                return alwaysIncludeEmail.get;
            }

            /**
            * Deprecated and ignored. A value will always be returned in the email field for the
            * organizer, creator and attendees, even if no real email address is available (i.e. a
            * generated, non-working value will be provided).
            */
            public Instances setAlwaysIncludeEmail(bool alwaysIncludeEmail) {
                this.alwaysIncludeEmail = alwaysIncludeEmail.nullable;
                return cast(Instances) super.set!bool("alwaysIncludeEmail", alwaysIncludeEmail);
            }

            /**
            * The maximum number of attendees to include in the response. If there are more than the
            * specified number of attendees, only the participant is returned. Optional.
            */
            private int maxAttendees;

            /** The maximum number of attendees to include in the response. If there are more than the specified
            number of attendees, only the participant is returned. Optional.
            [minimum: 1]
            */
            public int getMaxAttendees() {
                return maxAttendees;
            }

            /**
            * The maximum number of attendees to include in the response. If there are more than the
            * specified number of attendees, only the participant is returned. Optional.
            */
            public Instances setMaxAttendees(int maxAttendees) {
                this.maxAttendees = maxAttendees;
                return cast(Instances) super.set!int("maxAttendees", maxAttendees);
            }

            /**
            * Maximum number of events returned on one result page. By default the value is 250 events.
            * The page size can never be larger than 2500 events. Optional.
            */

            private int maxResults;

            /** Maximum number of events returned on one result page. By default the value is 250 events. The page
            size can never be larger than 2500 events. Optional.
            [minimum: 1]
            */
            public int getMaxResults() {
                return maxResults;
            }

            /**
            * Maximum number of events returned on one result page. By default the value is 250 events.
            * The page size can never be larger than 2500 events. Optional.
            */
            public Instances setMaxResults(int maxResults) {
                this.maxResults = maxResults;
                return cast(Instances) super.set!int("maxResults", maxResults);
            }

            /** The original start time of the instance in the result. Optional. */
            private string originalStart;

            /** The original start time of the instance in the result. Optional.
            */
            public string getOriginalStart() {
                return originalStart;
            }

            /** The original start time of the instance in the result. Optional. */
            public Instances setOriginalStart(string originalStart) {
                this.originalStart = originalStart;
                return cast(Instances) super.set("originalStart", originalStart);
            }

            /** Token specifying which result page to return. Optional. */
            private string pageToken;

            /** Token specifying which result page to return. Optional.
            */
            public string getPageToken() {
                return pageToken;
            }

            /** Token specifying which result page to return. Optional. */
            public Instances setPageToken(string pageToken) {
                this.pageToken = pageToken;
                return cast(Instances) super.set("pageToken", pageToken);
            }

            /**
            * Whether to include deleted events (with status equals "cancelled") in the result. Cancelled
            * instances of recurring events will still be included if singleEvents is False. Optional.
            * The default is False.
            */
            private Nullable!bool showDeleted;

            /** Whether to include deleted events (with status equals "cancelled") in the result. Cancelled
            instances of recurring events will still be included if singleEvents is False. Optional. The
            default is False.
            */
            public bool getShowDeleted() {
                return showDeleted.get;
            }

            /**
            * Whether to include deleted events (with status equals "cancelled") in the result. Cancelled
            * instances of recurring events will still be included if singleEvents is False. Optional.
            * The default is False.
            */
            public Instances setShowDeleted(bool showDeleted) {
                this.showDeleted = showDeleted.nullable;
                return cast(Instances) super.set!boot("showDeleted", showDeleted);
            }

            /**
            * Upper bound (exclusive) for an event's start time to filter by. Optional. The default is
            * not to filter by start time. Must be an RFC3339 timestamp with mandatory time zone offset.
            */
            
            private SysTime timeMax;

            /** Upper bound (exclusive) for an event's start time to filter by. Optional. The default is not to
            filter by start time. Must be an RFC3339 timestamp with mandatory time zone offset.
            */
            public SysTime getTimeMax() {
                return timeMax;
            }

            /**
            * Upper bound (exclusive) for an event's start time to filter by. Optional. The default is
            * not to filter by start time. Must be an RFC3339 timestamp with mandatory time zone offset.
            */
            public Instances setTimeMax(SysTime timeMax) {
                this.timeMax = timeMax;
                return cast(Instances) super.set!("timeMax", timeMax.toString);
            }

            /**
            * Lower bound (inclusive) for an event's end time to filter by. Optional. The default is not
            * to filter by end time. Must be an RFC3339 timestamp with mandatory time zone offset.
            */
            
            private SysTime timeMin;

            /** Lower bound (inclusive) for an event's end time to filter by. Optional. The default is not to
            filter by end time. Must be an RFC3339 timestamp with mandatory time zone offset.
            */
            public SysTime getTimeMin() {
                return timeMin;
            }

            /**
            * Lower bound (inclusive) for an event's end time to filter by. Optional. The default is not
            * to filter by end time. Must be an RFC3339 timestamp with mandatory time zone offset.
            */
            public Instances setTimeMin(SysTime timeMin) {
                this.timeMin = timeMin;
                return cast(Instances) super.set("timeMin", timeMin.toString);
            }

            /**
            * Time zone used in the response. Optional. The default is the time zone of the calendar.
            */
            private string timeZone;

            /** Time zone used in the response. Optional. The default is the time zone of the calendar.
            */
            public string getTimeZone() {
                return timeZone;
            }

            /**
            * Time zone used in the response. Optional. The default is the time zone of the calendar.
            */
            public Instances setTimeZone(string timeZone) {
                this.timeZone = timeZone;
                return cast(Instances) super.set("timeZone", timeZone);
            }

            override public Instances set(T)(string parameterName, T value) {
                return cast(Instances) super.set!T(parameterName, value);
            }

            public gcalendar.models.events.Events execute() {
                return super.exec!"GET"();
            }
        }

        public List!(Request, Response) list(string calendarId) {
            List!(Request, Response) result = new List!(Request, Response)(calendarId);
            initialize!(Request, Response, List)(result);
            return result;
        }

        public class List(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.events.Events, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/events";

            /**
            * Creates an event.
            *
            * Create a request for the method "events.insert".
            */
            protected this(string calendarId) {
                enforce(calendarId, RequiredMessage!"calendarId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId));
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
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public List setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /**
            * Deprecated and ignored. A value will always be returned in the email field for the
            * organizer, creator and attendees, even if no real email address is available (i.e. a
            * generated, non-working value will be provided).
            */
            private Nullable!bool alwaysIncludeEmail;

            /** Deprecated and ignored. A value will always be returned in the email field for the organizer,
            creator and attendees, even if no real email address is available (i.e. a generated, non-working
            value will be provided).
            */
            public bool getAlwaysIncludeEmail() {
                return alwaysIncludeEmail.get;
            }

            /**
            * Deprecated and ignored. A value will always be returned in the email field for the
            * organizer, creator and attendees, even if no real email address is available (i.e. a
            * generated, non-working value will be provided).
            */
            public List setAlwaysIncludeEmail(bool alwaysIncludeEmail) {
                this.alwaysIncludeEmail = alwaysIncludeEmail.nullable;
                return cast(List) super.set!bool("alwaysInclueEmail", alwaysIncludeEmail);
            }

            /** Specifies event ID in the iCalendar format to be included in the response. Optional. */
            private string iCalUID;

            /** Specifies event ID in the iCalendar format to be included in the response. Optional.
            */
            public string getICalUID() {
                return iCalUID;
            }

            /** Specifies event ID in the iCalendar format to be included in the response. Optional. */
            public List setICalUID(string iCalUID) {
                this.iCalUID = iCalUID;
                return cast(List) super.set("iCalUID", iCalUID);
            }

            /**
            * The maximum number of attendees to include in the response. If there are more than the
            * specified number of attendees, only the participant is returned. Optional.
            */
            private int maxAttendees;

            /** The maximum number of attendees to include in the response. If there are more than the specified
            number of attendees, only the participant is returned. Optional.
            [minimum: 1]
            */
            public int getMaxAttendees() {
                return maxAttendees;
            }

            /**
            * The maximum number of attendees to include in the response. If there are more than the
            * specified number of attendees, only the participant is returned. Optional.
            */
            public List setMaxAttendees(int maxAttendees) {
                this.maxAttendees = maxAttendees;
                return cast(List) super.set!int("maxAttendees", maxAttendees);
            }

            /**
            * Maximum number of events returned on one result page. The number of events in the resulting
            * page may be less than this value, or none at all, even if there are more events matching
            * the query. Incomplete pages can be detected by a non-empty nextPageToken field in the
            * response. By default the value is 250 events. The page size can never be larger than 2500
            * events. Optional.
            */
            private int maxResults;

            /** Maximum number of events returned on one result page. The number of events in the resulting page
            may be less than this value, or none at all, even if there are more events matching the query.
            Incomplete pages can be detected by a non-empty nextPageToken field in the response. By default the
            value is 250 events. The page size can never be larger than 2500 events. Optional. [default: 250]
            [minimum: 1]
            */
            public int getMaxResults() {
                return maxResults;
            }

            /**
            * Maximum number of events returned on one result page. The number of events in the resulting
            * page may be less than this value, or none at all, even if there are more events matching
            * the query. Incomplete pages can be detected by a non-empty nextPageToken field in the
            * response. By default the value is 250 events. The page size can never be larger than 2500
            * events. Optional.
            */
            public List setMaxResults(int maxResults) {
                this.maxResults = maxResults;
                return cast(List) super.set!int("maxResults", maxResults);
            }

            /**
            * The order of the events returned in the result. Optional. The default is an unspecified,
            * stable order.
            */
            private string orderBy;

            /** The order of the events returned in the result. Optional. The default is an unspecified, stable
            order.
            */
            public string getOrderBy() {
                return orderBy;
            }

            /**
            * The order of the events returned in the result. Optional. The default is an unspecified,
            * stable order.
            */
            public List setOrderBy(string orderBy) {
                this.orderBy = orderBy;
                return cast(List) super.set("orderBy", orderBy);
            }

            /** Token specifying which result page to return. Optional. */
            
            private string pageToken;

            /** Token specifying which result page to return. Optional.
            */
            public string getPageToken() {
                return pageToken;
            }

            /** Token specifying which result page to return. Optional. */
            public List setPageToken(string pageToken) {
                this.pageToken = pageToken;
                return cast(List) super.set("pageToken", pageToken);
            }

            /**
            * Extended properties constraint specified as propertyName=value. Matches only private
            * properties. This parameter might be repeated multiple times to return events that match all
            * given constraints.
            */
            
            private string[] privateExtendedProperty;

            /** Extended properties constraint specified as propertyName=value. Matches only private properties.
            This parameter might be repeated multiple times to return events that match all given constraints.
            */
            public string[] getPrivateExtendedProperty() {
                return privateExtendedProperty;
            }

            /**
            * Extended properties constraint specified as propertyName=value. Matches only private
            * properties. This parameter might be repeated multiple times to return events that match all
            * given constraints.
            */
            public List setPrivateExtendedProperty(string[] privateExtendedProperty) {
                this.privateExtendedProperty = privateExtendedProperty;
                return cast(List) super.set!(string[])("privateExtendedProperty", privateExtendedProperty);
            }

            /**
            * Free text search terms to find events that match these terms in any field, except for
            * extended properties. Optional.
            */
            private string q;

            /** Free text search terms to find events that match these terms in any field, except for extended
            properties. Optional.
            */
            public string getQ() {
                return q;
            }

            /**
            * Free text search terms to find events that match these terms in any field, except for
            * extended properties. Optional.
            */
            public List setQ(string q) {
                this.q = q;
                return cast(List) super.set("q", q);
            }

            /**
            * Extended properties constraint specified as propertyName=value. Matches only shared
            * properties. This parameter might be repeated multiple times to return events that match all
            * given constraints.
            */
            private string[] sharedExtendedProperty;

            /** Extended properties constraint specified as propertyName=value. Matches only shared properties.
            This parameter might be repeated multiple times to return events that match all given constraints.
            */
            public string[] getSharedExtendedProperty() {
                return sharedExtendedProperty;
            }

            /**
            * Extended properties constraint specified as propertyName=value. Matches only shared
            * properties. This parameter might be repeated multiple times to return events that match all
            * given constraints.
            */
            public List setSharedExtendedProperty(string[] sharedExtendedProperty) {
                this.sharedExtendedProperty = sharedExtendedProperty;
                return cast(List) super.set!(string[])("sharedExtendedProperty", sharedExtendedProperty);
            }

            /**
            * Whether to include deleted events (with status equals "cancelled") in the result. Cancelled
            * instances of recurring events (but not the underlying recurring event) will still be
            * included if showDeleted and singleEvents are both False. If showDeleted and singleEvents
            * are both True, only single instances of deleted events (but not the underlying recurring
            * events) are returned. Optional. The default is False.
            */
            private Nullable!bool showDeleted;

            /** Whether to include deleted events (with status equals "cancelled") in the result. Cancelled
            instances of recurring events (but not the underlying recurring event) will still be included if
            showDeleted and singleEvents are both False. If showDeleted and singleEvents are both True, only
            single instances of deleted events (but not the underlying recurring events) are returned.
            Optional. The default is False.
            */
            public bool getShowDeleted() {
                return showDeleted.get;
            }

            /**
            * Whether to include deleted events (with status equals "cancelled") in the result. Cancelled
            * instances of recurring events (but not the underlying recurring event) will still be
            * included if showDeleted and singleEvents are both False. If showDeleted and singleEvents
            * are both True, only single instances of deleted events (but not the underlying recurring
            * events) are returned. Optional. The default is False.
            */
            public List setShowDeleted(bool showDeleted) {
                this.showDeleted = showDeleted.nullable;
                return cast(List) super.set!bool("showDeleted", showDeleted);
            }

            /** Whether to include hidden invitations in the result. Optional. The default is False. */
            private Nullable!bool showHiddenInvitations;

            /** Whether to include hidden invitations in the result. Optional. The default is False.
            */
            public bool getShowHiddenInvitations() {
                return showHiddenInvitations.get;
            }

            /** Whether to include hidden invitations in the result. Optional. The default is False. */
            public List setShowHiddenInvitations(bool showHiddenInvitations) {
                this.showHiddenInvitations = showHiddenInvitations.nullable;
                return cast(List) super.set!bool("showHiddenInvitations", showHiddenInvitations);
            }

            /**
            * Whether to expand recurring events into instances and only return single one-off events and
            * instances of recurring events, but not the underlying recurring events themselves.
            * Optional. The default is False.
            */
            private Nullable!bool singleEvents;

            /** Whether to expand recurring events into instances and only return single one-off events and
            instances of recurring events, but not the underlying recurring events themselves. Optional. The
            default is False.
            */
            public bool getSingleEvents() {
                return singleEvents.get;
            }

            /**
            * Whether to expand recurring events into instances and only return single one-off events and
            * instances of recurring events, but not the underlying recurring events themselves.
            * Optional. The default is False.
            */
            public List setSingleEvents(bool singleEvents) {
                this.singleEvents = singleEvents.nullable;
                return cast(List) super.set!bool("singleEvents", singleEvents);
            }

            /**
            * Token obtained from the nextSyncToken field returned on the last page of results from the
            * previous list request. It makes the result of this list request contain only entries that
            * have changed since then. All events deleted since the previous list request will always be
            * in the result set and it is not allowed to set showDeleted to False. There are several
            * query parameters that cannot be specified together with nextSyncToken to ensure consistency
            * of the client state.
            *
            * These are: - iCalUID - orderBy - privateExtendedProperty - q - sharedExtendedProperty -
            * timeMin - timeMax - updatedMin If the syncToken expires, the server will respond with a 410
            * GONE response code and the client should clear its storage and perform a full
            * synchronization without any syncToken. Learn more about incremental synchronization.
            * Optional. The default is to return all entries.
            */
            private string syncToken;

            /** Token obtained from the nextSyncToken field returned on the last page of results from the previous
            list request. It makes the result of this list request contain only entries that have changed since
            then. All events deleted since the previous list request will always be in the result set and it is
            not allowed to set showDeleted to False. There are several query parameters that cannot be
            specified together with nextSyncToken to ensure consistency of the client state.
            These are: - iCalUID - orderBy - privateExtendedProperty - q - sharedExtendedProperty - timeMin -
            timeMax - updatedMin If the syncToken expires, the server will respond with a 410 GONE response
            code and the client should clear its storage and perform a full synchronization without any
            syncToken. Learn more about incremental synchronization. Optional. The default is to return all
            entries.
            */
            public string getSyncToken() {
                return syncToken;
            }

            /**
            * Token obtained from the nextSyncToken field returned on the last page of results from the
            * previous list request. It makes the result of this list request contain only entries that
            * have changed since then. All events deleted since the previous list request will always be
            * in the result set and it is not allowed to set showDeleted to False. There are several
            * query parameters that cannot be specified together with nextSyncToken to ensure consistency
            * of the client state.
            *
            * These are: - iCalUID - orderBy - privateExtendedProperty - q - sharedExtendedProperty -
            * timeMin - timeMax - updatedMin If the syncToken expires, the server will respond with a 410
            * GONE response code and the client should clear its storage and perform a full
            * synchronization without any syncToken. Learn more about incremental synchronization.
            * Optional. The default is to return all entries.
            */
            public List setSyncToken(string syncToken) {
                this.syncToken = syncToken;
                return cast(List) super.set("syncToken", syncToken);
            }

            /**
            * Upper bound (exclusive) for an event's start time to filter by. Optional. The default is
            * not to filter by start time. Must be an RFC3339 timestamp with mandatory time zone offset,
            * for example, 2011-06-03T10:00:00-07:00, 2011-06-03T10:00:00Z. Milliseconds may be provided
            * but are ignored. If timeMin is set, timeMax must be greater than timeMin.
            */
            
            private SysTime timeMax;

            /** Upper bound (exclusive) for an event's start time to filter by. Optional. The default is not to
            filter by start time. Must be an RFC3339 timestamp with mandatory time zone offset, for example,
            2011-06-03T10:00:00-07:00, 2011-06-03T10:00:00Z. Milliseconds may be provided but are ignored. If
            timeMin is set, timeMax must be greater than timeMin.
            */
            public SysTime getTimeMax() {
                return timeMax;
            }

            /**
            * Upper bound (exclusive) for an event's start time to filter by. Optional. The default is
            * not to filter by start time. Must be an RFC3339 timestamp with mandatory time zone offset,
            * for example, 2011-06-03T10:00:00-07:00, 2011-06-03T10:00:00Z. Milliseconds may be provided
            * but are ignored. If timeMin is set, timeMax must be greater than timeMin.
            */
            public List setTimeMax(SysTime timeMax) {
                this.timeMax = timeMax;
                return cast(List) super.set("timeMax", timeMax.toString);
            }

            /**
            * Lower bound (exclusive) for an event's end time to filter by. Optional. The default is not
            * to filter by end time. Must be an RFC3339 timestamp with mandatory time zone offset, for
            * example, 2011-06-03T10:00:00-07:00, 2011-06-03T10:00:00Z. Milliseconds may be provided but
            * are ignored. If timeMax is set, timeMin must be smaller than timeMax.
            */
            private SysTime timeMin;

            /** Lower bound (exclusive) for an event's end time to filter by. Optional. The default is not to
            filter by end time. Must be an RFC3339 timestamp with mandatory time zone offset, for example,
            2011-06-03T10:00:00-07:00, 2011-06-03T10:00:00Z. Milliseconds may be provided but are ignored. If
            timeMax is set, timeMin must be smaller than timeMax.
            */
            public SysTime getTimeMin() {
                return timeMin;
            }

            /**
            * Lower bound (exclusive) for an event's end time to filter by. Optional. The default is not
            * to filter by end time. Must be an RFC3339 timestamp with mandatory time zone offset, for
            * example, 2011-06-03T10:00:00-07:00, 2011-06-03T10:00:00Z. Milliseconds may be provided but
            * are ignored. If timeMax is set, timeMin must be smaller than timeMax.
            */
            public List setTimeMin(SysTime timeMin) {
                this.timeMin = timeMin;
                return cast(List) super.set("timeMin", timeMin.toString);
            }

            /**
            * Time zone used in the response. Optional. The default is the time zone of the calendar.
            */
            private string timeZone;

            /** Time zone used in the response. Optional. The default is the time zone of the calendar.
            */
            public string getTimeZone() {
                return timeZone;
            }

            /**
            * Time zone used in the response. Optional. The default is the time zone of the calendar.
            */
            public List setTimeZone(string timeZone) {
                this.timeZone = timeZone;
                return cast(List) super.set("timeZone", timeZone);
            }

            /**
            * Lower bound for an event's last modification time (as a RFC3339 timestamp) to filter by.
            * When specified, entries deleted since this time will always be included regardless of
            * showDeleted. Optional. The default is not to filter by last modification time.
            */
            private SysTime updatedMin;

            /** Lower bound for an event's last modification time (as a RFC3339 timestamp) to filter by. When
            specified, entries deleted since this time will always be included regardless of showDeleted.
            Optional. The default is not to filter by last modification time.
            */
            public SysTime getUpdatedMin() {
                return updatedMin;
            }

            /**
            * Lower bound for an event's last modification time (as a RFC3339 timestamp) to filter by.
            * When specified, entries deleted since this time will always be included regardless of
            * showDeleted. Optional. The default is not to filter by last modification time.
            */
            public List setUpdatedMin(SysTime updatedMin) {
                this.updatedMin = updatedMin;
                return cast(List) super.set("updatedMin", updatedMin.toString);
            }

            override public List set(T)(string parameterName, T value) {
                return cast(List) super.set!T(parameterName, value);
            }

            public gcalendar.models.events.Events execute() {
                return super.exec!"GET"();
            }
        }

        public Move!(Request, Response) move(string calendarId,
            string eventId, string destination) {
            Move!(Request, Response) result = new Move!(Request, Response)(calendarId, eventId, destination);
            initialize!(Request, Response, Move)(result);
            return result;
        }

        public class Move(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.event.Event, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/events/%s/move";

            /**
            * Creates an event.
            *
            * Create a request for the method "events.insert".
            */
            protected this(string calendarId, string eventId, string destination) {
                enforce(calendarId, RequiredMessage!"calendarId");
                enforce(eventId, RequiredMessage!"eventId");
                enforce(destination, RequiredMessage!"destination");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId, eventId));
                this.setDestination(destionation);
            }

            override {
                public Move setAlt(string alt) {
                    return cast(Move) super.setAlt(alt);
                }

                public Move setFields(string fields) {
                    return cast(Move) super.setFields(fields);
                }

                public Move setKey(string key) {
                    return cast(Move) super.setKey(key);
                }

                public Move setOauthToken(string oauthToken) {
                    return cast(Move) super.setOauthToken(oauthToken);
                }

                public Move setPrettyPrint(bool prettyPrint) {
                    return cast(Move) super.setPrettyPrint(prettyPrint);
                }

                public Move setQuotaUser(string quotaUser) {
                    return cast(Move) super.setQuotaUser(quotaUser);
                }

                public Move setUserIp(string userIp) {
                    return cast(Move) super.setUserIp(userIp);
                }
            }

            /** Calendar identifier of the source calendar where the event currently is on. */
            private string calendarId;

            /** Calendar identifier of the source calendar where the event currently is on.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /** Calendar identifier of the source calendar where the event currently is on. */
            public Move setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /** Event identifier. */
            private string eventId;

            /** Event identifier.
            */
            public string getEventId() {
                return eventId;
            }

            /** Event identifier. */
            public Move setEventId(string eventId) {
                this.eventId = eventId;
                return this;
            }

            /** Calendar identifier of the target calendar where the event is to be moved to. */
            private string destination;

            /** Calendar identifier of the target calendar where the event is to be moved to.
            */
            public string getDestination() {
                return destination;
            }

            /** Calendar identifier of the target calendar where the event is to be moved to. */
            public Move setDestination(string destination) {
                this.destination = destination;
                return cast(Move) super.set("destination", destination);
            }

            /**
            * Deprecated. Please use sendUpdates instead.
            *
            * Whether to send notifications about the change of the event's organizer. Note that some
            * emails might still be sent even if you set the value to false. The default is false.
            */
            private Nullable!bool sendNotifications;

            /** Deprecated. Please use sendUpdates instead.
            Whether to send notifications about the change of the event's organizer. Note that some emails
            might still be sent even if you set the value to false. The default is false.
            */
            public bool getSendNotifications() {
                return sendNotifications.get;
            }

            /**
            * Deprecated. Please use sendUpdates instead.
            *
            * Whether to send notifications about the change of the event's organizer. Note that some
            * emails might still be sent even if you set the value to false. The default is false.
            */
            public Move setSendNotifications(bool sendNotifications) {
                this.sendNotifications = sendNotifications.nullable;
                return cast(Move) super.set!bool("sendNotifications", sendNotifications);
            }

            /** Guests who should receive notifications about the change of the event's organizer. */
            private string sendUpdates;

            /** Guests who should receive notifications about the change of the event's organizer.
            */
            public string getSendUpdates() {
                return sendUpdates;
            }

            /** Guests who should receive notifications about the change of the event's organizer. */
            public Move setSendUpdates(string sendUpdates) {
                this.sendUpdates = sendUpdates;
                return cast(Move) super.set("sendUpdates", sendUpdates);
            }

            override public Move set(T)(string parameterName, T value) {
                return cast(Move) super.set!T(parameterName, value);
            }

            public gdrive.models.event.Event execute() {
                return super.exec!"POST"();
            }
        }

        public Patch!(Request, Response) patch(string calendarId,
            string eventId, gcalendar.models.event.Event content) {
            Patch!(Request, Response) result = new Patch!(Request, Response)(calendarId, eventId, content);
            initialize!(Request, Response, Patch)(result);
            return result;
        }

        public class Patch(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.event.Event, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/events/%s";

            /**
            * Creates an event.
            *
            * Create a request for the method "events.insert".
            */
            protected this(string calendarId, string eventId, string destination) {
                enforce(calendarId, RequiredMessage!"calendarId");
                enforce(eventId, RequiredMessage!"eventId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId, eventId));
            }

            override {
                public Patch setAlt(string alt) {
                    return cast(Patch) super.setAlt(alt);
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

                public Patch setUserIp(string userIp) {
                    return cast(Patch) super.setUserIp(userIp);
                }
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Patch setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /** Event identifier. */
            private string eventId;

            /** Event identifier.
            */
            public string getEventId() {
                return eventId;
            }

            /** Event identifier. */
            public Patch setEventId(string eventId) {
                this.eventId = eventId;
                return this;
            }

            /**
            * Deprecated and ignored. A value will always be returned in the email field for the
            * organizer, creator and attendees, even if no real email address is available (i.e. a
            * generated, non-working value will be provided).
            */
            private Nullable!bool alwaysIncludeEmail;

            /** Deprecated and ignored. A value will always be returned in the email field for the organizer,
            creator and attendees, even if no real email address is available (i.e. a generated, non-working
            value will be provided).
            */
            public bool getAlwaysIncludeEmail() {
                return alwaysIncludeEmail.get;
            }

            /**
            * Deprecated and ignored. A value will always be returned in the email field for the
            * organizer, creator and attendees, even if no real email address is available (i.e. a
            * generated, non-working value will be provided).
            */
            public Patch setAlwaysIncludeEmail(bool alwaysIncludeEmail) {
                this.alwaysIncludeEmail = alwaysIncludeEmail.nullable;
                return cast(Patch) super.set!boot("alwaysIncludeEmail", alwaysIncludeEmail);
            }

            /**
            * Version number of conference data supported by the API client. Version 0 assumes no
            * conference data support and ignores conference data in the event's body. Version 1 enables
            * support for copying of ConferenceData as well as for creating new conferences using the
            * createRequest field of conferenceData. The default is 0.
            */
            private int conferenceDataVersion;

            /** Version number of conference data supported by the API client. Version 0 assumes no conference data
            support and ignores conference data in the event's body. Version 1 enables support for copying of
            ConferenceData as well as for creating new conferences using the createRequest field of
            conferenceData. The default is 0.
            [minimum: 0] [maximum: 1]
            */
            public int getConferenceDataVersion() {
                return conferenceDataVersion;
            }

            /**
            * Version number of conference data supported by the API client. Version 0 assumes no
            * conference data support and ignores conference data in the event's body. Version 1 enables
            * support for copying of ConferenceData as well as for creating new conferences using the
            * createRequest field of conferenceData. The default is 0.
            */
            public Patch setConferenceDataVersion(int conferenceDataVersion) {
                this.conferenceDataVersion = conferenceDataVersion;
                return cast(Patch) super.set!int("conferenceDataVersion", conferenceDataVersion);
            }

            /**
            * The maximum number of attendees to include in the response. If there are more than the
            * specified number of attendees, only the participant is returned. Optional.
            */
            private int maxAttendees;

            /** The maximum number of attendees to include in the response. If there are more than the specified
            number of attendees, only the participant is returned. Optional.
            [minimum: 1]
            */
            public int getMaxAttendees() {
                return maxAttendees;
            }

            /**
            * The maximum number of attendees to include in the response. If there are more than the
            * specified number of attendees, only the participant is returned. Optional.
            */
            public Patch setMaxAttendees(int maxAttendees) {
                this.maxAttendees = maxAttendees;
                return cast(Patch) super.set!int("maxAttendees", maxAttendees);
            }

            /**
            * Deprecated. Please use sendUpdates instead.
            *
            * Whether to send notifications about the event update (for example, description changes,
            * etc.). Note that some emails might still be sent even if you set the value to false. The
            * default is false.
            */
            private Nullable!bool sendNotifications;

            /** Deprecated. Please use sendUpdates instead.
            Whether to send notifications about the event update (for example, description changes, etc.). Note
            that some emails might still be sent even if you set the value to false. The default is false.
            */
            public bool getSendNotifications() {
                return sendNotifications.get;
            }

            /**
            * Deprecated. Please use sendUpdates instead.
            *
            * Whether to send notifications about the event update (for example, description changes,
            * etc.). Note that some emails might still be sent even if you set the value to false. The
            * default is false.
            */
            public Patch setSendNotifications(bool sendNotifications) {
                this.sendNotifications = sendNotifications.nullable;
                return cast(Patch) super.set!bool("sendNotifications", sendNotifications);
            }

            /**
            * Guests who should receive notifications about the event update (for example, title changes,
            * etc.).
            */
            private string sendUpdates;

            /** Guests who should receive notifications about the event update (for example, title changes, etc.).
            */
            public string getSendUpdates() {
                return sendUpdates;
            }

            /**
            * Guests who should receive notifications about the event update (for example, title changes,
            * etc.).
            */
            public Patch setSendUpdates(string sendUpdates) {
                this.sendUpdates = sendUpdates;
                return cast(Patch) super.set("sendUpdates", sendUpdates);
            }

            /**
            * Whether API client performing operation supports event attachments. Optional. The default
            * is False.
            */
            private Nullable!bool supportsAttachments;

            /** Whether API client performing operation supports event attachments. Optional. The default is False.
            */
            public bool getSupportsAttachments() {
                return supportsAttachments.get;
            }

            /**
            * Whether API client performing operation supports event attachments. Optional. The default
            * is False.
            */
            public Patch setSupportsAttachments(bool supportsAttachments) {
                this.supportsAttachments = supportsAttachments.nullable;
                return cast(Patch) super.set!bool("supportsAttachments", supportsAttachments);
            }

            override public Patch set(T)(string parameterName, T value) {
                return cast(Patch) super.set!T(parameterName, value);
            }

            public gcalendar.models.event.Event execute() {
                return super.exec!"PATCH"();
            }
        }

        public QuickAdd!(Request, Response) quickAdd(string calendarId, string text) {
            QuickAdd!(Request, Response) result = new QuickAdd!(Request, Response)(calendarId, text);
            initialize!(Request, Response, QuickAdd)(result);
            return result;
        }

        public class QuickAdd(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.event.Event, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/events/quickAdd";

            /**
            * Creates an event.
            *
            * Create a request for the method "events.insert".
            */
            protected this(string calendarId, string text) {
                enforce(calendarId, RequiredMessage!"calendarId");
                enforce(text, RequiredMessage!"text");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId));
            }

            override {
                public QuickAdd setAlt(string alt) {
                    return cast(QuickAdd) super.setAlt(alt);
                }

                public QuickAdd setFields(string fields) {
                    return cast(QuickAdd) super.setFields(fields);
                }

                public QuickAdd setKey(string key) {
                    return cast(QuickAdd) super.setKey(key);
                }

                public QuickAdd setOauthToken(string oauthToken) {
                    return cast(QuickAdd) super.setOauthToken(oauthToken);
                }

                public QuickAdd setPrettyPrint(bool prettyPrint) {
                    return cast(QuickAdd) super.setPrettyPrint(prettyPrint);
                }

                public QuickAdd setQuotaUser(string quotaUser) {
                    return cast(QuickAdd) super.setQuotaUser(quotaUser);
                }

                public QuickAdd setUserIp(string userIp) {
                    return cast(QuickAdd) super.setUserIp(userIp);
                }
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public QuickAdd setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /** The text describing the event to be created. */
            private string text;

            /** The text describing the event to be created.
            */
            public string getText() {
                return text;
            }

            /** The text describing the event to be created. */
            public QuickAdd setText(string text) {
                this.text = text;
                return cast(QuickAdd) super.set("text", text);
            }

            /**
            * Deprecated. Please use sendUpdates instead.
            *
            * Whether to send notifications about the creation of the event. Note that some emails might
            * still be sent even if you set the value to false. The default is false.
            */
            private Nullable!bool sendNotifications;

            /** Deprecated. Please use sendUpdates instead.
            Whether to send notifications about the creation of the event. Note that some emails might still be
            sent even if you set the value to false. The default is false.
            */
            public bool getSendNotifications() {
                return sendNotifications.get;
            }

            /**
            * Deprecated. Please use sendUpdates instead.
            *
            * Whether to send notifications about the creation of the event. Note that some emails might
            * still be sent even if you set the value to false. The default is false.
            */
            public QuickAdd setSendNotifications(bool sendNotifications) {
                this.sendNotifications = sendNotifications.nullable;
                return cast(QuickAdd) super.set!bool("sendNotifications", sendNotifications);
            }

            /** Guests who should receive notifications about the creation of the new event. */
            private string sendUpdates;

            /** Guests who should receive notifications about the creation of the new event.
            */
            public string getSendUpdates() {
                return sendUpdates;
            }

            /** Guests who should receive notifications about the creation of the new event. */
            public QuickAdd setSendUpdates(string sendUpdates) {
                this.sendUpdates = sendUpdates;
                return cast(QuickAdd) super.set("sendUpdates", sendUpdates);
            }

            override public QuickAdd set(T)(string parameterName, T value) {
                return cast(QuickAdd) super.set!T(parameterName, value);
            }

            public gcalendar.models.event.Event execute() {
                return super.exec!"POST"();
            }
        }

        public Update!(Request, Response) update(string calendarId, string eventId,
            gcalendar.models.event.Event content) {
            Update!(Request, Response) result = new Update!(Request, Response)(calendarId, eventId, content);
            initialize!(Request, Response, Update)(result);
            return result;
        }

        public class Update(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.event.Event, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/events/%s";

            /**
            * Creates an event.
            *
            * Create a request for the method "events.insert".
            */
            protected this(string calendarId, string eventId,
                gcalendar.models.event.Event content) {
                enforce(calendarId, RequiredMessage!"calendarId");
                enforce(eventId, RequiredMessage!"eventId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId, eventId));
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

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Update setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /** Event identifier. */
            private string eventId;

            /** Event identifier.
            */
            public string getEventId() {
                return eventId;
            }

            /** Event identifier. */
            public Update setEventId(string eventId) {
                this.eventId = eventId;
                return this;
            }

            /**
            * Deprecated and ignored. A value will always be returned in the email field for the
            * organizer, creator and attendees, even if no real email address is available (i.e. a
            * generated, non-working value will be provided).
            */
            private Nullable!bool alwaysIncludeEmail;

            /** Deprecated and ignored. A value will always be returned in the email field for the organizer,
            creator and attendees, even if no real email address is available (i.e. a generated, non-working
            value will be provided).
            */
            public bool getAlwaysIncludeEmail() {
                return alwaysIncludeEmail.get;
            }

            /**
            * Deprecated and ignored. A value will always be returned in the email field for the
            * organizer, creator and attendees, even if no real email address is available (i.e. a
            * generated, non-working value will be provided).
            */
            public Update setAlwaysIncludeEmail(bool alwaysIncludeEmail) {
                this.alwaysIncludeEmail = alwaysIncludeEmail.nullable;
                return cast(Update) super.set!bool("alwaysIncludeEmail", alwaysIncludeEmail);
            }

            /**
            * Version number of conference data supported by the API client. Version 0 assumes no
            * conference data support and ignores conference data in the event's body. Version 1 enables
            * support for copying of ConferenceData as well as for creating new conferences using the
            * createRequest field of conferenceData. The default is 0.
            */
            private int conferenceDataVersion;

            /** Version number of conference data supported by the API client. Version 0 assumes no conference data
            support and ignores conference data in the event's body. Version 1 enables support for copying of
            ConferenceData as well as for creating new conferences using the createRequest field of
            conferenceData. The default is 0.
            [minimum: 0] [maximum: 1]
            */
            public int getConferenceDataVersion() {
                return conferenceDataVersion;
            }

            /**
            * Version number of conference data supported by the API client. Version 0 assumes no
            * conference data support and ignores conference data in the event's body. Version 1 enables
            * support for copying of ConferenceData as well as for creating new conferences using the
            * createRequest field of conferenceData. The default is 0.
            */
            public Update setConferenceDataVersion(int conferenceDataVersion) {
                this.conferenceDataVersion = conferenceDataVersion;
                return cast(Update) super.set!int("conferenceDataVersion", conferenceDataVersion);
            }

            /**
            * The maximum number of attendees to include in the response. If there are more than the
            * specified number of attendees, only the participant is returned. Optional.
            */
            private int maxAttendees;

            /** The maximum number of attendees to include in the response. If there are more than the specified
            number of attendees, only the participant is returned. Optional.
            [minimum: 1]
            */
            public int getMaxAttendees() {
                return maxAttendees;
            }

            /**
            * The maximum number of attendees to include in the response. If there are more than the
            * specified number of attendees, only the participant is returned. Optional.
            */
            public Update setMaxAttendees(int maxAttendees) {
                this.maxAttendees = maxAttendees;
                return cast(Update) super.set!int("maxAttendees", maxAttendees);
            }

            /**
            * Deprecated. Please use sendUpdates instead.
            *
            * Whether to send notifications about the event update (for example, description changes,
            * etc.). Note that some emails might still be sent even if you set the value to false. The
            * default is false.
            */
            private Nullable!bool sendNotifications;

            /** Deprecated. Please use sendUpdates instead.
            Whether to send notifications about the event update (for example, description changes, etc.). Note
            that some emails might still be sent even if you set the value to false. The default is false.
            */
            public bool getSendNotifications() {
                return sendNotifications.get;
            }

            /**
            * Deprecated. Please use sendUpdates instead.
            *
            * Whether to send notifications about the event update (for example, description changes,
            * etc.). Note that some emails might still be sent even if you set the value to false. The
            * default is false.
            */
            public Update setSendNotifications(bool sendNotifications) {
                this.sendNotifications = sendNotifications.nullable;
                return cast(Update) super.set!bool("sendNotifications", sendNotifications);
            }

            /**
            * Guests who should receive notifications about the event update (for example, title changes,
            * etc.).
            */
            private string sendUpdates;

            /** Guests who should receive notifications about the event update (for example, title changes, etc.).
            */
            public string getSendUpdates() {
                return sendUpdates;
            }

            /**
            * Guests who should receive notifications about the event update (for example, title changes,
            * etc.).
            */
            public Update setSendUpdates(string sendUpdates) {
                this.sendUpdates = sendUpdates;
                return cast(Update) super.set("sendUpdates", sendUpdates);
            }

            /**
            * Whether API client performing operation supports event attachments. Optional. The default
            * is False.
            */
            private Nullable!bool supportsAttachments;

            /** Whether API client performing operation supports event attachments. Optional. The default is False.
            */
            public bool getSupportsAttachments() {
                return supportsAttachments.get;
            }

            /**
            * Whether API client performing operation supports event attachments. Optional. The default
            * is False.
            */
            public Update setSupportsAttachments(bool supportsAttachments) {
                this.supportsAttachments = supportsAttachments.nullable;
                return cast(Update) super.set!bool("supportsAttachments", supportsAttachments);
            }

            override public Update set(T)(string parameterName, T value) {
                return cast(Update) super.set!T(parameterName, value);
            }

            public gcalendar.models.event.Event execute() {
                return super.exec!"PUT"();
            }
        }

        public Watch!(Request, Response) watch(string calendarId,
            gcalendar.models.channel.Channel content) {
            Watch!(Request, Response) result = new Watch!(Request, Response)(calendarId, content);
            initialize!(Request, Response, Watch)(result);
            return result;
        }

        public class Watch(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.channel.Channel, RequestT, ResponseT) {
            private static const string REST_PATH = "calendars/%s/events/watch";

            /**
            * Creates an event.
            *
            * Create a request for the method "events.insert".
            */
            protected this(string calendarId,
                gcalendar.models.channel.Channel content) {
                enforce(calendarId, RequiredMessage!"calendarId");

                super(DEFAULT_BASE_URL ~ format!REST_PATH(calendarId));
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
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            private string calendarId;

            /** Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to
            access the primary calendar of the currently logged in user, use the "primary" keyword.
            */
            public string getCalendarId() {
                return calendarId;
            }

            /**
            * Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you
            * want to access the primary calendar of the currently logged in user, use the "primary"
            * keyword.
            */
            public Watch setCalendarId(string calendarId) {
                this.calendarId = calendarId;
                return this;
            }

            /**
            * Deprecated and ignored. A value will always be returned in the email field for the
            * organizer, creator and attendees, even if no real email address is available (i.e. a
            * generated, non-working value will be provided).
            */
            
            private Nullable!bool alwaysIncludeEmail;

            /** Deprecated and ignored. A value will always be returned in the email field for the organizer,
            creator and attendees, even if no real email address is available (i.e. a generated, non-working
            value will be provided).
            */
            public bool getAlwaysIncludeEmail() {
                return alwaysIncludeEmail.get;
            }

            /**
            * Deprecated and ignored. A value will always be returned in the email field for the
            * organizer, creator and attendees, even if no real email address is available (i.e. a
            * generated, non-working value will be provided).
            */
            public Watch setAlwaysIncludeEmail(bool alwaysIncludeEmail) {
                this.alwaysIncludeEmail = alwaysIncludeEmail.nullable;
                return cast(Watch) super.set!bool("alwaysIncludeEmail", alwaysIncludeEmail);
            }

            /** Specifies event ID in the iCalendar format to be included in the response. Optional. */
            private string iCalUID;

            /** Specifies event ID in the iCalendar format to be included in the response. Optional.
            */
            public string getICalUID() {
                return iCalUID;
            }

            /** Specifies event ID in the iCalendar format to be included in the response. Optional. */
            public Watch setICalUID(string iCalUID) {
                this.iCalUID = iCalUID;
                return cast(Watch) super.set("iCalUID", iCalUID);
            }

            /**
            * The maximum number of attendees to include in the response. If there are more than the
            * specified number of attendees, only the participant is returned. Optional.
            */
            private int maxAttendees;

            /** The maximum number of attendees to include in the response. If there are more than the specified
            number of attendees, only the participant is returned. Optional.
            [minimum: 1]
            */
            public int getMaxAttendees() {
                return maxAttendees;
            }

            /**
            * The maximum number of attendees to include in the response. If there are more than the
            * specified number of attendees, only the participant is returned. Optional.
            */
            public Watch setMaxAttendees(int maxAttendees) {
                this.maxAttendees = maxAttendees;
                return cast(Watch) super.set!int("maxAttendees", maxAttendees);
            }

            /**
            * Maximum number of events returned on one result page. The number of events in the resulting
            * page may be less than this value, or none at all, even if there are more events matching
            * the query. Incomplete pages can be detected by a non-empty nextPageToken field in the
            * response. By default the value is 250 events. The page size can never be larger than 2500
            * events. Optional.
            */
            private int maxResults;

            /** Maximum number of events returned on one result page. The number of events in the resulting page
            may be less than this value, or none at all, even if there are more events matching the query.
            Incomplete pages can be detected by a non-empty nextPageToken field in the response. By default the
            value is 250 events. The page size can never be larger than 2500 events. Optional. [default: 250]
            [minimum: 1]
            */
            public int getMaxResults() {
                return maxResults;
            }

            /**
            * Maximum number of events returned on one result page. The number of events in the resulting
            * page may be less than this value, or none at all, even if there are more events matching
            * the query. Incomplete pages can be detected by a non-empty nextPageToken field in the
            * response. By default the value is 250 events. The page size can never be larger than 2500
            * events. Optional.
            */
            public Watch setMaxResults(int maxResults) {
                this.maxResults = maxResults;
                return cast(Watch) super.set!int("maxResults", maxResults);
            }

            /**
            * The order of the events returned in the result. Optional. The default is an unspecified,
            * stable order.
            */
            private string orderBy;

            /** The order of the events returned in the result. Optional. The default is an unspecified, stable
            order.
            */
            public string getOrderBy() {
                return orderBy;
            }

            /**
            * The order of the events returned in the result. Optional. The default is an unspecified,
            * stable order.
            */
            public Watch setOrderBy(string orderBy) {
                this.orderBy = orderBy;
                return cast(Watch) super.set("orderBy", orderBy);
            }

            /** Token specifying which result page to return. Optional. */
            private string pageToken;

            /** Token specifying which result page to return. Optional.
            */
            public string getPageToken() {
                return pageToken;
            }

            /** Token specifying which result page to return. Optional. */
            public Watch setPageToken(string pageToken) {
                this.pageToken = pageToken;
                return cast(Watch) super.set("pageToken", pageToken);
            }

            /**
            * Extended properties constraint specified as propertyName=value. Matches only private
            * properties. This parameter might be repeated multiple times to return events that match all
            * given constraints.
            */
            private string[] privateExtendedProperty;

            /** Extended properties constraint specified as propertyName=value. Matches only private properties.
            This parameter might be repeated multiple times to return events that match all given constraints.
            */
            public string[] getPrivateExtendedProperty() {
                return privateExtendedProperty;
            }

            /**
            * Extended properties constraint specified as propertyName=value. Matches only private
            * properties. This parameter might be repeated multiple times to return events that match all
            * given constraints.
            */
            public Watch setPrivateExtendedProperty(string[] privateExtendedProperty) {
                this.privateExtendedProperty = privateExtendedProperty;
                return this;
            }

            /**
            * Free text search terms to find events that match these terms in any field, except for
            * extended properties. Optional.
            */
            private string q;

            /** Free text search terms to find events that match these terms in any field, except for extended
            properties. Optional.
            */
            public string getQ() {
                return q;
            }

            /**
            * Free text search terms to find events that match these terms in any field, except for
            * extended properties. Optional.
            */
            public Watch setQ(string q) {
                this.q = q;
                return cast(Watch) super.set("q", q);
            }

            /**
            * Extended properties constraint specified as propertyName=value. Matches only shared
            * properties. This parameter might be repeated multiple times to return events that match all
            * given constraints.
            */
            private string[] sharedExtendedProperty;

            /** Extended properties constraint specified as propertyName=value. Matches only shared properties.
            This parameter might be repeated multiple times to return events that match all given constraints.
            */
            public string[] getSharedExtendedProperty() {
                return sharedExtendedProperty;
            }

            /**
            * Extended properties constraint specified as propertyName=value. Matches only shared
            * properties. This parameter might be repeated multiple times to return events that match all
            * given constraints.
            */
            public Watch setSharedExtendedProperty(string[] sharedExtendedProperty) {
                this.sharedExtendedProperty = sharedExtendedProperty;
                return this;
            }

            /**
            * Whether to include deleted events (with status equals "cancelled") in the result. Cancelled
            * instances of recurring events (but not the underlying recurring event) will still be
            * included if showDeleted and singleEvents are both False. If showDeleted and singleEvents
            * are both True, only single instances of deleted events (but not the underlying recurring
            * events) are returned. Optional. The default is False.
            */
            private Nullable!bool showDeleted;

            /** Whether to include deleted events (with status equals "cancelled") in the result. Cancelled
            instances of recurring events (but not the underlying recurring event) will still be included if
            showDeleted and singleEvents are both False. If showDeleted and singleEvents are both True, only
            single instances of deleted events (but not the underlying recurring events) are returned.
            Optional. The default is False.
            */
            public bool getShowDeleted() {
                return showDeleted.get;
            }

            /**
            * Whether to include deleted events (with status equals "cancelled") in the result. Cancelled
            * instances of recurring events (but not the underlying recurring event) will still be
            * included if showDeleted and singleEvents are both False. If showDeleted and singleEvents
            * are both True, only single instances of deleted events (but not the underlying recurring
            * events) are returned. Optional. The default is False.
            */
            public Watch setShowDeleted(bool showDeleted) {
                this.showDeleted = showDeleted.nullable;
                return cast(Watch) super.set!bool("showDeleted", showDeleted);
            }

            /** Whether to include hidden invitations in the result. Optional. The default is False. */
            private Nullable!bool showHiddenInvitations;

            /** Whether to include hidden invitations in the result. Optional. The default is False.
            */
            public bool getShowHiddenInvitations() {
                return showHiddenInvitations.get;
            }

            /** Whether to include hidden invitations in the result. Optional. The default is False. */
            public Watch setShowHiddenInvitations(bool showHiddenInvitations) {
                this.showHiddenInvitations = showHiddenInvitations.nullable;
                return cast(Watch) super.set!bool("showHiddenInvitations", showHiddenInvitations);
            }

            /**
            * Whether to expand recurring events into instances and only return single one-off events and
            * instances of recurring events, but not the underlying recurring events themselves.
            * Optional. The default is False.
            */
            private Nullable!bool singleEvents;

            /** Whether to expand recurring events into instances and only return single one-off events and
            instances of recurring events, but not the underlying recurring events themselves. Optional. The
            default is False.
            */
            public bool getSingleEvents() {
                return singleEvents.get;
            }

            /**
            * Whether to expand recurring events into instances and only return single one-off events and
            * instances of recurring events, but not the underlying recurring events themselves.
            * Optional. The default is False.
            */
            public Watch setSingleEvents(bool singleEvents) {
                this.singleEvents = singleEvents.nullable;
                return cast(Watch) super.set!bool("singleEvents", singleEvents);
            }

            /**
            * Token obtained from the nextSyncToken field returned on the last page of results from the
            * previous list request. It makes the result of this list request contain only entries that
            * have changed since then. All events deleted since the previous list request will always be
            * in the result set and it is not allowed to set showDeleted to False. There are several
            * query parameters that cannot be specified together with nextSyncToken to ensure consistency
            * of the client state.
            *
            * These are: - iCalUID - orderBy - privateExtendedProperty - q - sharedExtendedProperty -
            * timeMin - timeMax - updatedMin If the syncToken expires, the server will respond with a 410
            * GONE response code and the client should clear its storage and perform a full
            * synchronization without any syncToken. Learn more about incremental synchronization.
            * Optional. The default is to return all entries.
            */
            private string syncToken;

            /** Token obtained from the nextSyncToken field returned on the last page of results from the previous
            list request. It makes the result of this list request contain only entries that have changed since
            then. All events deleted since the previous list request will always be in the result set and it is
            not allowed to set showDeleted to False. There are several query parameters that cannot be
            specified together with nextSyncToken to ensure consistency of the client state.
            These are: - iCalUID - orderBy - privateExtendedProperty - q - sharedExtendedProperty - timeMin -
            timeMax - updatedMin If the syncToken expires, the server will respond with a 410 GONE response
            code and the client should clear its storage and perform a full synchronization without any
            syncToken. Learn more about incremental synchronization. Optional. The default is to return all
            entries.
            */
            public string getSyncToken() {
                return syncToken;
            }

            /**
            * Token obtained from the nextSyncToken field returned on the last page of results from the
            * previous list request. It makes the result of this list request contain only entries that
            * have changed since then. All events deleted since the previous list request will always be
            * in the result set and it is not allowed to set showDeleted to False. There are several
            * query parameters that cannot be specified together with nextSyncToken to ensure consistency
            * of the client state.
            *
            * These are: - iCalUID - orderBy - privateExtendedProperty - q - sharedExtendedProperty -
            * timeMin - timeMax - updatedMin If the syncToken expires, the server will respond with a 410
            * GONE response code and the client should clear its storage and perform a full
            * synchronization without any syncToken. Learn more about incremental synchronization.
            * Optional. The default is to return all entries.
            */
            public Watch setSyncToken(string syncToken) {
                this.syncToken = syncToken;
                return cast(Watch) super.set("syncToken", syncToken);
            }

            /**
            * Upper bound (exclusive) for an event's start time to filter by. Optional. The default is
            * not to filter by start time. Must be an RFC3339 timestamp with mandatory time zone offset,
            * for example, 2011-06-03T10:00:00-07:00, 2011-06-03T10:00:00Z. Milliseconds may be provided
            * but are ignored. If timeMin is set, timeMax must be greater than timeMin.
            */
            
            private SysTime timeMax;

            /** Upper bound (exclusive) for an event's start time to filter by. Optional. The default is not to
            filter by start time. Must be an RFC3339 timestamp with mandatory time zone offset, for example,
            2011-06-03T10:00:00-07:00, 2011-06-03T10:00:00Z. Milliseconds may be provided but are ignored. If
            timeMin is set, timeMax must be greater than timeMin.
            */
            public SysTime getTimeMax() {
                return timeMax;
            }

            /**
            * Upper bound (exclusive) for an event's start time to filter by. Optional. The default is
            * not to filter by start time. Must be an RFC3339 timestamp with mandatory time zone offset,
            * for example, 2011-06-03T10:00:00-07:00, 2011-06-03T10:00:00Z. Milliseconds may be provided
            * but are ignored. If timeMin is set, timeMax must be greater than timeMin.
            */
            public Watch setTimeMax(SysTime timeMax) {
                this.timeMax = timeMax;
                return cast(Watch) super.set("timeMax", timeMax.toString);
            }

            /**
            * Lower bound (exclusive) for an event's end time to filter by. Optional. The default is not
            * to filter by end time. Must be an RFC3339 timestamp with mandatory time zone offset, for
            * example, 2011-06-03T10:00:00-07:00, 2011-06-03T10:00:00Z. Milliseconds may be provided but
            * are ignored. If timeMax is set, timeMin must be smaller than timeMax.
            */
            private SysTime timeMin;

            /** Lower bound (exclusive) for an event's end time to filter by. Optional. The default is not to
            filter by end time. Must be an RFC3339 timestamp with mandatory time zone offset, for example,
            2011-06-03T10:00:00-07:00, 2011-06-03T10:00:00Z. Milliseconds may be provided but are ignored. If
            timeMax is set, timeMin must be smaller than timeMax.
            */
            public SysTime getTimeMin() {
                return timeMin;
            }

            /**
            * Lower bound (exclusive) for an event's end time to filter by. Optional. The default is not
            * to filter by end time. Must be an RFC3339 timestamp with mandatory time zone offset, for
            * example, 2011-06-03T10:00:00-07:00, 2011-06-03T10:00:00Z. Milliseconds may be provided but
            * are ignored. If timeMax is set, timeMin must be smaller than timeMax.
            */
            public Watch setTimeMin(SysTime timeMin) {
                this.timeMin = timeMin;
                return cast(Watch) super.set("timeMin", timeMin.toString);
            }

            /**
            * Time zone used in the response. Optional. The default is the time zone of the calendar.
            */
            private string timeZone;

            /** Time zone used in the response. Optional. The default is the time zone of the calendar.
            */
            public string getTimeZone() {
                return timeZone;
            }

            /**
            * Time zone used in the response. Optional. The default is the time zone of the calendar.
            */
            public Watch setTimeZone(string timeZone) {
                this.timeZone = timeZone;
                return cast(Watch) super.set("timeZone", timezone);
            }

            /**
            * Lower bound for an event's last modification time (as a RFC3339 timestamp) to filter by.
            * When specified, entries deleted since this time will always be included regardless of
            * showDeleted. Optional. The default is not to filter by last modification time.
            */
            private SysTime updatedMin;

            /** Lower bound for an event's last modification time (as a RFC3339 timestamp) to filter by. When
            specified, entries deleted since this time will always be included regardless of showDeleted.
            Optional. The default is not to filter by last modification time.
            */
            public SysTime getUpdatedMin() {
                return updatedMin;
            }

            /**
            * Lower bound for an event's last modification time (as a RFC3339 timestamp) to filter by.
            * When specified, entries deleted since this time will always be included regardless of
            * showDeleted. Optional. The default is not to filter by last modification time.
            */
            public Watch setUpdatedMin(SysTime updatedMin) {
                this.updatedMin = updatedMin;
                return cast(Watch) super.set("updatedMin", updatedMin.toString);
            }

            override public Watch set(T)(string parameterName, T value) {
                return cast(Watch) super.set!T(parameterName, value);
            }

            public gcalendar.models.channel.Channel execute() {
                return super.exec!"POST"();
            }
        }
    }

    public Freebusy freebusy() {
        return new Freebusy();
    }

    public class Freebusy {
        public Query!(Request, Response) query(gcalendar.models.freebusyrequest.FreeBusyRequest content) {
            Query!(Request, Response) result = new Query!(Request, Response)(content);
            initialize!(Request, Response, Query)(result);
            return result;
        }

        public class Query(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.freebusyrequest.FreeBusyRequest, RequestT, ResponseT) {
            private static const string REST_PATH = "freeBusy";

            protected this(gcalendar.models.freebusyrequest.FreeBusyRequest content) {
                super(DEFAULT_BASE_URL ~ REST_PATH, content);
            }

            override {
                public Query setAlt(string alt) {
                    return cast(Query) super.setAlt(alt);
                }

                public Query setFields(string fields) {
                    return cast(Query) super.setFields(fields);
                }

                public Query setKey(string key) {
                    return cast(Query) super.setKey(key);
                }

                public Query setOauthToken(string oauthToken) {
                    return cast(Query) super.setOauthToken(oauthToken);
                }

                public Query setPrettyPrint(bool prettyPrint) {
                    return cast(Query) super.setPrettyPrint(prettyPrint);
                }

                public Query setQuotaUser(string quotaUser) {
                    return cast(Query) super.setQuotaUser(quotaUser);
                }

                public Query setUserIp(string userIp) {
                    return cast(Query) super.setUserIp(userIp);
                }

                public Query set(T)(string parameterName, T value) {
                    return cast(Query) super.set!T(parameterName, value);
                }
            }

            public gcalendar.models.freebusyrequest.FreeBusyRequest execute() {
                return super.exec!"POST"();
            }
        }
    }

    public Settings settings() {
        return new Settings();
    }

    public class Settings {
        public Get!(Request, Response) get(string setting) {
            Get!(Request, Response) result = new Get!(Request, Response)(setting);
            initialize!(Request, Response, Get)(result);
            return result;
        }

        public class Get(RequestT = Request, ResponseT = Respones) :
            APIRequest!(gcalendar.models.setting.Setting, RequestT, ResponseT) {
            private static const string REST_PATH = "users/me/settings/%s";

            protected this(string setting) {
                enforce(setting, RequiredMessage!"setting");

                super(DEFAULT_BASE_URL ~ REST_PATH, content);
            }

            override {
                public Get setAlt(java.lang.String alt) {
                    return cast(Get) super.setAlt(alt);
                }

                public Get setFields(java.lang.String fields) {
                    return cast(Get) super.setFields(fields);
                }

                public Get setKey(java.lang.String key) {
                    return cast(Get) super.setKey(key);
                }

                public Get setOauthToken(java.lang.String oauthToken) {
                    return cast(Get) super.setOauthToken(oauthToken);
                }

                public Get setPrettyPrint(java.lang.Boolean prettyPrint) {
                    return cast(Get) super.setPrettyPrint(prettyPrint);
                }

                public Get setQuotaUser(java.lang.String quotaUser) {
                    return cast(Get) super.setQuotaUser(quotaUser);
                }

                public Get setUserIp(java.lang.String userIp) {
                    return cast(Get) super.setUserIp(userIp);
                }
            }

            /** The id of the user setting. */
            @com.google.api.client.util.Key
            private java.lang.String setting;

            /** The id of the user setting.
            */
            public java.lang.String getSetting() {
                return setting;
            }

            /** The id of the user setting. */
            public Get setSetting(java.lang.String setting) {
                this.setting = setting;
                return this;
            }

            @Override
            public Get set(String parameterName, Object value) {
                return (Get) super.set(parameterName, value);
            }
        }
    }
}