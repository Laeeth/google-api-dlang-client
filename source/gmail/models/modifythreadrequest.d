module gmail.models.modifythreadrequest;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ModifyThreadRequest {
	/** A list of IDs of labels to add to this thread.*/
	private static const string ADDLABELIDS = "addLabelIds";
	string[] _addLabelIds;
	mixin(GetterSetter!("string[]", "ModifyThreadRequest")(ADDLABELIDS));

	/** A list of IDs of labels to remove from this thread.*/
	private static const string REMOVELABELIDS = "removeLabelIds";
	string[] _removeLabelIds;
	mixin(GetterSetter!("string[]", "ModifyThreadRequest")(REMOVELABELIDS));

}
