module gcalendar.models.conferenceproperties;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ConferenceProperties {
	/** The types of conference solutions that are supported for this calendar.
The possible values are:  
- "eventHangout" 
- "eventNamedHangout" 
- "hangoutsMeet"  Optional.*/
	private static const string ALLOWEDCONFERENCESOLUTIONTYPES = "allowedConferenceSolutionTypes";
	@optional string[] _allowedConferenceSolutionTypes;
	mixin(GetterSetter!("string[]", "ConferenceProperties")(ALLOWEDCONFERENCESOLUTIONTYPES));

}
