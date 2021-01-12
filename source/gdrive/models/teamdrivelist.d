module gdrive.models.teamdrivelist;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct TeamDriveList {
	/** Identifies what kind of resource this is. Value: the fixed string "drive#teamDriveList".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "TeamDriveList")(KIND));

	/** The page token for the next page of Team Drives. This will be absent if the end of the Team Drives list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results.*/
	private static const string NEXTPAGETOKEN = "nextPageToken";
	string _nextPageToken;
	mixin(GetterSetter!("string", "TeamDriveList")(NEXTPAGETOKEN));

	/** The list of Team Drives. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched.*/
	private static const string TEAMDRIVES = "teamDrives";
	import gdrive.models.teamdrive;
	TeamDrive[] _teamDrives;
	mixin(GetterSetter!("TeamDrive[]", "TeamDriveList")(TEAMDRIVES));

}
