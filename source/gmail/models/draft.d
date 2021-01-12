module gmail.models.draft;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Draft {
	/** The immutable ID of the draft.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "Draft")(ID));

	/** The message content of the draft.*/
	private static const string MESSAGE = "message";
	import gmail.models.message;
	Message _message;
	mixin(GetterSetter!("Message", "Draft")(MESSAGE));

}
