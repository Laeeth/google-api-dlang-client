module gcalendar.models.freebusyrequest;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct FreeBusyRequest {
	/** The start of the interval for the query formatted as per RFC3339.*/
	private static const string TIMEMIN = "timeMin";
	string _timeMin;
	mixin(GetterSetter!("string", "FreeBusyRequest")(TIMEMIN));

	/** Time zone used in the response. Optional. The default is UTC.*/
	private static const string TIMEZONE = "timeZone";
	@optional string _timeZone;
	mixin(GetterSetter!("string", "FreeBusyRequest")(TIMEZONE));

	/** Maximal number of calendars for which FreeBusy information is to be provided. Optional. Maximum value is 50.*/
	private static const string CALENDAREXPANSIONMAX = "calendarExpansionMax";
	@optional int _calendarExpansionMax;
	mixin(GetterSetter!("int", "FreeBusyRequest")(CALENDAREXPANSIONMAX));

	/** Maximal number of calendar identifiers to be provided for a single group. Optional. An error is returned for a group with more members than this value. Maximum value is 100.*/
	private static const string GROUPEXPANSIONMAX = "groupExpansionMax";
	@optional int _groupExpansionMax;
	mixin(GetterSetter!("int", "FreeBusyRequest")(GROUPEXPANSIONMAX));

	/** The end of the interval for the query formatted as per RFC3339.*/
	private static const string TIMEMAX = "timeMax";
	string _timeMax;
	mixin(GetterSetter!("string", "FreeBusyRequest")(TIMEMAX));

	/** List of calendars and/or groups to query.*/
	private static const string ITEMS = "items";
	import gcalendar.models.freebusyrequestitem;
	FreeBusyRequestItem[] _items;
	mixin(GetterSetter!("FreeBusyRequestItem[]", "FreeBusyRequest")(ITEMS));

}
