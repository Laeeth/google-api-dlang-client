module gcalendar.models.error;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Error {
	/** Specific reason for the error. Some of the possible values are:  
- "groupTooBig" - The group of users requested is too large for a single query. 
- "tooManyCalendarsRequested" - The number of calendars requested is too large for a single query. 
- "notFound" - The requested resource was not found. 
- "internalError" - The API service has encountered an internal error.  Additional error types may be added in the future, so clients should gracefully handle additional error statuses not included in this list.*/
	private static const string REASON = "reason";
	string _reason;
	mixin(GetterSetter!("string", "Error")(REASON));

	/** Domain, or broad category, of the error.*/
	private static const string DOMAIN = "domain";
	string _domain;
	mixin(GetterSetter!("string", "Error")(DOMAIN));

}
