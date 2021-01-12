module gcalendar.models.colors;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Colors {
	/** Type of the resource ("calendar#colors").*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "Colors")(KIND));

	/** A global palette of event colors, mapping from the color ID to its definition. An event resource may refer to one of these color IDs in its color field. Read-only.*/
	private static const string EVENT = "event";

	/** Last modification time of the color palette (as a RFC3339 timestamp). Read-only.*/
	private static const string UPDATED = "updated";
	string _updated;
	mixin(GetterSetter!("string", "Colors")(UPDATED));

	/** A global palette of calendar colors, mapping from the color ID to its definition. A calendarListEntry resource refers to one of these color IDs in its color field. Read-only.*/
	private static const string CALENDAR = "calendar";

}
