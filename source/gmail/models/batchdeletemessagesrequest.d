module gmail.models.batchdeletemessagesrequest;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct BatchDeleteMessagesRequest {
	/** The IDs of the messages to delete.*/
	private static const string IDS = "ids";
	string[] _ids;
	mixin(GetterSetter!("string[]", "BatchDeleteMessagesRequest")(IDS));

}
