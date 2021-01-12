module gcalendar.models.freebusyrequestitem;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct FreeBusyRequestItem {
	/** The identifier of a calendar or a group.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "FreeBusyRequestItem")(ID));

}
