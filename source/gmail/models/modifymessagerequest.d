module gmail.models.modifymessagerequest;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ModifyMessageRequest {
	/** A list of IDs of labels to add to this message.*/
	private static const string ADDLABELIDS = "addLabelIds";
	string[] _addLabelIds;
	mixin(GetterSetter!("string[]", "ModifyMessageRequest")(ADDLABELIDS));

	/** A list IDs of labels to remove from this message.*/
	private static const string REMOVELABELIDS = "removeLabelIds";
	string[] _removeLabelIds;
	mixin(GetterSetter!("string[]", "ModifyMessageRequest")(REMOVELABELIDS));

}
