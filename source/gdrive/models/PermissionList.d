module gdrive.models.permissionlist;

import gdrive.drive;
import gdrive.models.Permission;
import std.json;
import std.typecons : Nullable, nullable;
import std.conv : to;
import std.datetime : SysTime;

public final struct PermissionList {
    JSONValue container;
    alias container this;

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#permissionList".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";

    /**
    * The page token for the next page of permissions. This field will be absent if the end of the
    * permissions list has been reached. If the token is rejected for any reason, it should be
    * discarded, and pagination should be restarted from the first page of results.
    * The value may be {@code null}.
    */
    private static const string NEXT_PAGE_TOKEN = "nextPageToken";

    /**
    * The list of permissions. If nextPageToken is populated, then this list may be incomplete and an
    * additional page of results should be fetched.
    * The value may be {@code null}.
    */
    private static const string PERMISSIONS = "permissions";

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#permissionList".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "PermissionList")(KIND));

    /**
    * The page token for the next page of permissions. This field will be absent if the end of the
    * permissions list has been reached. If the token is rejected for any reason, it should be
    * discarded, and pagination should be restarted from the first page of results.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "PermissionList")(NEXT_PAGE_TOKEN));

    /**
    * The list of permissions. If nextPageToken is populated, then this list may be incomplete and an
    * additional page of results should be fetched.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("Permission[]", "PermissionList")(PERMISSIONS));
}