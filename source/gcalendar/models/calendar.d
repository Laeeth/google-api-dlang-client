module gcalendar.models.calendar;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Calendar {
	/** Geographic location of the calendar as free-form text. Optional.*/
	private static const string LOCATION = "location";
	@optional string _location;
	mixin(GetterSetter!("string", "Calendar")(LOCATION));

	/** Identifier of the calendar. To retrieve IDs call the calendarList.list() method.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "Calendar")(ID));

	/** Type of the resource ("calendar#calendar").*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "Calendar")(KIND));

	/** The time zone of the calendar. (Formatted as an IANA Time Zone Database name, e.g. "Europe/Zurich".) Optional.*/
	private static const string TIMEZONE = "timeZone";
	@optional string _timeZone;
	mixin(GetterSetter!("string", "Calendar")(TIMEZONE));

	/** Conferencing properties for this calendar, for example what types of conferences are allowed.*/
	private static const string CONFERENCEPROPERTIES = "conferenceProperties";
	import gcalendar.models.conferenceproperties;
	ConferenceProperties _conferenceProperties;
	mixin(GetterSetter!("ConferenceProperties", "Calendar")(CONFERENCEPROPERTIES));

	/** Description of the calendar. Optional.*/
	private static const string DESCRIPTION = "description";
	@optional string _description;
	mixin(GetterSetter!("string", "Calendar")(DESCRIPTION));

	/** Title of the calendar.*/
	private static const string SUMMARY = "summary";
	string _summary;
	mixin(GetterSetter!("string", "Calendar")(SUMMARY));

	/** ETag of the resource.*/
	private static const string ETAG = "etag";
	string _etag;
	mixin(GetterSetter!("string", "Calendar")(ETAG));

}
