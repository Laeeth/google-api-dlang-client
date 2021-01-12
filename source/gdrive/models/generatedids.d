module gdrive.models.generatedids;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct GeneratedIds {
	/** Identifies what kind of resource this is. Value: the fixed string "drive#generatedIds".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "GeneratedIds")(KIND));

	/** The type of file that can be created with these IDs.*/
	private static const string SPACE = "space";
	string _space;
	mixin(GetterSetter!("string", "GeneratedIds")(SPACE));

	/** The IDs generated for the requesting user in the specified space.*/
	private static const string IDS = "ids";
	string[] _ids;
	mixin(GetterSetter!("string[]", "GeneratedIds")(IDS));

}
