module gdrive.models.permissionlist;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct PermissionList {
	/** Identifies what kind of resource this is. Value: the fixed string "drive#permissionList".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "PermissionList")(KIND));

	/** The page token for the next page of permissions. This field will be absent if the end of the permissions list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results.*/
	private static const string NEXTPAGETOKEN = "nextPageToken";
	string _nextPageToken;
	mixin(GetterSetter!("string", "PermissionList")(NEXTPAGETOKEN));

	/** The list of permissions. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched.*/
	private static const string PERMISSIONS = "permissions";
	import gdrive.models.permission;
	Permission[] _permissions;
	mixin(GetterSetter!("Permission[]", "PermissionList")(PERMISSIONS));

}
