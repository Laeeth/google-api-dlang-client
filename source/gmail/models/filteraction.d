module gmail.models.filteraction;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct FilterAction {
	/** Email address that the message should be forwarded to.*/
	private static const string FORWARD = "forward";
	string _forward;
	mixin(GetterSetter!("string", "FilterAction")(FORWARD));

	/** List of labels to add to the message.*/
	private static const string ADDLABELIDS = "addLabelIds";
	string[] _addLabelIds;
	mixin(GetterSetter!("string[]", "FilterAction")(ADDLABELIDS));

	/** List of labels to remove from the message.*/
	private static const string REMOVELABELIDS = "removeLabelIds";
	string[] _removeLabelIds;
	mixin(GetterSetter!("string[]", "FilterAction")(REMOVELABELIDS));

}
