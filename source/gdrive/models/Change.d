module gdrive.models.Change;

import gdrive.drive;
import std.json;
import std.datetime : SysTime;
import std.conv : to;
import std.typecons : Nullable, nullable;
import gdrive.models.File;
import gdrive.models.TeamDrive;
import gdrive.models.Drive;

public final struct Change {
    JSONValue container;
    alias container this;
    /**
    * The type of the change. Possible values are file and drive.
    * The value may be {@code null}.
    */
    private static const string CHANGE_TYPE = "changeType";
    /**
    * The updated state of the shared drive. Present if the changeType is drive, the user is still a
    * member of the shared drive, and the shared drive has not been deleted.
    * The value may be {@code null}.
    */
    private static const string DRIVE = "drive";
    /**
    * The ID of the shared drive associated with this change.
    * The value may be {@code null}.
    */
    private static const string DRIVE_ID = "driveId";
    /**
    * The updated state of the file. Present if the type is file and the file has not been removed
    * from this list of changes.
    * The value may be {@code null}.
    */
    private static const string FILE = "file";
    /**
    * The ID of the file which has changed.
    * The value may be {@code null}.
    */
    private static const string FILE_ID = "fileId";
    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#change".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";
    /**
    * Whether the file or shared drive has been removed from this list of changes, for example by
    * deletion or loss of access.
    * The value may be {@code null}.
    */
    private static const string REMOVED = "removed";
    /**
    * Deprecated - use drive instead.
    * The value may be {@code null}.
    */
    private static const string TEAM_DRIVE = "teamDrive";
    /**
    * Deprecated - use driveId instead.
    * The value may be {@code null}.
    */
    private static const string TEAM_DRIVE_ID = "teamDriveId";
    /**
    * The time of this change (RFC 3339 date-time).
    * The value may be {@code null}.
    */
    private static const string TIME = "time";
    /**
    * Deprecated - use changeType instead.
    * The value may be {@code null}.
    */
    private static const string TYPE = "type";
    /**
    * The type of the change. Possible values are file and drive.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(string, "Change")(CHANGE_TYPE));

    /**
    * The updated state of the shared drive. Present if the changeType is drive, the user is still a
    * member of the shared drive, and the shared drive has not been deleted.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterAgregateType!("gdrive.models.Drive.Drive", "Change")(DRIVE));

    /**
    * The ID of the shared drive associated with this change.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(string, "Change")(DRIVE_ID));

    /**
    * The updated state of the file. Present if the type is file and the file has not been removed
    * from this list of changes.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterAgregateType!("File", "Change")(FILE));

    /**
    * The ID of the file which has changed.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(string, "Change")(FILE_ID));

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#change".
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(string, "Change")(KIND));

    /**
    * Whether the file or shared drive has been removed from this list of changes, for example by
    * deletion or loss of access.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Change")(REMOVED));

    /**
    * Deprecated - use drive instead.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterAgregateType!("TeamDrive", "Change")(TEAM_DRIVE));

    /**
    * Deprecated - use driveId instead.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(string, "Change")(TEAM_DRIVE_ID));

    /**
    * The time of this change (RFC 3339 date-time).
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(SysTime, "Change")(TIME));

    /**
    * Deprecated - use changeType instead.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(string, "Change")(TYPE));
}