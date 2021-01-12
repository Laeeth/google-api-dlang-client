module gdrive.models.change;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Change {
	/** Deprecated - use driveId instead.*/
	private static const string TEAMDRIVEID = "teamDriveId";
	string _teamDriveId;
	mixin(GetterSetter!("string", "Change")(TEAMDRIVEID));

	/** The time of this change (RFC 3339 date-time).*/
	private static const string TIME = "time";
	string _time;
	mixin(GetterSetter!("string", "Change")(TIME));

	/** Deprecated - use drive instead.*/
	private static const string TEAMDRIVE = "teamDrive";
	import gdrive.models.teamdrive;
	TeamDrive _teamDrive;
	mixin(GetterSetter!("TeamDrive", "Change")(TEAMDRIVE));

	/** Whether the file or shared drive has been removed from this list of changes, for example by deletion or loss of access.*/
	private static const string REMOVED = "removed";
	bool _removed;
	mixin(GetterSetter!("bool", "Change")(REMOVED));

	/** The ID of the shared drive associated with this change.*/
	private static const string DRIVEID = "driveId";
	string _driveId;
	mixin(GetterSetter!("string", "Change")(DRIVEID));

	/** Identifies what kind of resource this is. Value: the fixed string "drive#change".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "Change")(KIND));

	/** The ID of the file which has changed.*/
	private static const string FILEID = "fileId";
	string _fileId;
	mixin(GetterSetter!("string", "Change")(FILEID));

	/** The type of the change. Possible values are file and drive.*/
	private static const string CHANGETYPE = "changeType";
	string _changeType;
	mixin(GetterSetter!("string", "Change")(CHANGETYPE));

	/** The updated state of the shared drive. Present if the changeType is drive, the user is still a member of the shared drive, and the shared drive has not been deleted.*/
	private static const string DRIVE = "drive";
	import gdrive.models.drive;
	Drive _drive;
	mixin(GetterSetter!("Drive", "Change")(DRIVE));

	/** Deprecated - use changeType instead.*/
	private static const string TYPE = "type";
	string _type;
	mixin(GetterSetter!("string", "Change")(TYPE));

	/** The updated state of the file. Present if the type is file and the file has not been removed from this list of changes.*/
	private static const string FILE = "file";
	import gdrive.models.file;
	File _file;
	mixin(GetterSetter!("File", "Change")(FILE));

}
