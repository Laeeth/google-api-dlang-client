module gmail.models.watchresponse;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct WatchResponse {
	/** The ID of the mailbox's current history record.*/
	private static const string HISTORYID = "historyId";
	string _historyId;
	mixin(GetterSetter!("string", "WatchResponse")(HISTORYID));

	/** When Gmail will stop sending notifications for mailbox updates (epoch millis). Call `watch` again before this time to renew the watch.*/
	private static const string EXPIRATION = "expiration";
	string _expiration;
	mixin(GetterSetter!("string", "WatchResponse")(EXPIRATION));

}
