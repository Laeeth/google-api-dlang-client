module gcalendar.models.calendarnotification;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct CalendarNotification {
	/** The type of notification. Possible values are:  
- "eventCreation" - Notification sent when a new event is put on the calendar. 
- "eventChange" - Notification sent when an event is changed. 
- "eventCancellation" - Notification sent when an event is cancelled. 
- "eventResponse" - Notification sent when an attendee responds to the event invitation. 
- "agenda" - An agenda with the events of the day (sent out in the morning).  
Required when adding a notification.*/
	private static const string TYPE = "type";
	string _type;
	mixin(GetterSetter!("string", "CalendarNotification")(TYPE));

	/** The method used to deliver the notification. The possible value is:  
- "email" - Notifications are sent via email.  
Required when adding a notification.*/
	private static const string METHOD = "method";
	string _method;
	mixin(GetterSetter!("string", "CalendarNotification")(METHOD));

}
