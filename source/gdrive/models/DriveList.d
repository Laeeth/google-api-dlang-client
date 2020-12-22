module gdrive.models.drivelist;

import gdrive.models.Drive;
import gdrive.drive;
import std.json;
import std.typecons : Nullable, nullable;
import std.conv : to;
import std.datetime : SysTime;

public final struct DriveList {
    JSONValue container;
    alias container this;

    /**
    * The list of shared drives. If nextPageToken is populated, then this list may be incomplete and
    * an additional page of results should be fetched.
    * The value may be {@code null}.
    */
    private static const string DRIVES = "drives";

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#driveList".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";

    /**
    * The page token for the next page of shared drives. This will be absent if the end of the list
    * has been reached. If the token is rejected for any reason, it should be discarded, and
    * pagination should be restarted from the first page of results.
    * The value may be {@code null}.
    */
    private static const string NEXT_PAGE_TOKEN = "nextPageToken";

    /**
    * The list of shared drives. If nextPageToken is populated, then this list may be incomplete and
    * an additional page of results should be fetched.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterAgregateType!("gdrive.models.Drive.Drive[]", "DriveList")(DRIVES));

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#driveList".
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(string, "DriveList")(KIND));

    /**
    * The page token for the next page of shared drives. This will be absent if the end of the list
    * has been reached. If the token is rejected for any reason, it should be discarded, and
    * pagination should be restarted from the first page of results.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(string, "DriveList")(NEXT_PAGE_TOKEN));
}
