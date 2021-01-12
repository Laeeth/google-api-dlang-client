module gdrive.models.replylist;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ReplyList {
	/** Identifies what kind of resource this is. Value: the fixed string "drive#replyList".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "ReplyList")(KIND));

	/** The list of replies. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched.*/
	private static const string REPLIES = "replies";
	import gdrive.models.reply;
	Reply[] _replies;
	mixin(GetterSetter!("Reply[]", "ReplyList")(REPLIES));

	/** The page token for the next page of replies. This will be absent if the end of the replies list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results.*/
	private static const string NEXTPAGETOKEN = "nextPageToken";
	string _nextPageToken;
	mixin(GetterSetter!("string", "ReplyList")(NEXTPAGETOKEN));

}
