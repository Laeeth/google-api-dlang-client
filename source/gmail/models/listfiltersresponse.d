module gmail.models.listfiltersresponse;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ListFiltersResponse {
	/** List of a user's filters.*/
	private static const string FILTER = "filter";
	import gmail.models.filter;
	Filter[] _filter;
	mixin(GetterSetter!("Filter[]", "ListFiltersResponse")(FILTER));

}
