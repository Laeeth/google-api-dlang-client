module gdrive.models.drivelist;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct DriveList {
	/** Identifies what kind of resource this is. Value: the fixed string "drive#driveList".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "DriveList")(KIND));

	/** The page token for the next page of shared drives. This will be absent if the end of the list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results.*/
	private static const string NEXTPAGETOKEN = "nextPageToken";
	string _nextPageToken;
	mixin(GetterSetter!("string", "DriveList")(NEXTPAGETOKEN));

	/** The list of shared drives. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched.*/
	private static const string DRIVES = "drives";
	import gdrive.models.drive;
	Drive[] _drives;
	mixin(GetterSetter!("Drive[]", "DriveList")(DRIVES));

}
