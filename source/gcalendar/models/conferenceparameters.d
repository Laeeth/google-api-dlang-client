module gcalendar.models.conferenceparameters;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ConferenceParameters {
	/** Additional add-on specific data.*/
	private static const string ADDONPARAMETERS = "addOnParameters";
	import gcalendar.models.conferenceparametersaddonparameters;
	ConferenceParametersAddOnParameters _addOnParameters;
	mixin(GetterSetter!("ConferenceParametersAddOnParameters", "ConferenceParameters")(ADDONPARAMETERS));

}
