module gdrive.models.revisionlist;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct RevisionList {
	/** Identifies what kind of resource this is. Value: the fixed string "drive#revisionList".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "RevisionList")(KIND));

	/** The list of revisions. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched.*/
	private static const string REVISIONS = "revisions";
	import gdrive.models.revision;
	Revision[] _revisions;
	mixin(GetterSetter!("Revision[]", "RevisionList")(REVISIONS));

	/** The page token for the next page of revisions. This will be absent if the end of the revisions list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results.*/
	private static const string NEXTPAGETOKEN = "nextPageToken";
	string _nextPageToken;
	mixin(GetterSetter!("string", "RevisionList")(NEXTPAGETOKEN));

}
