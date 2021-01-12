module gdrive.models.permission;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Permission {
	/** The ID of this permission. This is a unique identifier for the grantee, and is published in User resources as permissionId. IDs should be treated as opaque values.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "Permission")(ID));

	/** A link to the user's profile photo, if available.*/
	private static const string PHOTOLINK = "photoLink";
	@optional string _photoLink;
	mixin(GetterSetter!("string", "Permission")(PHOTOLINK));

	/** Identifies what kind of resource this is. Value: the fixed string "drive#permission".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "Permission")(KIND));

	/** The time at which this permission will expire (RFC 3339 date-time). Expiration times have the following restrictions:  
- They can only be set on user and group permissions 
- The time must be in the future 
- The time cannot be more than a year in the future*/
	private static const string EXPIRATIONTIME = "expirationTime";
	string _expirationTime;
	mixin(GetterSetter!("string", "Permission")(EXPIRATIONTIME));

	/** Details of whether the permissions on this shared drive item are inherited or directly on this item. This is an output-only field which is present only for shared drive items.*/
	private static const string PERMISSIONDETAILS = "permissionDetails";
	public struct PermissionDetails {
		/** Whether this permission is inherited. This field is always populated. This is an output-only field.*/
		private static const string INHERITED = "inherited";
		bool _inherited;
		mixin(GetterSetter!("bool", "PermissionDetails")(INHERITED));

		/** The ID of the item from which this permission is inherited. This is an output-only field.*/
		private static const string INHERITEDFROM = "inheritedFrom";
		string _inheritedFrom;
		mixin(GetterSetter!("string", "PermissionDetails")(INHERITEDFROM));

		/** The primary role for this user. While new values may be added in the future, the following are currently possible:  
- organizer 
- fileOrganizer 
- writer 
- commenter 
- reader*/
		private static const string ROLE = "role";
		string _role;
		mixin(GetterSetter!("string", "PermissionDetails")(ROLE));

		/** The permission type for this user. While new values may be added in future, the following are currently possible:  
- file 
- member*/
		private static const string PERMISSIONTYPE = "permissionType";
		string _permissionType;
		mixin(GetterSetter!("string", "PermissionDetails")(PERMISSIONTYPE));

	}
	PermissionDetails[] _permissionDetails;
	mixin(GetterSetter!("PermissionDetails[]", "Permission")(PERMISSIONDETAILS));

	/** Deprecated - use permissionDetails instead.*/
	private static const string TEAMDRIVEPERMISSIONDETAILS = "teamDrivePermissionDetails";
	public struct TeamDrivePermissionDetails {
		/** Deprecated - use permissionDetails/inherited instead.*/
		private static const string INHERITED = "inherited";
		bool _inherited;
		mixin(GetterSetter!("bool", "TeamDrivePermissionDetails")(INHERITED));

		/** Deprecated - use permissionDetails/permissionType instead.*/
		private static const string TEAMDRIVEPERMISSIONTYPE = "teamDrivePermissionType";
		string _teamDrivePermissionType;
		mixin(GetterSetter!("string", "TeamDrivePermissionDetails")(TEAMDRIVEPERMISSIONTYPE));

		/** Deprecated - use permissionDetails/inheritedFrom instead.*/
		private static const string INHERITEDFROM = "inheritedFrom";
		string _inheritedFrom;
		mixin(GetterSetter!("string", "TeamDrivePermissionDetails")(INHERITEDFROM));

		/** Deprecated - use permissionDetails/role instead.*/
		private static const string ROLE = "role";
		string _role;
		mixin(GetterSetter!("string", "TeamDrivePermissionDetails")(ROLE));

	}
	TeamDrivePermissionDetails[] _teamDrivePermissionDetails;
	mixin(GetterSetter!("TeamDrivePermissionDetails[]", "Permission")(TEAMDRIVEPERMISSIONDETAILS));

	/** The email address of the user or group to which this permission refers.*/
	private static const string EMAILADDRESS = "emailAddress";
	string _emailAddress;
	mixin(GetterSetter!("string", "Permission")(EMAILADDRESS));

	/** The domain to which this permission refers.*/
	private static const string DOMAIN = "domain";
	string _domain;
	mixin(GetterSetter!("string", "Permission")(DOMAIN));

	/** The "pretty" name of the value of the permission. The following is a list of examples for each type of permission:  
- user - User's full name, as defined for their Google account, such as "Joe Smith." 
- group - Name of the Google Group, such as "The Company Administrators." 
- domain - String domain name, such as "thecompany.com." 
- anyone - No displayName is present.*/
	private static const string DISPLAYNAME = "displayName";
	string _displayName;
	mixin(GetterSetter!("string", "Permission")(DISPLAYNAME));

	/** Whether the permission allows the file to be discovered through search. This is only applicable for permissions of type domain or anyone.*/
	private static const string ALLOWFILEDISCOVERY = "allowFileDiscovery";
	bool _allowFileDiscovery;
	mixin(GetterSetter!("bool", "Permission")(ALLOWFILEDISCOVERY));

	/** The type of the grantee. Valid values are:  
- user 
- group 
- domain 
- anyone  When creating a permission, if type is user or group, you must provide an emailAddress for the user or group. When type is domain, you must provide a domain. There isn't extra information required for a anyone type.*/
	private static const string TYPE = "type";
	string _type;
	mixin(GetterSetter!("string", "Permission")(TYPE));

	/** Whether the account associated with this permission has been deleted. This field only pertains to user and group permissions.*/
	private static const string DELETED = "deleted";
	bool _deleted;
	mixin(GetterSetter!("bool", "Permission")(DELETED));

	/** The role granted by this permission. While new values may be supported in the future, the following are currently allowed:  
- owner 
- organizer 
- fileOrganizer 
- writer 
- commenter 
- reader*/
	private static const string ROLE = "role";
	string _role;
	mixin(GetterSetter!("string", "Permission")(ROLE));

	/** Indicates the view for this permission. Only populated for permissions that belong to a view. published is the only supported value.*/
	private static const string VIEW = "view";
	string _view;
	mixin(GetterSetter!("string", "Permission")(VIEW));

}
