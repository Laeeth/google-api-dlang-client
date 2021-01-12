module gcalendar.models.conferencesolution;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ConferenceSolution {
	/** The key which can uniquely identify the conference solution for this event.*/
	private static const string KEY = "key";
	import gcalendar.models.conferencesolutionkey;
	ConferenceSolutionKey _key;
	mixin(GetterSetter!("ConferenceSolutionKey", "ConferenceSolution")(KEY));

	/** The user-visible name of this solution. Not localized.*/
	private static const string NAME = "name";
	string _name;
	mixin(GetterSetter!("string", "ConferenceSolution")(NAME));

	/** The user-visible icon for this solution.*/
	private static const string ICONURI = "iconUri";
	string _iconUri;
	mixin(GetterSetter!("string", "ConferenceSolution")(ICONURI));

}
