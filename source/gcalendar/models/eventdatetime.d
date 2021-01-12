module gcalendar.models.eventdatetime;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct EventDateTime {
	/** The time, as a combined date-time value (formatted according to RFC3339). A time zone offset is required unless a time zone is explicitly specified in timeZone.*/
	private static const string DATETIME = "dateTime";
	string _dateTime;
	mixin(GetterSetter!("string", "EventDateTime")(DATETIME));

	/** The time zone in which the time is specified. (Formatted as an IANA Time Zone Database name, e.g. "Europe/Zurich".) For recurring events this field is required and specifies the time zone in which the recurrence is expanded. For single events this field is optional and indicates a custom time zone for the event start/end.*/
	private static const string TIMEZONE = "timeZone";
	string _timeZone;
	mixin(GetterSetter!("string", "EventDateTime")(TIMEZONE));

	/** The date, in the format "yyyy-mm-dd", if this is an all-day event.*/
	private static const string DATE = "date";
	string _date;
	mixin(GetterSetter!("string", "EventDateTime")(DATE));

}
