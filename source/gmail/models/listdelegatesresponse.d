module gmail.models.listdelegatesresponse;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ListDelegatesResponse {
	/** List of the user's delegates (with any verification status). If an account doesn't have delegates, this field doesn't appear.*/
	private static const string DELEGATES = "delegates";
	import gmail.models.delegate;
	Delegate[] _delegates;
	mixin(GetterSetter!("Delegate[]", "ListDelegatesResponse")(DELEGATES));

}
