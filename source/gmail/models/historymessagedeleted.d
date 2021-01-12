module gmail.models.historymessagedeleted;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct HistoryMessageDeleted {
	private static const string MESSAGE = "message";
	import gmail.models.message;
	Message _message;
	mixin(GetterSetter!("Message", "HistoryMessageDeleted")(MESSAGE));

}
