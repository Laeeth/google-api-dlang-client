module gmail.models.historylabeladded;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct HistoryLabelAdded {
	/** Label IDs added to the message.*/
	private static const string LABELIDS = "labelIds";
	string[] _labelIds;
	mixin(GetterSetter!("string[]", "HistoryLabelAdded")(LABELIDS));

	private static const string MESSAGE = "message";
	import gmail.models.message;
	Message _message;
	mixin(GetterSetter!("Message", "HistoryLabelAdded")(MESSAGE));

}
