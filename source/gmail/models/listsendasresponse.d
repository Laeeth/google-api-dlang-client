module gmail.models.listsendasresponse;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ListSendAsResponse {
	/** List of send-as aliases.*/
	private static const string SENDAS = "sendAs";
	import gmail.models.sendas;
	SendAs[] _sendAs;
	mixin(GetterSetter!("SendAs[]", "ListSendAsResponse")(SENDAS));

}
