module gdrive.models.changelist;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ChangeList {
	/** Identifies what kind of resource this is. Value: the fixed string "drive#changeList".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "ChangeList")(KIND));

	/** The starting page token for future changes. This will be present only if the end of the current changes list has been reached.*/
	private static const string NEWSTARTPAGETOKEN = "newStartPageToken";
	string _newStartPageToken;
	mixin(GetterSetter!("string", "ChangeList")(NEWSTARTPAGETOKEN));

	/** The list of changes. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched.*/
	private static const string CHANGES = "changes";
	import gdrive.models.change;
	Change[] _changes;
	mixin(GetterSetter!("Change[]", "ChangeList")(CHANGES));

	/** The page token for the next page of changes. This will be absent if the end of the changes list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results.*/
	private static const string NEXTPAGETOKEN = "nextPageToken";
	string _nextPageToken;
	mixin(GetterSetter!("string", "ChangeList")(NEXTPAGETOKEN));

}
