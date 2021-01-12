module gdrive.models.commentlist;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct CommentList {
	/** Identifies what kind of resource this is. Value: the fixed string "drive#commentList".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "CommentList")(KIND));

	/** The page token for the next page of comments. This will be absent if the end of the comments list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results.*/
	private static const string NEXTPAGETOKEN = "nextPageToken";
	string _nextPageToken;
	mixin(GetterSetter!("string", "CommentList")(NEXTPAGETOKEN));

	/** The list of comments. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched.*/
	private static const string COMMENTS = "comments";
	import gdrive.models.comment;
	Comment[] _comments;
	mixin(GetterSetter!("Comment[]", "CommentList")(COMMENTS));

}
