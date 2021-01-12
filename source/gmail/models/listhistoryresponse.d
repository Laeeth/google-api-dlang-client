module gmail.models.listhistoryresponse;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ListHistoryResponse {
	/** The ID of the mailbox's current history record.*/
	private static const string HISTORYID = "historyId";
	string _historyId;
	mixin(GetterSetter!("string", "ListHistoryResponse")(HISTORYID));

	/** Page token to retrieve the next page of results in the list.*/
	private static const string NEXTPAGETOKEN = "nextPageToken";
	string _nextPageToken;
	mixin(GetterSetter!("string", "ListHistoryResponse")(NEXTPAGETOKEN));

	/** List of history records. Any `messages` contained in the response will typically only have `id` and `threadId` fields populated.*/
	private static const string HISTORY = "history";
	import gmail.models.history;
	History[] _history;
	mixin(GetterSetter!("History[]", "ListHistoryResponse")(HISTORY));

}
