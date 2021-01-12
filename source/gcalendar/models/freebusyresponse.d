module gcalendar.models.freebusyresponse;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct FreeBusyResponse {
	/** Type of the resource ("calendar#freeBusy").*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "FreeBusyResponse")(KIND));

	/** The start of the interval.*/
	private static const string TIMEMIN = "timeMin";
	string _timeMin;
	mixin(GetterSetter!("string", "FreeBusyResponse")(TIMEMIN));

	/** The end of the interval.*/
	private static const string TIMEMAX = "timeMax";
	string _timeMax;
	mixin(GetterSetter!("string", "FreeBusyResponse")(TIMEMAX));

	/** List of free/busy information for calendars.*/
	private static const string CALENDARS = "calendars";

	/** Expansion of groups.*/
	private static const string GROUPS = "groups";

}
