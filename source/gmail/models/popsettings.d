module gmail.models.popsettings;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct PopSettings {
	/** The action that will be executed on a message after it has been fetched via POP.*/
	private static const string DISPOSITION = "disposition";
	string _disposition;
	mixin(GetterSetter!("string", "PopSettings")(DISPOSITION));

	/** The range of messages which are accessible via POP.*/
	private static const string ACCESSWINDOW = "accessWindow";
	string _accessWindow;
	mixin(GetterSetter!("string", "PopSettings")(ACCESSWINDOW));

}
