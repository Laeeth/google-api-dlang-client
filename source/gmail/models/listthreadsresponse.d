module gmail.models.listthreadsresponse;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ListThreadsResponse {
	/** List of threads. Note that each thread resource does not contain a list of `messages`. The list of `messages` for a given thread can be fetched using the threads.get method.*/
	private static const string THREADS = "threads";
	import gmail.models.thread;
	Thread[] _threads;
	mixin(GetterSetter!("Thread[]", "ListThreadsResponse")(THREADS));

	/** Page token to retrieve the next page of results in the list.*/
	private static const string NEXTPAGETOKEN = "nextPageToken";
	string _nextPageToken;
	mixin(GetterSetter!("string", "ListThreadsResponse")(NEXTPAGETOKEN));

	/** Estimated total number of results.*/
	private static const string RESULTSIZEESTIMATE = "resultSizeEstimate";
	int _resultSizeEstimate;
	mixin(GetterSetter!("int", "ListThreadsResponse")(RESULTSIZEESTIMATE));

}
