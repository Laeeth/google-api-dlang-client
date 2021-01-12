module gcalendar.models.calendarlistentry;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct CalendarListEntry {
	/** The notifications that the authenticated user is receiving for this calendar.*/
	private static const string NOTIFICATIONSETTINGS = "notificationSettings";
	public struct NotificationSettings {
		/** The list of notifications set for this calendar.*/
		private static const string NOTIFICATIONS = "notifications";
		import gcalendar.models.calendarnotification;
		CalendarNotification[] _notifications;
		mixin(GetterSetter!("CalendarNotification[]", "NotificationSettings")(NOTIFICATIONS));

	}

	/** The default reminders that the authenticated user has for this calendar.*/
	private static const string DEFAULTREMINDERS = "defaultReminders";
	import gcalendar.models.eventreminder;
	EventReminder[] _defaultReminders;
	mixin(GetterSetter!("EventReminder[]", "CalendarListEntry")(DEFAULTREMINDERS));

	/** Geographic location of the calendar as free-form text. Optional. Read-only.*/
	private static const string LOCATION = "location";
	@optional string _location;
	mixin(GetterSetter!("string", "CalendarListEntry")(LOCATION));

	/** Whether the calendar has been hidden from the list. Optional. The attribute is only returned when the calendar is hidden, in which case the value is true.*/
	private static const string HIDDEN = "hidden";
	@optional bool _hidden;
	mixin(GetterSetter!("bool", "CalendarListEntry")(HIDDEN));

	/** The color of the calendar. This is an ID referring to an entry in the calendar section of the colors definition (see the colors endpoint). This property is superseded by the backgroundColor and foregroundColor properties and can be ignored when using these properties. Optional.*/
	private static const string COLORID = "colorId";
	@optional string _colorId;
	mixin(GetterSetter!("string", "CalendarListEntry")(COLORID));

	/** The effective access role that the authenticated user has on the calendar. Read-only. Possible values are:  
- "freeBusyReader" - Provides read access to free/busy information. 
- "reader" - Provides read access to the calendar. Private events will appear to users with reader access, but event details will be hidden. 
- "writer" - Provides read and write access to the calendar. Private events will appear to users with writer access, and event details will be visible. 
- "owner" - Provides ownership of the calendar. This role has all of the permissions of the writer role with the additional ability to see and manipulate ACLs.*/
	private static const string ACCESSROLE = "accessRole";
	string _accessRole;
	mixin(GetterSetter!("string", "CalendarListEntry")(ACCESSROLE));

	/** Identifier of the calendar.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "CalendarListEntry")(ID));

	/** Type of the resource ("calendar#calendarListEntry").*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "CalendarListEntry")(KIND));

	/** The time zone of the calendar. Optional. Read-only.*/
	private static const string TIMEZONE = "timeZone";
	@optional string _timeZone;
	mixin(GetterSetter!("string", "CalendarListEntry")(TIMEZONE));

	/** Whether the calendar is the primary calendar of the authenticated user. Read-only. Optional. The default is False.*/
	private static const string PRIMARY = "primary";
	@optional bool _primary;
	mixin(GetterSetter!("bool", "CalendarListEntry")(PRIMARY));

	/** The summary that the authenticated user has set for this calendar. Optional.*/
	private static const string SUMMARYOVERRIDE = "summaryOverride";
	@optional string _summaryOverride;
	mixin(GetterSetter!("string", "CalendarListEntry")(SUMMARYOVERRIDE));

	/** The main color of the calendar in the hexadecimal format "#0088aa". This property supersedes the index-based colorId property. To set or change this property, you need to specify colorRgbFormat=true in the parameters of the insert, update and patch methods. Optional.*/
	private static const string BACKGROUNDCOLOR = "backgroundColor";
	@optional string _backgroundColor;
	mixin(GetterSetter!("string", "CalendarListEntry")(BACKGROUNDCOLOR));

	/** Conferencing properties for this calendar, for example what types of conferences are allowed.*/
	private static const string CONFERENCEPROPERTIES = "conferenceProperties";
	import gcalendar.models.conferenceproperties;
	ConferenceProperties _conferenceProperties;
	mixin(GetterSetter!("ConferenceProperties", "CalendarListEntry")(CONFERENCEPROPERTIES));

	/** Whether the calendar content shows up in the calendar UI. Optional. The default is False.*/
	private static const string SELECTED = "selected";
	@optional bool _selected;
	mixin(GetterSetter!("bool", "CalendarListEntry")(SELECTED));

	/** The foreground color of the calendar in the hexadecimal format "#ffffff". This property supersedes the index-based colorId property. To set or change this property, you need to specify colorRgbFormat=true in the parameters of the insert, update and patch methods. Optional.*/
	private static const string FOREGROUNDCOLOR = "foregroundColor";
	@optional string _foregroundColor;
	mixin(GetterSetter!("string", "CalendarListEntry")(FOREGROUNDCOLOR));

	/** Description of the calendar. Optional. Read-only.*/
	private static const string DESCRIPTION = "description";
	@optional string _description;
	mixin(GetterSetter!("string", "CalendarListEntry")(DESCRIPTION));

	/** Whether this calendar list entry has been deleted from the calendar list. Read-only. Optional. The default is False.*/
	private static const string DELETED = "deleted";
	@optional bool _deleted;
	mixin(GetterSetter!("bool", "CalendarListEntry")(DELETED));

	/** Title of the calendar. Read-only.*/
	private static const string SUMMARY = "summary";
	string _summary;
	mixin(GetterSetter!("string", "CalendarListEntry")(SUMMARY));

	/** ETag of the resource.*/
	private static const string ETAG = "etag";
	string _etag;
	mixin(GetterSetter!("string", "CalendarListEntry")(ETAG));

}
