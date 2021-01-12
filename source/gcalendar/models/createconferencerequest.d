module gcalendar.models.createconferencerequest;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct CreateConferenceRequest {
	/** The conference solution, such as Hangouts or Google Meet.*/
	private static const string CONFERENCESOLUTIONKEY = "conferenceSolutionKey";
	import gcalendar.models.conferencesolutionkey;
	ConferenceSolutionKey _conferenceSolutionKey;
	mixin(GetterSetter!("ConferenceSolutionKey", "CreateConferenceRequest")(CONFERENCESOLUTIONKEY));

	/** The status of the conference create request.*/
	private static const string STATUS = "status";
	import gcalendar.models.conferencerequeststatus;
	ConferenceRequestStatus _status;
	mixin(GetterSetter!("ConferenceRequestStatus", "CreateConferenceRequest")(STATUS));

	/** The client-generated unique ID for this request.
Clients should regenerate this ID for every new request. If an ID provided is the same as for the previous request, the request is ignored.*/
	private static const string REQUESTID = "requestId";
	string _requestId;
	mixin(GetterSetter!("string", "CreateConferenceRequest")(REQUESTID));

}
