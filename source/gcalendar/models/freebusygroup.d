module gcalendar.models.freebusygroup;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct FreeBusyGroup {
	/** Optional error(s) (if computation for the group failed).*/
	private static const string ERRORS = "errors";
	import gcalendar.models.error;
	@optional Error[] _errors;
	mixin(GetterSetter!("Error[]", "FreeBusyGroup")(ERRORS));

	/** List of calendars' identifiers within a group.*/
	private static const string CALENDARS = "calendars";
	string[] _calendars;
	mixin(GetterSetter!("string[]", "FreeBusyGroup")(CALENDARS));

}
