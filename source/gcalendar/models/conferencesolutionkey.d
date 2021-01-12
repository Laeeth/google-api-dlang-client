module gcalendar.models.conferencesolutionkey;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ConferenceSolutionKey {
	/** The conference solution type.
If a client encounters an unfamiliar or empty type, it should still be able to display the entry points. However, it should disallow modifications.
The possible values are:  
- "eventHangout" for Hangouts for consumers (http://hangouts.google.com)
- "eventNamedHangout" for classic Hangouts for Google Workspace users (http://hangouts.google.com)
- "hangoutsMeet" for Google Meet (http://meet.google.com)
- "addOn" for 3P conference providers*/
	private static const string TYPE = "type";
	string _type;
	mixin(GetterSetter!("string", "ConferenceSolutionKey")(TYPE));

}
