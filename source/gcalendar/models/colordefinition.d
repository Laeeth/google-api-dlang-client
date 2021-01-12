module gcalendar.models.colordefinition;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ColorDefinition {
	/** The foreground color that can be used to write on top of a background with 'background' color.*/
	private static const string FOREGROUND = "foreground";
	string _foreground;
	mixin(GetterSetter!("string", "ColorDefinition")(FOREGROUND));

	/** The background color associated with this color definition.*/
	private static const string BACKGROUND = "background";
	string _background;
	mixin(GetterSetter!("string", "ColorDefinition")(BACKGROUND));

}
