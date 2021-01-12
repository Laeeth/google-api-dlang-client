module gmail.models.listsmimeinforesponse;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ListSmimeInfoResponse {
	/** List of SmimeInfo.*/
	private static const string SMIMEINFO = "smimeInfo";
	import gmail.models.smimeinfo;
	SmimeInfo[] _smimeInfo;
	mixin(GetterSetter!("SmimeInfo[]", "ListSmimeInfoResponse")(SMIMEINFO));

}
