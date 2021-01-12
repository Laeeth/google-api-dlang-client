module gmail.models.filter;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Filter {
	/** Matching criteria for the filter.*/
	private static const string CRITERIA = "criteria";
	import gmail.models.filtercriteria;
	FilterCriteria _criteria;
	mixin(GetterSetter!("FilterCriteria", "Filter")(CRITERIA));

	/** Action that the filter performs.*/
	private static const string ACTION = "action";
	import gmail.models.filteraction;
	FilterAction _action;
	mixin(GetterSetter!("FilterAction", "Filter")(ACTION));

	/** The server assigned ID of the filter.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "Filter")(ID));

}
