module gdrive.models.about;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct About {
	/** Whether the user can create shared drives.*/
	private static const string CANCREATEDRIVES = "canCreateDrives";
	bool _canCreateDrives;
	mixin(GetterSetter!("bool", "About")(CANCREATEDRIVES));

	/** Identifies what kind of resource this is. Value: the fixed string "drive#about".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "About")(KIND));

	/** A map of source MIME type to possible targets for all supported imports.*/
	private static const string IMPORTFORMATS = "importFormats";
	string[][string] _importFormats;
	mixin(GetterSetter!("string[][string]", "About")(IMPORTFORMATS));

	/** Deprecated - use canCreateDrives instead.*/
	private static const string CANCREATETEAMDRIVES = "canCreateTeamDrives";
	bool _canCreateTeamDrives;
	mixin(GetterSetter!("bool", "About")(CANCREATETEAMDRIVES));

	/** The authenticated user.*/
	private static const string USER = "user";
	import gdrive.models.user;
	User _user;
	mixin(GetterSetter!("User", "About")(USER));

	/** A list of themes that are supported for shared drives.*/
	private static const string DRIVETHEMES = "driveThemes";
	public struct DriveThemes {
		/** A link to this theme's background image.*/
		private static const string BACKGROUNDIMAGELINK = "backgroundImageLink";
		string _backgroundImageLink;
		mixin(GetterSetter!("string", "DriveThemes")(BACKGROUNDIMAGELINK));

		/** The color of this theme as an RGB hex string.*/
		private static const string COLORRGB = "colorRgb";
		string _colorRgb;
		mixin(GetterSetter!("string", "DriveThemes")(COLORRGB));

		/** The ID of the theme.*/
		private static const string ID = "id";
		string _id;
		mixin(GetterSetter!("string", "DriveThemes")(ID));

	}
	DriveThemes[] _driveThemes;
	mixin(GetterSetter!("DriveThemes[]", "About")(DRIVETHEMES));

	/** A map of maximum import sizes by MIME type, in bytes.*/
	private static const string MAXIMPORTSIZES = "maxImportSizes";
	string[string] _maxImportSizes;
	mixin(GetterSetter!("string[string]", "About")(MAXIMPORTSIZES));

	/** A map of source MIME type to possible targets for all supported exports.*/
	private static const string EXPORTFORMATS = "exportFormats";
	string[][string] _exportFormats;
	mixin(GetterSetter!("string[][string]", "About")(EXPORTFORMATS));

	/** The currently supported folder colors as RGB hex strings.*/
	private static const string FOLDERCOLORPALETTE = "folderColorPalette";
	string[] _folderColorPalette;
	mixin(GetterSetter!("string[]", "About")(FOLDERCOLORPALETTE));

	/** The maximum upload size in bytes.*/
	private static const string MAXUPLOADSIZE = "maxUploadSize";
	string _maxUploadSize;
	mixin(GetterSetter!("string", "About")(MAXUPLOADSIZE));

	/** Whether the user has installed the requesting app.*/
	private static const string APPINSTALLED = "appInstalled";
	bool _appInstalled;
	mixin(GetterSetter!("bool", "About")(APPINSTALLED));

	/** The user's storage quota limits and usage. All fields are measured in bytes.*/
	private static const string STORAGEQUOTA = "storageQuota";
	public struct StorageQuota {
		/** The usage limit, if applicable. This will not be present if the user has unlimited storage.*/
		private static const string LIMIT = "limit";
		string _limit;
		mixin(GetterSetter!("string", "StorageQuota")(LIMIT));

		/** The usage by trashed files in Google Drive.*/
		private static const string USAGEINDRIVETRASH = "usageInDriveTrash";
		string _usageInDriveTrash;
		mixin(GetterSetter!("string", "StorageQuota")(USAGEINDRIVETRASH));

		/** The total usage across all services.*/
		private static const string USAGE = "usage";
		string _usage;
		mixin(GetterSetter!("string", "StorageQuota")(USAGE));

		/** The usage by all files in Google Drive.*/
		private static const string USAGEINDRIVE = "usageInDrive";
		string _usageInDrive;
		mixin(GetterSetter!("string", "StorageQuota")(USAGEINDRIVE));

	}

	/** Deprecated - use driveThemes instead.*/
	private static const string TEAMDRIVETHEMES = "teamDriveThemes";
	public struct TeamDriveThemes {
		/** Deprecated - use driveThemes/backgroundImageLink instead.*/
		private static const string BACKGROUNDIMAGELINK = "backgroundImageLink";
		string _backgroundImageLink;
		mixin(GetterSetter!("string", "TeamDriveThemes")(BACKGROUNDIMAGELINK));

		/** Deprecated - use driveThemes/colorRgb instead.*/
		private static const string COLORRGB = "colorRgb";
		string _colorRgb;
		mixin(GetterSetter!("string", "TeamDriveThemes")(COLORRGB));

		/** Deprecated - use driveThemes/id instead.*/
		private static const string ID = "id";
		string _id;
		mixin(GetterSetter!("string", "TeamDriveThemes")(ID));

	}
	TeamDriveThemes[] _teamDriveThemes;
	mixin(GetterSetter!("TeamDriveThemes[]", "About")(TEAMDRIVETHEMES));

}
