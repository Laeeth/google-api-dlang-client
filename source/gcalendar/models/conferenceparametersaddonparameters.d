module gcalendar.models.conferenceparametersaddonparameters;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ConferenceParametersAddOnParameters {
	private static const string PARAMETERS = "parameters";
	string[string] _parameters;
	mixin(GetterSetter!("string[string]", "ConferenceParametersAddOnParameters")(PARAMETERS));

}
