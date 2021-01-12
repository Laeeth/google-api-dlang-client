module gcalendar.models.conferencerequeststatus;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ConferenceRequestStatus {
	/** The current status of the conference create request. Read-only.
The possible values are:  
- "pending": the conference create request is still being processed.
- "success": the conference create request succeeded, the entry points are populated.
- "failure": the conference create request failed, there are no entry points.*/
	private static const string STATUSCODE = "statusCode";
	string _statusCode;
	mixin(GetterSetter!("string", "ConferenceRequestStatus")(STATUSCODE));

}
