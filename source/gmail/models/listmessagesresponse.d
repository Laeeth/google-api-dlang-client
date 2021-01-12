module gmail.models.listmessagesresponse;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ListMessagesResponse {
	/** Token to retrieve the next page of results in the list.*/
	private static const string NEXTPAGETOKEN = "nextPageToken";
	string _nextPageToken;
	mixin(GetterSetter!("string", "ListMessagesResponse")(NEXTPAGETOKEN));

	/** List of messages. Note that each message resource contains only an `id` and a `threadId`. Additional message details can be fetched using the messages.get method.*/
	private static const string MESSAGES = "messages";
	import gmail.models.message;
	Message[] _messages;
	mixin(GetterSetter!("Message[]", "ListMessagesResponse")(MESSAGES));

	/** Estimated total number of results.*/
	private static const string RESULTSIZEESTIMATE = "resultSizeEstimate";
	int _resultSizeEstimate;
	mixin(GetterSetter!("int", "ListMessagesResponse")(RESULTSIZEESTIMATE));

}
