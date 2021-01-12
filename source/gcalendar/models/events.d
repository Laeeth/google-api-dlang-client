module gcalendar.models.events;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Events {
	/** The default reminders on the calendar for the authenticated user. These reminders apply to all events on this calendar that do not explicitly override them (i.e. do not have reminders.useDefault set to True).*/
	private static const string DEFAULTREMINDERS = "defaultReminders";
	import gcalendar.models.eventreminder;
	EventReminder[] _defaultReminders;
	mixin(GetterSetter!("EventReminder[]", "Events")(DEFAULTREMINDERS));

	/** The user's access role for this calendar. Read-only. Possible values are:  
- "none" - The user has no access. 
- "freeBusyReader" - The user has read access to free/busy information. 
- "reader" - The user has read access to the calendar. Private events will appear to users with reader access, but event details will be hidden. 
- "writer" - The user has read and write access to the calendar. Private events will appear to users with writer access, and event details will be visible. 
- "owner" - The user has ownership of the calendar. This role has all of the permissions of the writer role with the additional ability to see and manipulate ACLs.*/
	private static const string ACCESSROLE = "accessRole";
	string _accessRole;
	mixin(GetterSetter!("string", "Events")(ACCESSROLE));

	/** List of events on the calendar.*/
	private static const string ITEMS = "items";
	import gcalendar.models.event;
	Event[] _items;
	mixin(GetterSetter!("Event[]", "Events")(ITEMS));

	/** Type of the collection ("calendar#events").*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "Events")(KIND));

	/** The time zone of the calendar. Read-only.*/
	private static const string TIMEZONE = "timeZone";
	string _timeZone;
	mixin(GetterSetter!("string", "Events")(TIMEZONE));

	/** Token used to access the next page of this result. Omitted if no further results are available, in which case nextSyncToken is provided.*/
	private static const string NEXTPAGETOKEN = "nextPageToken";
	@optional string _nextPageToken;
	mixin(GetterSetter!("string", "Events")(NEXTPAGETOKEN));

	/** Token used at a later point in time to retrieve only the entries that have changed since this result was returned. Omitted if further results are available, in which case nextPageToken is provided.*/
	private static const string NEXTSYNCTOKEN = "nextSyncToken";
	@optional string _nextSyncToken;
	mixin(GetterSetter!("string", "Events")(NEXTSYNCTOKEN));

	/** Last modification time of the calendar (as a RFC3339 timestamp). Read-only.*/
	private static const string UPDATED = "updated";
	string _updated;
	mixin(GetterSetter!("string", "Events")(UPDATED));

	/** Description of the calendar. Read-only.*/
	private static const string DESCRIPTION = "description";
	string _description;
	mixin(GetterSetter!("string", "Events")(DESCRIPTION));

	/** Title of the calendar. Read-only.*/
	private static const string SUMMARY = "summary";
	string _summary;
	mixin(GetterSetter!("string", "Events")(SUMMARY));

	/** ETag of the collection.*/
	private static const string ETAG = "etag";
	string _etag;
	mixin(GetterSetter!("string", "Events")(ETAG));

}
