module gdrive.models.Permission;

import gdrive.drive;
import std.json;
import std.datetime : SysTime;
import std.typecons : Nullable, nullable;
import std.conv : to;

public final struct Permission {
    JSONValue container;
    alias container this;

    /**
    * Whether the permission allows the file to be discovered through search. This is only applicable
    * for permissions of type domain or anyone.
    * The value may be {@code null}.
    */
    private static const string ALLOW_FILE_DISCOVERY = "allowFileDiscovery";

    /**
    * Whether the account associated with this permission has been deleted. This field only pertains
    * to user and group permissions.
    * The value may be {@code null}.
    */
    private static const string DELETED = "deleted";    

    /**
    * The "pretty" name of the value of the permission. The following is a list of examples for each
    * type of permission: - user - User's full name, as defined for their Google account, such as
    * "Joe Smith."  - group - Name of the Google Group, such as "The Company Administrators."  -
    * domain - String domain name, such as "thecompany.com."  - anyone - No displayName is present.
    * The value may be {@code null}.
    */
    private static const string DISPLAY_NAME = "displayName";    

    /**
    * The domain to which this permission refers.
    * The value may be {@code null}.
    */
    private static const string DOMAIN = "domain";    

    /**
    * The email address of the user or group to which this permission refers.
    * The value may be {@code null}.
    */
    private static const string EMAIL_ADDRESS = "emailAddress";    

    /**
    * The time at which this permission will expire (RFC 3339 date-time). Expiration times have the
    * following restrictions: - They can only be set on user and group permissions  - The time must
    * be in the future  - The time cannot be more than a year in the future
    * The value may be {@code null}.
    */
    private static const string EXPIRATION_TIME = "expirationTime";    

    /**
    * The ID of this permission. This is a unique identifier for the grantee, and is published in
    * User resources as permissionId. IDs should be treated as opaque values.
    * The value may be {@code null}.
    */
    private static const string ID = "id";    

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#permission".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";    

    /**
    * Details of whether the permissions on this shared drive item are inherited or directly on this
    * item. This is an output-only field which is present only for shared drive items.
    * The value may be {@code null}.
    */
    private static const string PERMISSION_DETAILS = "permissionDetails";    

    /**
    * A link to the user's profile photo, if available.
    * The value may be {@code null}.
    */
    private static const string PHOTO_LINK = "photoLink";

    /**
    * The role granted by this permission. While new values may be supported in the future, the
    * following are currently allowed: - owner  - organizer  - fileOrganizer  - writer  - commenter
    * - reader
    * The value may be {@code null}.
    */
    private static const string ROLE = "role";    

    /**
    * Deprecated - use permissionDetails instead.
    * The value may be {@code null}.
    */
    private static const string TEAM_DRIVE_PERMISSION_DETAILS = "teamDrivePermissionDetails";

    /**
    * The type of the grantee. Valid values are: - user  - group  - domain  - anyone  When creating a
    * permission, if type is user or group, you must provide an emailAddress for the user or group.
    * When type is domain, you must provide a domain. There isn't extra information required for a
    * anyone type.
    * The value may be {@code null}.
    */
    private static const string TYPE = "type";

    /**
    * Indicates the view for this permission. Only populated for permissions that belong to a view.
    * published is the only supported value.
    * The value may be {@code null}.
    */
    private static const string VIEW = "view";

    /**
    * Whether the permission allows the file to be discovered through search. This is only applicable
    * for permissions of type domain or anyone.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "Permission")(ALLOW_FILE_DISCOVERY));

    /**
    * Whether the account associated with this permission has been deleted. This field only pertains
    * to user and group permissions.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "Permission")(DELETED));

    /**
    * The "pretty" name of the value of the permission. The following is a list of examples for each
    * type of permission: - user - User's full name, as defined for their Google account, such as
    * "Joe Smith."  - group - Name of the Google Group, such as "The Company Administrators."  -
    * domain - String domain name, such as "thecompany.com."  - anyone - No displayName is present.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "Permission")(DISPLAY_NAME));

    /**
    * The domain to which this permission refers.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Permission")(DOMAIN));

    /**
    * The email address of the user or group to which this permission refers.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Permission")(EMAIL_ADDRESS));

    /**
    * The time at which this permission will expire (RFC 3339 date-time). Expiration times have the
    * following restrictions: - They can only be set on user and group permissions  - The time must
    * be in the future  - The time cannot be more than a year in the future
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(SysTime, "Permission")(EXPIRATION_TIME));

    /**
    * The ID of this permission. This is a unique identifier for the grantee, and is published in
    * User resources as permissionId. IDs should be treated as opaque values.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Permission")(ID));

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#permission".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Permission")(KIND));

    /**
    * Details of whether the permissions on this shared drive item are inherited or directly on this
    * item. This is an output-only field which is present only for shared drive items.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("PermissionDetails[]", "Permission")(PERMISSION_DETAILS));

    /**
    * A link to the user's profile photo, if available.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Permission")(PHOTO_LINK));

    /**
    * The role granted by this permission. While new values may be supported in the future, the
    * following are currently allowed: - owner  - organizer  - fileOrganizer  - writer  - commenter
    * - reader
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Permission")(ROLE));

    /**
    * Deprecated - use permissionDetails instead.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("TeamDrivePermissionDetails[]", "Permission")(TEAM_DRIVE_PERMISSION_DETAILS));

    /**
    * The type of the grantee. Valid values are: - user  - group  - domain  - anyone  When creating a
    * permission, if type is user or group, you must provide an emailAddress for the user or group.
    * When type is domain, you must provide a domain. There isn't extra information required for a
    * anyone type.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Permission")(TYPE));

    /**
    * Indicates the view for this permission. Only populated for permissions that belong to a view.
    * published is the only supported value.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Permission")(VIEW));

    /**
    * Model definition for PermissionPermissionDetails.
    */
    public final struct PermissionDetails {
        JSONValue container;
        alias container this;

        /**
        * Whether this permission is inherited. This field is always populated. This is an output-only
        * field.
        * The value may be {@code null}.
        */
        private static const string INHERITED = "inherited";

        /**
        * The ID of the item from which this permission is inherited. This is an output-only field.
        * The value may be {@code null}.
        */
        private static const string INHERITED_FROM = "inheritedFrom";

        /**
        * The permission type for this user. While new values may be added in future, the following are
        * currently possible: - file  - member
        * The value may be {@code null}.
        */
        private static const string PERMISSION_TYPE = "permissionType";

        /**
        * The primary role for this user. While new values may be added in the future, the following are
        * currently possible: - organizer  - fileOrganizer  - writer  - commenter  - reader
        * The value may be {@code null}.
        */
        private static const string ROLE = "role";

        /**
        * Whether this permission is inherited. This field is always populated. This is an output-only
        * field.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "PermissionDetails")(INHERITED));

        /**
        * The ID of the item from which this permission is inherited. This is an output-only field.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "PermissionDetails")(INHERITED_FROM));

        /**
        * The permission type for this user. While new values may be added in future, the following are
        * currently possible: - file  - member
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "PermissionDetails")(PERMISSION_TYPE));

        /**
        * The primary role for this user. While new values may be added in the future, the following are
        * currently possible: - organizer  - fileOrganizer  - writer  - commenter  - reader
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "PermissionDetails")(ROLE));
    }

    /**
    * Model definition for PermissionTeamDrivePermissionDetails.
    */
    public final struct TeamDrivePermissionDetails {
        JSONValue container;
        alias container this;
        /**
        * Deprecated - use permissionDetails/inherited instead.
        * The value may be {@code null}.
        */
        private static const string INHERITED = "inherited";

        /**
        * Deprecated - use permissionDetails/inheritedFrom instead.
        * The value may be {@code null}.
        */
        private static const string INHERITED_FROM = "inheritedFrom";

        /**
        * Deprecated - use permissionDetails/role instead.
        * The value may be {@code null}.
        */
        private static const string ROLE = "role";

        /**
        * Deprecated - use permissionDetails/permissionType instead.
        * The value may be {@code null}.
        */
        private static const string TEAM_DRIVE_PERMISSION_TYPE = "teamDrivePermissionType";

        /**
        * Deprecated - use permissionDetails/inherited instead.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "TeamDrivePermissionDetails")(INHERITED));

        /**
        * Deprecated - use permissionDetails/inheritedFrom instead.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "TeamDrivePermissionDetails")(INHERITED_FROM));

        /**
        * Deprecated - use permissionDetails/role instead.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "TeamDrivePermissionDetails")(ROLE));

        /**
        * Deprecated - use permissionDetails/permissionType instead.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "TeamDrivePermissionDetails")(TEAM_DRIVE_PERMISSION_TYPE));
    }
}