module gdrive.models.contentrestriction;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ContentRestriction {
	/** Reason for why the content of the file is restricted. This is only mutable on requests that also set readOnly=true.*/
	private static const string REASON = "reason";
	string _reason;
	mixin(GetterSetter!("string", "ContentRestriction")(REASON));

	/** Whether the content of the file is read-only. If a file is read-only, a new revision of the file may not be added, comments may not be added or modified, and the title of the file may not be modified.*/
	private static const string READONLY = "readOnly";
	bool _readOnly;
	mixin(GetterSetter!("bool", "ContentRestriction")(READONLY));

	/** The time at which the content restriction was set (formatted RFC 3339 timestamp). Only populated if readOnly is true.*/
	private static const string RESTRICTIONTIME = "restrictionTime";
	string _restrictionTime;
	mixin(GetterSetter!("string", "ContentRestriction")(RESTRICTIONTIME));

	/** The type of the content restriction. Currently the only possible value is globalContentRestriction.*/
	private static const string TYPE = "type";
	string _type;
	mixin(GetterSetter!("string", "ContentRestriction")(TYPE));

	/** The user who set the content restriction. Only populated if readOnly is true.*/
	private static const string RESTRICTINGUSER = "restrictingUser";
	import gdrive.models.user;
	User _restrictingUser;
	mixin(GetterSetter!("User", "ContentRestriction")(RESTRICTINGUSER));

}
