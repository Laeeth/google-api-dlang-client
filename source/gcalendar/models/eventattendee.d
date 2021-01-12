module gcalendar.models.eventattendee;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct EventAttendee {
	/** The attendee's email address, if available. This field must be present when adding an attendee. It must be a valid email address as per RFC5322.
Required when adding an attendee.*/
	private static const string EMAIL = "email";
	@optional string _email;
	mixin(GetterSetter!("string", "EventAttendee")(EMAIL));

	/** Number of additional guests. Optional. The default is 0.*/
	private static const string ADDITIONALGUESTS = "additionalGuests";
	@optional int _additionalGuests;
	mixin(GetterSetter!("int", "EventAttendee")(ADDITIONALGUESTS));

	/** The attendee's Profile ID, if available. It corresponds to the id field in the People collection of the Google+ API*/
	private static const string ID = "id";
	@optional string _id;
	mixin(GetterSetter!("string", "EventAttendee")(ID));

	/** Whether this entry represents the calendar on which this copy of the event appears. Read-only. The default is False.*/
	private static const string SELF = "self";
	bool _self;
	mixin(GetterSetter!("bool", "EventAttendee")(SELF));

	/** Whether the attendee is the organizer of the event. Read-only. The default is False.*/
	private static const string ORGANIZER = "organizer";
	bool _organizer;
	mixin(GetterSetter!("bool", "EventAttendee")(ORGANIZER));

	/** The attendee's name, if available. Optional.*/
	private static const string DISPLAYNAME = "displayName";
	@optional string _displayName;
	mixin(GetterSetter!("string", "EventAttendee")(DISPLAYNAME));

	/** The attendee's response status. Possible values are:  
- "needsAction" - The attendee has not responded to the invitation. 
- "declined" - The attendee has declined the invitation. 
- "tentative" - The attendee has tentatively accepted the invitation. 
- "accepted" - The attendee has accepted the invitation.*/
	private static const string RESPONSESTATUS = "responseStatus";
	string _responseStatus;
	mixin(GetterSetter!("string", "EventAttendee")(RESPONSESTATUS));

	/** Whether this is an optional attendee. Optional. The default is False.*/
	private static const string OPTIONAL = "optional";
	@optional bool _optional;
	mixin(GetterSetter!("bool", "EventAttendee")(OPTIONAL));

	/** Whether the attendee is a resource. Can only be set when the attendee is added to the event for the first time. Subsequent modifications are ignored. Optional. The default is False.*/
	private static const string RESOURCE = "resource";
	@optional bool _resource;
	mixin(GetterSetter!("bool", "EventAttendee")(RESOURCE));

	/** The attendee's response comment. Optional.*/
	private static const string COMMENT = "comment";
	@optional string _comment;
	mixin(GetterSetter!("string", "EventAttendee")(COMMENT));

}
