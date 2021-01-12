module gdrive.models.user;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct User {
	/** Identifies what kind of resource this is. Value: the fixed string "drive#user".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "User")(KIND));

	/** The user's ID as visible in Permission resources.*/
	private static const string PERMISSIONID = "permissionId";
	string _permissionId;
	mixin(GetterSetter!("string", "User")(PERMISSIONID));

	/** A link to the user's profile photo, if available.*/
	private static const string PHOTOLINK = "photoLink";
	@optional string _photoLink;
	mixin(GetterSetter!("string", "User")(PHOTOLINK));

	/** The email address of the user. This may not be present in certain contexts if the user has not made their email address visible to the requester.*/
	private static const string EMAILADDRESS = "emailAddress";
	string _emailAddress;
	mixin(GetterSetter!("string", "User")(EMAILADDRESS));

	/** A plain text displayable name for this user.*/
	private static const string DISPLAYNAME = "displayName";
	string _displayName;
	mixin(GetterSetter!("string", "User")(DISPLAYNAME));

	/** Whether this user is the requesting user.*/
	private static const string ME = "me";
	bool _me;
	mixin(GetterSetter!("bool", "User")(ME));

}
