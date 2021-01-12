module gcalendar.models.freebusycalendar;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct FreeBusyCalendar {
	/** List of time ranges during which this calendar should be regarded as busy.*/
	private static const string BUSY = "busy";
	import gcalendar.models.timeperiod;
	TimePeriod[] _busy;
	mixin(GetterSetter!("TimePeriod[]", "FreeBusyCalendar")(BUSY));

	/** Optional error(s) (if computation for the calendar failed).*/
	private static const string ERRORS = "errors";
	import gcalendar.models.error;
	@optional Error[] _errors;
	mixin(GetterSetter!("Error[]", "FreeBusyCalendar")(ERRORS));

}
