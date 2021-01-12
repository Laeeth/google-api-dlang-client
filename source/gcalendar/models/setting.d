module gcalendar.models.setting;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Setting {
	/** Type of the resource ("calendar#setting").*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "Setting")(KIND));

	/** Value of the user setting. The format of the value depends on the ID of the setting. It must always be a UTF-8 string of length up to 1024 characters.*/
	private static const string VALUE = "value";
	string _value;
	mixin(GetterSetter!("string", "Setting")(VALUE));

	/** The id of the user setting.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "Setting")(ID));

	/** ETag of the resource.*/
	private static const string ETAG = "etag";
	string _etag;
	mixin(GetterSetter!("string", "Setting")(ETAG));

}
