module gmail.models.batchmodifymessagesrequest;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct BatchModifyMessagesRequest {
	/** A list of label IDs to add to messages.*/
	private static const string ADDLABELIDS = "addLabelIds";
	string[] _addLabelIds;
	mixin(GetterSetter!("string[]", "BatchModifyMessagesRequest")(ADDLABELIDS));

	/** A list of label IDs to remove from messages.*/
	private static const string REMOVELABELIDS = "removeLabelIds";
	string[] _removeLabelIds;
	mixin(GetterSetter!("string[]", "BatchModifyMessagesRequest")(REMOVELABELIDS));

	/** The IDs of the messages to modify. There is a limit of 1000 ids per request.*/
	private static const string IDS = "ids";
	string[] _ids;
	mixin(GetterSetter!("string[]", "BatchModifyMessagesRequest")(IDS));

}
