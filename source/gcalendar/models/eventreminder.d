module gcalendar.models.eventreminder;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct EventReminder {
	/** Number of minutes before the start of the event when the reminder should trigger. Valid values are between 0 and 40320 (4 weeks in minutes).
Required when adding a reminder.*/
	private static const string MINUTES = "minutes";
	int _minutes;
	mixin(GetterSetter!("int", "EventReminder")(MINUTES));

	/** The method used by this reminder. Possible values are:  
- "email" - Reminders are sent via email. 
- "popup" - Reminders are sent via a UI popup.  
Required when adding a reminder.*/
	private static const string METHOD = "method";
	string _method;
	mixin(GetterSetter!("string", "EventReminder")(METHOD));

}
