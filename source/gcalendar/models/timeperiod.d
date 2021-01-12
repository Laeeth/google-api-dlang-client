module gcalendar.models.timeperiod;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct TimePeriod {
	/** The (exclusive) end of the time period.*/
	private static const string END = "end";
	string _end;
	mixin(GetterSetter!("string", "TimePeriod")(END));

	/** The (inclusive) start of the time period.*/
	private static const string START = "start";
	string _start;
	mixin(GetterSetter!("string", "TimePeriod")(START));

}
