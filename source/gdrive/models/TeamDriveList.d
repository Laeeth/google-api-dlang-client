module gdrive.models.teamdrivelist;

import gdrive.drive;
import gdrive.models.TeamDrive;
import std.json;
import std.typecons : Nullable, nullable;
import std.conv : to;
import std.datetime : SysTime;

public final struct TeamDriveList {
    JSONValue container;
    alias container this;

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#teamDriveList".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";

    /**
    * The page token for the next page of Team Drives. This will be absent if the end of the Team
    * Drives list has been reached. If the token is rejected for any reason, it should be discarded,
    * and pagination should be restarted from the first page of results.
    * The value may be {@code null}.
    */
    private static const string NEXT_PAGE_TOKEN = "nextPageToken";    

    /**
    * The list of Team Drives. If nextPageToken is populated, then this list may be incomplete and an
    * additional page of results should be fetched.
    * The value may be {@code null}.
    */
    private static const string TEAM_DRIVES = "teamDrives";    

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#teamDriveList".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "TeamDriveList")(KIND));

    /**
    * The page token for the next page of Team Drives. This will be absent if the end of the Team
    * Drives list has been reached. If the token is rejected for any reason, it should be discarded,
    * and pagination should be restarted from the first page of results.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "TeamDriveList")(NEXT_PAGE_TOKEN));

    /**
    * The list of Team Drives. If nextPageToken is populated, then this list may be incomplete and an
    * additional page of results should be fetched.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("TeamDrive", "TeamDriveList")(TEAM_DRIVES));
}

