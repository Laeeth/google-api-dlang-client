module gmail.models.historylabelremoved;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct HistoryLabelRemoved {
	/** Label IDs removed from the message.*/
	private static const string LABELIDS = "labelIds";
	string[] _labelIds;
	mixin(GetterSetter!("string[]", "HistoryLabelRemoved")(LABELIDS));

	private static const string MESSAGE = "message";
	import gmail.models.message;
	Message _message;
	mixin(GetterSetter!("Message", "HistoryLabelRemoved")(MESSAGE));

}
