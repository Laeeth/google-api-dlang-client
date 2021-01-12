module gcalendar.models.calendarlist;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct CalendarList {
	/** Type of the collection ("calendar#calendarList").*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "CalendarList")(KIND));

	/** Token used at a later point in time to retrieve only the entries that have changed since this result was returned. Omitted if further results are available, in which case nextPageToken is provided.*/
	private static const string NEXTSYNCTOKEN = "nextSyncToken";
	@optional string _nextSyncToken;
	mixin(GetterSetter!("string", "CalendarList")(NEXTSYNCTOKEN));

	/** Token used to access the next page of this result. Omitted if no further results are available, in which case nextSyncToken is provided.*/
	private static const string NEXTPAGETOKEN = "nextPageToken";
	@optional string _nextPageToken;
	mixin(GetterSetter!("string", "CalendarList")(NEXTPAGETOKEN));

	/** Calendars that are present on the user's calendar list.*/
	private static const string ITEMS = "items";
	import gcalendar.models.calendarlistentry;
	CalendarListEntry[] _items;
	mixin(GetterSetter!("CalendarListEntry[]", "CalendarList")(ITEMS));

	/** ETag of the collection.*/
	private static const string ETAG = "etag";
	string _etag;
	mixin(GetterSetter!("string", "CalendarList")(ETAG));

}
