module gcalendar.models.conferencedata;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ConferenceData {
	/** The signature of the conference data.
Generated on server side. Must be preserved while copying the conference data between events, otherwise the conference data will not be copied.
Unset for a conference with a failed create request.
Optional for a conference with a pending create request.*/
	private static const string SIGNATURE = "signature";
	@optional string _signature;
	mixin(GetterSetter!("string", "ConferenceData")(SIGNATURE));

	/** Additional properties related to a conference. An example would be a solution-specific setting for enabling video streaming.*/
	private static const string PARAMETERS = "parameters";
	import gcalendar.models.conferenceparameters;
	ConferenceParameters _parameters;
	mixin(GetterSetter!("ConferenceParameters", "ConferenceData")(PARAMETERS));

	/** Additional notes (such as instructions from the domain administrator, legal notices) to display to the user. Can contain HTML. The maximum length is 2048 characters. Optional.*/
	private static const string NOTES = "notes";
	@optional string _notes;
	mixin(GetterSetter!("string", "ConferenceData")(NOTES));

	/** The conference solution, such as Hangouts or Google Meet.
Unset for a conference with a failed create request.
Either conferenceSolution and at least one entryPoint, or createRequest is required.*/
	private static const string CONFERENCESOLUTION = "conferenceSolution";
	import gcalendar.models.conferencesolution;
	ConferenceSolution _conferenceSolution;
	mixin(GetterSetter!("ConferenceSolution", "ConferenceData")(CONFERENCESOLUTION));

	/** Information about individual conference entry points, such as URLs or phone numbers.
All of them must belong to the same conference.
Either conferenceSolution and at least one entryPoint, or createRequest is required.*/
	private static const string ENTRYPOINTS = "entryPoints";
	import gcalendar.models.entrypoint;
	EntryPoint[] _entryPoints;
	mixin(GetterSetter!("EntryPoint[]", "ConferenceData")(ENTRYPOINTS));

	/** A request to generate a new conference and attach it to the event. The data is generated asynchronously. To see whether the data is present check the status field.
Either conferenceSolution and at least one entryPoint, or createRequest is required.*/
	private static const string CREATEREQUEST = "createRequest";
	import gcalendar.models.createconferencerequest;
	CreateConferenceRequest _createRequest;
	mixin(GetterSetter!("CreateConferenceRequest", "ConferenceData")(CREATEREQUEST));

	/** The ID of the conference.
Can be used by developers to keep track of conferences, should not be displayed to users.
Values for solution types:  
- "eventHangout": unset.
- "eventNamedHangout": the name of the Hangout.
- "hangoutsMeet": the 10-letter meeting code, for example "aaa-bbbb-ccc".
- "addOn": defined by 3P conference provider.  Optional.*/
	private static const string CONFERENCEID = "conferenceId";
	@optional string _conferenceId;
	mixin(GetterSetter!("string", "ConferenceData")(CONFERENCEID));

}
