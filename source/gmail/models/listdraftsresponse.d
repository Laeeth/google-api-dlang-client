module gmail.models.listdraftsresponse;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ListDraftsResponse {
	/** Token to retrieve the next page of results in the list.*/
	private static const string NEXTPAGETOKEN = "nextPageToken";
	string _nextPageToken;
	mixin(GetterSetter!("string", "ListDraftsResponse")(NEXTPAGETOKEN));

	/** Estimated total number of results.*/
	private static const string RESULTSIZEESTIMATE = "resultSizeEstimate";
	int _resultSizeEstimate;
	mixin(GetterSetter!("int", "ListDraftsResponse")(RESULTSIZEESTIMATE));

	/** List of drafts. Note that the `Message` property in each `Draft` resource only contains an `id` and a `threadId`. The messages.get method can fetch additional message details.*/
	private static const string DRAFTS = "drafts";
	import gmail.models.draft;
	Draft[] _drafts;
	mixin(GetterSetter!("Draft[]", "ListDraftsResponse")(DRAFTS));

}
