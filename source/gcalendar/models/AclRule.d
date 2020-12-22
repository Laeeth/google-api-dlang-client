module gcalendar.modules.aclrule;



public struct AclRule {
    JSONValue container;
    alias container this;

    /**
    * ETag of the resource.
    * The value may be {@code null}.
    */
    private static string ETAG = "etag";

    /**
    * Identifier of the ACL rule.
    * The value may be {@code null}.
    */
    private static const string ID = "id";    

    /**
    * Type of the resource ("calendar#aclRule").
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";

    /**
    * The role assigned to the scope. Possible values are: - "none" - Provides no access.  -
    * "freeBusyReader" - Provides read access to free/busy information.  - "reader" - Provides read
    * access to the calendar. Private events will appear to users with reader access, but event
    * details will be hidden.  - "writer" - Provides read and write access to the calendar. Private
    * events will appear to users with writer access, and event details will be visible.  - "owner" -
    * Provides ownership of the calendar. This role has all of the permissions of the writer role
    * with the additional ability to see and manipulate ACLs.
    * The value may be {@code null}.
    */
    private static const string ROLE = "role";

    /**
    * The scope of the rule.
    * The value may be {@code null}.
    */
    private static const string SCOPE = "scope";

    /**
    * ETag of the resource.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "AclRule")(ETAG));

    /**
    * Identifier of the ACL rule.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "AclRule")(ID));

    /**
    * Type of the resource ("calendar#aclRule").
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "AclRule")(KIND));

    /**
    * The role assigned to the scope. Possible values are: - "none" - Provides no access.  -
    * "freeBusyReader" - Provides read access to free/busy information.  - "reader" - Provides read
    * access to the calendar. Private events will appear to users with reader access, but event
    * details will be hidden.  - "writer" - Provides read and write access to the calendar. Private
    * events will appear to users with writer access, and event details will be visible.  - "owner" -
    * Provides ownership of the calendar. This role has all of the permissions of the writer role
    * with the additional ability to see and manipulate ACLs.
    * @return value or {@code null} for none
    */
    /**
    * The scope of the rule.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "AclRule")(ROLE));

    /**
    * The scope of the rule.
    */
    public struct setIncludePermissionsForView {
        JSONValue container;
        alias container this;

        /**
        * The type of the scope. Possible values are: - "default" - The public scope. This is the default
        * value.  - "user" - Limits the scope to a single user.  - "group" - Limits the scope to a group.
        * - "domain" - Limits the scope to a domain.  Note: The permissions granted to the "default", or
        * public, scope apply to any user, authenticated or not.
        * The value may be {@code null}.
        */
        private static const string TYPE = "type";

        /**
        * The email address of a user or group, or the name of a domain, depending on the scope type.
        * Omitted for type "default".
        * The value may be {@code null}.
        */
        private static const string VALUE = "value";        

        /**
        * The type of the scope. Possible values are: - "default" - The public scope. This is the default
        * value.  - "user" - Limits the scope to a single user.  - "group" - Limits the scope to a group.
        * - "domain" - Limits the scope to a domain.  Note: The permissions granted to the "default", or
        * public, scope apply to any user, authenticated or not.
        * @return value or {@code null} for none
        */
        mixin(GetterSetterBasicType!(string, "Scope")(TYPE));

        /**
        * The email address of a user or group, or the name of a domain, depending on the scope type.
        * Omitted for type "default".
        * @return value or {@code null} for none
        */
        mixin(GetterSetterBasicType!(string, "Scope")(VALUE));
    }
}