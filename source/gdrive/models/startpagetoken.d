module gdrive.models.startpagetoken;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct StartPageToken {
	/** Identifies what kind of resource this is. Value: the fixed string "drive#startPageToken".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "StartPageToken")(KIND));

	/** The starting page token for listing changes.*/
	private static const string STARTPAGETOKEN = "startPageToken";
	string _startPageToken;
	mixin(GetterSetter!("string", "StartPageToken")(STARTPAGETOKEN));

}
