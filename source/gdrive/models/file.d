module gdrive.models.file;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct File {
	/** Deprecated - use driveId instead.*/
	private static const string TEAMDRIVEID = "teamDriveId";
	string _teamDriveId;
	mixin(GetterSetter!("string", "File")(TEAMDRIVEID));

	/** Links for exporting Docs Editors files to specific formats.*/
	private static const string EXPORTLINKS = "exportLinks";
	string[string] _exportLinks;
	mixin(GetterSetter!("string[string]", "File")(EXPORTLINKS));

	/** The ID of the file.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "File")(ID));

	/** The time that the item was trashed (RFC 3339 date-time). Only populated for items in shared drives.*/
	private static const string TRASHEDTIME = "trashedTime";
	string _trashedTime;
	mixin(GetterSetter!("string", "File")(TRASHEDTIME));

	/** ID of the shared drive the file resides in. Only populated for items in shared drives.*/
	private static const string DRIVEID = "driveId";
	string _driveId;
	mixin(GetterSetter!("string", "File")(DRIVEID));

	/** If the file has been explicitly trashed, the user who trashed it. Only populated for items in shared drives.*/
	private static const string TRASHINGUSER = "trashingUser";
	import gdrive.models.user;
	User _trashingUser;
	mixin(GetterSetter!("User", "File")(TRASHINGUSER));

	/** Whether the file has been shared. Not populated for items in shared drives.*/
	private static const string SHARED = "shared";
	bool _shared;
	mixin(GetterSetter!("bool", "File")(SHARED));

	/** The name of the file. This is not necessarily unique within a folder. Note that for immutable items such as the top level folders of shared drives, My Drive root folder, and Application Data folder the name is constant.*/
	private static const string NAME = "name";
	string _name;
	mixin(GetterSetter!("string", "File")(NAME));

	/** Additional metadata about video media. This may not be available immediately upon upload.*/
	private static const string VIDEOMEDIAMETADATA = "videoMediaMetadata";
	public struct VideoMediaMetadata {
		/** The height of the video in pixels.*/
		private static const string HEIGHT = "height";
		int _height;
		mixin(GetterSetter!("int", "VideoMediaMetadata")(HEIGHT));

		/** The duration of the video in milliseconds.*/
		private static const string DURATIONMILLIS = "durationMillis";
		string _durationMillis;
		mixin(GetterSetter!("string", "VideoMediaMetadata")(DURATIONMILLIS));

		/** The width of the video in pixels.*/
		private static const string WIDTH = "width";
		int _width;
		mixin(GetterSetter!("int", "VideoMediaMetadata")(WIDTH));

	}

	/** The list of spaces which contain the file. The currently supported values are 'drive', 'appDataFolder' and 'photos'.*/
	private static const string SPACES = "spaces";
	string[] _spaces;
	mixin(GetterSetter!("string[]", "File")(SPACES));

	/** A short-lived link to the file's thumbnail, if available. Typically lasts on the order of hours. Only populated when the requesting app can access the file's content. If the file isn't shared publicly, the URL returned in Files.thumbnailLink must be fetched using a credentialed request.*/
	private static const string THUMBNAILLINK = "thumbnailLink";
	@optional string _thumbnailLink;
	mixin(GetterSetter!("string", "File")(THUMBNAILLINK));

	/** The time at which the file was shared with the user, if applicable (RFC 3339 date-time).*/
	private static const string SHAREDWITHMETIME = "sharedWithMeTime";
	string _sharedWithMeTime;
	mixin(GetterSetter!("string", "File")(SHAREDWITHMETIME));

	/** A monotonically increasing version number for the file. This reflects every change made to the file on the server, even those not visible to the user.*/
	private static const string VERSION = "version";
	string _version;
	mixin(GetterSetter!("string", "File")(VERSION));

	/** The full list of permissions for the file. This is only available if the requesting user can share the file. Not populated for items in shared drives.*/
	private static const string PERMISSIONS = "permissions";
	import gdrive.models.permission;
	@optional Permission[] _permissions;
	mixin(GetterSetter!("Permission[]", "File")(PERMISSIONS));

	/** The MIME type of the file.
Google Drive will attempt to automatically detect an appropriate value from uploaded content if no value is provided. The value cannot be changed unless a new revision is uploaded.
If a file is created with a Google Doc MIME type, the uploaded content will be imported if possible. The supported import formats are published in the About resource.*/
	private static const string MIMETYPE = "mimeType";
	string _mimeType;
	mixin(GetterSetter!("string", "File")(MIMETYPE));

	/** Whether the options to copy, print, or download this file, should be disabled for readers and commenters.*/
	private static const string COPYREQUIRESWRITERPERMISSION = "copyRequiresWriterPermission";
	bool _copyRequiresWriterPermission;
	mixin(GetterSetter!("bool", "File")(COPYREQUIRESWRITERPERMISSION));

	/** Whether there are permissions directly on this file. This field is only populated for items in shared drives.*/
	private static const string HASAUGMENTEDPERMISSIONS = "hasAugmentedPermissions";
	bool _hasAugmentedPermissions;
	mixin(GetterSetter!("bool", "File")(HASAUGMENTEDPERMISSIONS));

	/** Whether the user has starred the file.*/
	private static const string STARRED = "starred";
	bool _starred;
	mixin(GetterSetter!("bool", "File")(STARRED));

	/** The MD5 checksum for the content of the file. This is only applicable to files with binary content in Google Drive.*/
	private static const string MD5CHECKSUM = "md5Checksum";
	string _md5Checksum;
	mixin(GetterSetter!("string", "File")(MD5CHECKSUM));

	/** Whether this file has a thumbnail. This does not indicate whether the requesting app has access to the thumbnail. To check access, look for the presence of the thumbnailLink field.*/
	private static const string HASTHUMBNAIL = "hasThumbnail";
	bool _hasThumbnail;
	mixin(GetterSetter!("bool", "File")(HASTHUMBNAIL));

	/** The ID of the file's head revision. This is currently only available for files with binary content in Google Drive.*/
	private static const string HEADREVISIONID = "headRevisionId";
	@optional string _headRevisionId;
	mixin(GetterSetter!("string", "File")(HEADREVISIONID));

	/** Whether users with only writer permission can modify the file's permissions. Not populated for items in shared drives.*/
	private static const string WRITERSCANSHARE = "writersCanShare";
	bool _writersCanShare;
	mixin(GetterSetter!("bool", "File")(WRITERSCANSHARE));

	/** Capabilities the current user has on this file. Each capability corresponds to a fine-grained action that a user may take.*/
	private static const string CAPABILITIES = "capabilities";
	public struct Capabilities {
		/** Whether the current user can remove a parent from the item without adding another parent in the same request. Not populated for shared drive files.*/
		private static const string CANREMOVEMYDRIVEPARENT = "canRemoveMyDriveParent";
		bool _canRemoveMyDriveParent;
		mixin(GetterSetter!("bool", "Capabilities")(CANREMOVEMYDRIVEPARENT));

		/** Whether the current user can rename this file.*/
		private static const string CANRENAME = "canRename";
		bool _canRename;
		mixin(GetterSetter!("bool", "Capabilities")(CANRENAME));

		/** Whether the current user can modify the sharing settings for this file.*/
		private static const string CANSHARE = "canShare";
		bool _canShare;
		mixin(GetterSetter!("bool", "Capabilities")(CANSHARE));

		/** Whether the current user can copy this file. For an item in a shared drive, whether the current user can copy non-folder descendants of this item, or this item itself if it is not a folder.*/
		private static const string CANCOPY = "canCopy";
		bool _canCopy;
		mixin(GetterSetter!("bool", "Capabilities")(CANCOPY));

		/** Whether the current user can edit this file. Other factors may limit the type of changes a user can make to a file. For example, see canChangeCopyRequiresWriterPermission or canModifyContent.*/
		private static const string CANEDIT = "canEdit";
		bool _canEdit;
		mixin(GetterSetter!("bool", "Capabilities")(CANEDIT));

		/** Whether the current user can trash children of this folder. This is false when the item is not a folder. Only populated for items in shared drives.*/
		private static const string CANTRASHCHILDREN = "canTrashChildren";
		bool _canTrashChildren;
		mixin(GetterSetter!("bool", "Capabilities")(CANTRASHCHILDREN));

		/** Deprecated*/
		private static const string CANCHANGEVIEWERSCANCOPYCONTENT = "canChangeViewersCanCopyContent";
		bool _canChangeViewersCanCopyContent;
		mixin(GetterSetter!("bool", "Capabilities")(CANCHANGEVIEWERSCANCOPYCONTENT));

		/** Whether the current user can read the revisions resource of this file. For a shared drive item, whether revisions of non-folder descendants of this item, or this item itself if it is not a folder, can be read.*/
		private static const string CANREADREVISIONS = "canReadRevisions";
		bool _canReadRevisions;
		mixin(GetterSetter!("bool", "Capabilities")(CANREADREVISIONS));

		/** Whether the current user can change the copyRequiresWriterPermission restriction of this file.*/
		private static const string CANCHANGECOPYREQUIRESWRITERPERMISSION = "canChangeCopyRequiresWriterPermission";
		bool _canChangeCopyRequiresWriterPermission;
		mixin(GetterSetter!("bool", "Capabilities")(CANCHANGECOPYREQUIRESWRITERPERMISSION));

		/** Whether the current user can add a parent for the item without removing an existing parent in the same request. Not populated for shared drive files.*/
		private static const string CANADDMYDRIVEPARENT = "canAddMyDriveParent";
		bool _canAddMyDriveParent;
		mixin(GetterSetter!("bool", "Capabilities")(CANADDMYDRIVEPARENT));

		/** Whether the current user can list the children of this folder. This is always false when the item is not a folder.*/
		private static const string CANLISTCHILDREN = "canListChildren";
		bool _canListChildren;
		mixin(GetterSetter!("bool", "Capabilities")(CANLISTCHILDREN));

		/** Whether the current user can modify the content of this file.*/
		private static const string CANMODIFYCONTENT = "canModifyContent";
		bool _canModifyContent;
		mixin(GetterSetter!("bool", "Capabilities")(CANMODIFYCONTENT));

		/** Whether the current user can read the shared drive to which this file belongs. Only populated for items in shared drives.*/
		private static const string CANREADDRIVE = "canReadDrive";
		bool _canReadDrive;
		mixin(GetterSetter!("bool", "Capabilities")(CANREADDRIVE));

		/** Deprecated - use canMoveChildrenWithinDrive instead.*/
		private static const string CANMOVECHILDRENWITHINTEAMDRIVE = "canMoveChildrenWithinTeamDrive";
		bool _canMoveChildrenWithinTeamDrive;
		mixin(GetterSetter!("bool", "Capabilities")(CANMOVECHILDRENWITHINTEAMDRIVE));

		/** Whether the current user can remove children from this folder. This is always false when the item is not a folder. For a folder in a shared drive, use canDeleteChildren or canTrashChildren instead.*/
		private static const string CANREMOVECHILDREN = "canRemoveChildren";
		bool _canRemoveChildren;
		mixin(GetterSetter!("bool", "Capabilities")(CANREMOVECHILDREN));

		/** Whether the current user can move this item outside of this drive by changing its parent. Note that a request to change the parent of the item may still fail depending on the new parent that is being added.*/
		private static const string CANMOVEITEMOUTOFDRIVE = "canMoveItemOutOfDrive";
		bool _canMoveItemOutOfDrive;
		mixin(GetterSetter!("bool", "Capabilities")(CANMOVEITEMOUTOFDRIVE));

		/** Whether the current user can add a folder from another drive (different shared drive or My Drive) to this folder. This is false when the item is not a folder. Only populated for items in shared drives.*/
		private static const string CANADDFOLDERFROMANOTHERDRIVE = "canAddFolderFromAnotherDrive";
		bool _canAddFolderFromAnotherDrive;
		mixin(GetterSetter!("bool", "Capabilities")(CANADDFOLDERFROMANOTHERDRIVE));

		/** Deprecated - use canReadDrive instead.*/
		private static const string CANREADTEAMDRIVE = "canReadTeamDrive";
		bool _canReadTeamDrive;
		mixin(GetterSetter!("bool", "Capabilities")(CANREADTEAMDRIVE));

		/** Whether the current user can move children of this folder outside of the shared drive. This is false when the item is not a folder. Only populated for items in shared drives.*/
		private static const string CANMOVECHILDRENOUTOFDRIVE = "canMoveChildrenOutOfDrive";
		bool _canMoveChildrenOutOfDrive;
		mixin(GetterSetter!("bool", "Capabilities")(CANMOVECHILDRENOUTOFDRIVE));

		/** Whether the current user can modify restrictions on content of this file.*/
		private static const string CANMODIFYCONTENTRESTRICTION = "canModifyContentRestriction";
		bool _canModifyContentRestriction;
		mixin(GetterSetter!("bool", "Capabilities")(CANMODIFYCONTENTRESTRICTION));

		/** Whether the current user can add children to this folder. This is always false when the item is not a folder.*/
		private static const string CANADDCHILDREN = "canAddChildren";
		bool _canAddChildren;
		mixin(GetterSetter!("bool", "Capabilities")(CANADDCHILDREN));

		/** Whether the current user can download this file.*/
		private static const string CANDOWNLOAD = "canDownload";
		bool _canDownload;
		mixin(GetterSetter!("bool", "Capabilities")(CANDOWNLOAD));

		/** Whether the current user can delete children of this folder. This is false when the item is not a folder. Only populated for items in shared drives.*/
		private static const string CANDELETECHILDREN = "canDeleteChildren";
		bool _canDeleteChildren;
		mixin(GetterSetter!("bool", "Capabilities")(CANDELETECHILDREN));

		/** Deprecated - use canMoveChildrenOutOfDrive instead.*/
		private static const string CANMOVECHILDRENOUTOFTEAMDRIVE = "canMoveChildrenOutOfTeamDrive";
		bool _canMoveChildrenOutOfTeamDrive;
		mixin(GetterSetter!("bool", "Capabilities")(CANMOVECHILDRENOUTOFTEAMDRIVE));

		/** Whether the current user can restore this file from trash.*/
		private static const string CANUNTRASH = "canUntrash";
		bool _canUntrash;
		mixin(GetterSetter!("bool", "Capabilities")(CANUNTRASH));

		/** Whether the current user can move this file to trash.*/
		private static const string CANTRASH = "canTrash";
		bool _canTrash;
		mixin(GetterSetter!("bool", "Capabilities")(CANTRASH));

		/** Deprecated - use canMoveItemWithinDrive instead.*/
		private static const string CANMOVEITEMWITHINTEAMDRIVE = "canMoveItemWithinTeamDrive";
		bool _canMoveItemWithinTeamDrive;
		mixin(GetterSetter!("bool", "Capabilities")(CANMOVEITEMWITHINTEAMDRIVE));

		/** Deprecated - use canMoveItemWithinDrive or canMoveItemOutOfDrive instead.*/
		private static const string CANMOVETEAMDRIVEITEM = "canMoveTeamDriveItem";
		bool _canMoveTeamDriveItem;
		mixin(GetterSetter!("bool", "Capabilities")(CANMOVETEAMDRIVEITEM));

		/** Whether the current user can comment on this file.*/
		private static const string CANCOMMENT = "canComment";
		bool _canComment;
		mixin(GetterSetter!("bool", "Capabilities")(CANCOMMENT));

		/** Whether the current user can delete this file.*/
		private static const string CANDELETE = "canDelete";
		bool _canDelete;
		mixin(GetterSetter!("bool", "Capabilities")(CANDELETE));

		/** Whether the current user can move children of this folder within this drive. This is false when the item is not a folder. Note that a request to move the child may still fail depending on the current user's access to the child and to the destination folder.*/
		private static const string CANMOVECHILDRENWITHINDRIVE = "canMoveChildrenWithinDrive";
		bool _canMoveChildrenWithinDrive;
		mixin(GetterSetter!("bool", "Capabilities")(CANMOVECHILDRENWITHINDRIVE));

		/** Whether the current user can move this item within this drive. Note that a request to change the parent of the item may still fail depending on the new parent that is being added and the parent that is being removed.*/
		private static const string CANMOVEITEMWITHINDRIVE = "canMoveItemWithinDrive";
		bool _canMoveItemWithinDrive;
		mixin(GetterSetter!("bool", "Capabilities")(CANMOVEITEMWITHINDRIVE));

		/** Deprecated - use canMoveItemOutOfDrive instead.*/
		private static const string CANMOVEITEMOUTOFTEAMDRIVE = "canMoveItemOutOfTeamDrive";
		bool _canMoveItemOutOfTeamDrive;
		mixin(GetterSetter!("bool", "Capabilities")(CANMOVEITEMOUTOFTEAMDRIVE));

		/** Deprecated - use canMoveItemOutOfDrive instead.*/
		private static const string CANMOVEITEMINTOTEAMDRIVE = "canMoveItemIntoTeamDrive";
		bool _canMoveItemIntoTeamDrive;
		mixin(GetterSetter!("bool", "Capabilities")(CANMOVEITEMINTOTEAMDRIVE));

	}

	/** A link for downloading the content of the file in a browser. This is only available for files with binary content in Google Drive.*/
	private static const string WEBCONTENTLINK = "webContentLink";
	@optional string _webContentLink;
	mixin(GetterSetter!("string", "File")(WEBCONTENTLINK));

	/** Identifies what kind of resource this is. Value: the fixed string "drive#file".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "File")(KIND));

	/** The size of the file's content in bytes. This is applicable to binary files in Google Drive and Google Docs files.*/
	private static const string SIZE = "size";
	string _size;
	mixin(GetterSetter!("string", "File")(SIZE));

	/** Whether the file has been modified by this user.*/
	private static const string MODIFIEDBYME = "modifiedByMe";
	bool _modifiedByMe;
	mixin(GetterSetter!("bool", "File")(MODIFIEDBYME));

	/** The full file extension extracted from the name field. May contain multiple concatenated extensions, such as "tar.gz". This is only available for files with binary content in Google Drive.
This is automatically updated when the name field changes, however it is not cleared if the new name does not contain a valid extension.*/
	private static const string FULLFILEEXTENSION = "fullFileExtension";
	@optional string _fullFileExtension;
	mixin(GetterSetter!("string", "File")(FULLFILEEXTENSION));

	/** The color for a folder as an RGB hex string. The supported colors are published in the folderColorPalette field of the About resource.
If an unsupported color is specified, the closest color in the palette will be used instead.*/
	private static const string FOLDERCOLORRGB = "folderColorRgb";
	string _folderColorRgb;
	mixin(GetterSetter!("string", "File")(FOLDERCOLORRGB));

	/** A static, unauthenticated link to the file's icon.*/
	private static const string ICONLINK = "iconLink";
	string _iconLink;
	mixin(GetterSetter!("string", "File")(ICONLINK));

	/** The original filename of the uploaded content if available, or else the original value of the name field. This is only available for files with binary content in Google Drive.*/
	private static const string ORIGINALFILENAME = "originalFilename";
	@optional string _originalFilename;
	mixin(GetterSetter!("string", "File")(ORIGINALFILENAME));

	/** Additional metadata about image media, if available.*/
	private static const string IMAGEMEDIAMETADATA = "imageMediaMetadata";
	public struct ImageMediaMetadata {
		/** The type of sensor used to create the photo.*/
		private static const string SENSOR = "sensor";
		string _sensor;
		mixin(GetterSetter!("string", "ImageMediaMetadata")(SENSOR));

		/** The date and time the photo was taken (EXIF DateTime).*/
		private static const string TIME = "time";
		string _time;
		mixin(GetterSetter!("string", "ImageMediaMetadata")(TIME));

		/** Geographic location information stored in the image.*/
		private static const string LOCATION = "location";
			public struct Location {
			/** The longitude stored in the image.*/
			private static const string LONGITUDE = "longitude";
			double _longitude;
			mixin(GetterSetter!("double", "Location")(LONGITUDE));

			/** The altitude stored in the image.*/
			private static const string ALTITUDE = "altitude";
			double _altitude;
			mixin(GetterSetter!("double", "Location")(ALTITUDE));

			/** The latitude stored in the image.*/
			private static const string LATITUDE = "latitude";
			double _latitude;
			mixin(GetterSetter!("double", "Location")(LATITUDE));

		}

		/** The model of the camera used to create the photo.*/
		private static const string CAMERAMODEL = "cameraModel";
		string _cameraModel;
		mixin(GetterSetter!("string", "ImageMediaMetadata")(CAMERAMODEL));

		/** The width of the image in pixels.*/
		private static const string WIDTH = "width";
		int _width;
		mixin(GetterSetter!("int", "ImageMediaMetadata")(WIDTH));

		/** The ISO speed used to create the photo.*/
		private static const string ISOSPEED = "isoSpeed";
		int _isoSpeed;
		mixin(GetterSetter!("int", "ImageMediaMetadata")(ISOSPEED));

		/** Whether a flash was used to create the photo.*/
		private static const string FLASHUSED = "flashUsed";
		bool _flashUsed;
		mixin(GetterSetter!("bool", "ImageMediaMetadata")(FLASHUSED));

		/** The focal length used to create the photo, in millimeters.*/
		private static const string FOCALLENGTH = "focalLength";
		float _focalLength;
		mixin(GetterSetter!("float", "ImageMediaMetadata")(FOCALLENGTH));

		/** The color space of the photo.*/
		private static const string COLORSPACE = "colorSpace";
		string _colorSpace;
		mixin(GetterSetter!("string", "ImageMediaMetadata")(COLORSPACE));

		/** The distance to the subject of the photo, in meters.*/
		private static const string SUBJECTDISTANCE = "subjectDistance";
		int _subjectDistance;
		mixin(GetterSetter!("int", "ImageMediaMetadata")(SUBJECTDISTANCE));

		/** The exposure bias of the photo (APEX value).*/
		private static const string EXPOSUREBIAS = "exposureBias";
		float _exposureBias;
		mixin(GetterSetter!("float", "ImageMediaMetadata")(EXPOSUREBIAS));

		/** The smallest f-number of the lens at the focal length used to create the photo (APEX value).*/
		private static const string MAXAPERTUREVALUE = "maxApertureValue";
		float _maxApertureValue;
		mixin(GetterSetter!("float", "ImageMediaMetadata")(MAXAPERTUREVALUE));

		/** The exposure mode used to create the photo.*/
		private static const string EXPOSUREMODE = "exposureMode";
		string _exposureMode;
		mixin(GetterSetter!("string", "ImageMediaMetadata")(EXPOSUREMODE));

		/** The metering mode used to create the photo.*/
		private static const string METERINGMODE = "meteringMode";
		string _meteringMode;
		mixin(GetterSetter!("string", "ImageMediaMetadata")(METERINGMODE));

		/** The height of the image in pixels.*/
		private static const string HEIGHT = "height";
		int _height;
		mixin(GetterSetter!("int", "ImageMediaMetadata")(HEIGHT));

		/** The white balance mode used to create the photo.*/
		private static const string WHITEBALANCE = "whiteBalance";
		string _whiteBalance;
		mixin(GetterSetter!("string", "ImageMediaMetadata")(WHITEBALANCE));

		/** The aperture used to create the photo (f-number).*/
		private static const string APERTURE = "aperture";
		float _aperture;
		mixin(GetterSetter!("float", "ImageMediaMetadata")(APERTURE));

		/** The make of the camera used to create the photo.*/
		private static const string CAMERAMAKE = "cameraMake";
		string _cameraMake;
		mixin(GetterSetter!("string", "ImageMediaMetadata")(CAMERAMAKE));

		/** The lens used to create the photo.*/
		private static const string LENS = "lens";
		string _lens;
		mixin(GetterSetter!("string", "ImageMediaMetadata")(LENS));

		/** The number of clockwise 90 degree rotations applied from the image's original orientation.*/
		private static const string ROTATION = "rotation";
		int _rotation;
		mixin(GetterSetter!("int", "ImageMediaMetadata")(ROTATION));

		/** The length of the exposure, in seconds.*/
		private static const string EXPOSURETIME = "exposureTime";
		float _exposureTime;
		mixin(GetterSetter!("float", "ImageMediaMetadata")(EXPOSURETIME));

	}

	/** The user who shared the file with the requesting user, if applicable.*/
	private static const string SHARINGUSER = "sharingUser";
	User _sharingUser;
	mixin(GetterSetter!("User", "File")(SHARINGUSER));

	/** Deprecated - use copyRequiresWriterPermission instead.*/
	private static const string VIEWERSCANCOPYCONTENT = "viewersCanCopyContent";
	bool _viewersCanCopyContent;
	mixin(GetterSetter!("bool", "File")(VIEWERSCANCOPYCONTENT));

	/** The last time the file was modified by anyone (RFC 3339 date-time).
Note that setting modifiedTime will also update modifiedByMeTime for the user.*/
	private static const string MODIFIEDTIME = "modifiedTime";
	string _modifiedTime;
	mixin(GetterSetter!("string", "File")(MODIFIEDTIME));

	/** A collection of arbitrary key-value pairs which are private to the requesting app.
Entries with null values are cleared in update and copy requests. These properties can only be retrieved using an authenticated request. An authenticated request uses an access token obtained with a OAuth 2 client ID. You cannot use an API key to retrieve private properties.*/
	private static const string APPPROPERTIES = "appProperties";
	string[string] _appProperties;
	mixin(GetterSetter!("string[string]", "File")(APPPROPERTIES));

	/** Whether the file was created or opened by the requesting app.*/
	private static const string ISAPPAUTHORIZED = "isAppAuthorized";
	bool _isAppAuthorized;
	mixin(GetterSetter!("bool", "File")(ISAPPAUTHORIZED));

	/** The number of storage quota bytes used by the file. This includes the head revision as well as previous revisions with keepForever enabled.*/
	private static const string QUOTABYTESUSED = "quotaBytesUsed";
	string _quotaBytesUsed;
	mixin(GetterSetter!("string", "File")(QUOTABYTESUSED));

	/** Whether the file has been explicitly trashed, as opposed to recursively trashed from a parent folder.*/
	private static const string EXPLICITLYTRASHED = "explicitlyTrashed";
	bool _explicitlyTrashed;
	mixin(GetterSetter!("bool", "File")(EXPLICITLYTRASHED));

	/** The final component of fullFileExtension. This is only available for files with binary content in Google Drive.*/
	private static const string FILEEXTENSION = "fileExtension";
	@optional string _fileExtension;
	mixin(GetterSetter!("string", "File")(FILEEXTENSION));

	/** Whether the user owns the file. Not populated for items in shared drives.*/
	private static const string OWNEDBYME = "ownedByMe";
	bool _ownedByMe;
	mixin(GetterSetter!("bool", "File")(OWNEDBYME));

	/** A link for opening the file in a relevant Google editor or viewer in a browser.*/
	private static const string WEBVIEWLINK = "webViewLink";
	string _webViewLink;
	mixin(GetterSetter!("string", "File")(WEBVIEWLINK));

	/** The last time the file was modified by the user (RFC 3339 date-time).*/
	private static const string MODIFIEDBYMETIME = "modifiedByMeTime";
	string _modifiedByMeTime;
	mixin(GetterSetter!("string", "File")(MODIFIEDBYMETIME));

	/** Whether the file has been trashed, either explicitly or from a trashed parent folder. Only the owner may trash a file. The trashed item is excluded from all files.list responses returned for any user who does not own the file. However, all users with access to the file can see the trashed item metadata in an API response. All users with access can copy, download, export, and share the file.*/
	private static const string TRASHED = "trashed";
	bool _trashed;
	mixin(GetterSetter!("bool", "File")(TRASHED));

	/** List of permission IDs for users with access to this file.*/
	private static const string PERMISSIONIDS = "permissionIds";
	string[] _permissionIds;
	mixin(GetterSetter!("string[]", "File")(PERMISSIONIDS));

	/** The thumbnail version for use in thumbnail cache invalidation.*/
	private static const string THUMBNAILVERSION = "thumbnailVersion";
	string _thumbnailVersion;
	mixin(GetterSetter!("string", "File")(THUMBNAILVERSION));

	/** The last user to modify the file.*/
	private static const string LASTMODIFYINGUSER = "lastModifyingUser";
	User _lastModifyingUser;
	mixin(GetterSetter!("User", "File")(LASTMODIFYINGUSER));

	/** A collection of arbitrary key-value pairs which are visible to all apps.
Entries with null values are cleared in update and copy requests.*/
	private static const string PROPERTIES = "properties";
	string[string] _properties;
	mixin(GetterSetter!("string[string]", "File")(PROPERTIES));

	/** The time at which the file was created (RFC 3339 date-time).*/
	private static const string CREATEDTIME = "createdTime";
	string _createdTime;
	mixin(GetterSetter!("string", "File")(CREATEDTIME));

	/** The IDs of the parent folders which contain the file.
If not specified as part of a create request, the file will be placed directly in the user's My Drive folder. If not specified as part of a copy request, the file will inherit any discoverable parents of the source file. Update requests must use the addParents and removeParents parameters to modify the parents list.*/
	private static const string PARENTS = "parents";
	string[] _parents;
	mixin(GetterSetter!("string[]", "File")(PARENTS));

	/** The owners of the file. Currently, only certain legacy files may have more than one owner. Not populated for items in shared drives.*/
	private static const string OWNERS = "owners";
	User[] _owners;
	mixin(GetterSetter!("User[]", "File")(OWNERS));

	/** Shortcut file details. Only populated for shortcut files, which have the mimeType field set to application/vnd.google-apps.shortcut.*/
	private static const string SHORTCUTDETAILS = "shortcutDetails";
	public struct ShortcutDetails {
		/** The ID of the file that this shortcut points to.*/
		private static const string TARGETID = "targetId";
		string _targetId;
		mixin(GetterSetter!("string", "ShortcutDetails")(TARGETID));

		/** The MIME type of the file that this shortcut points to. The value of this field is a snapshot of the target's MIME type, captured when the shortcut is created.*/
		private static const string TARGETMIMETYPE = "targetMimeType";
		string _targetMimeType;
		mixin(GetterSetter!("string", "ShortcutDetails")(TARGETMIMETYPE));

	}

	/** Restrictions for accessing the content of the file. Only populated if such a restriction exists.*/
	private static const string CONTENTRESTRICTIONS = "contentRestrictions";
	import gdrive.models.contentrestriction;
	ContentRestriction[] _contentRestrictions;
	mixin(GetterSetter!("ContentRestriction[]", "File")(CONTENTRESTRICTIONS));

	/** Additional information about the content of the file. These fields are never populated in responses.*/
	private static const string CONTENTHINTS = "contentHints";
	public struct ContentHints {
		/** A thumbnail for the file. This will only be used if Google Drive cannot generate a standard thumbnail.*/
		private static const string THUMBNAIL = "thumbnail";
			public struct Thumbnail {
			/** The MIME type of the thumbnail.*/
			private static const string MIMETYPE = "mimeType";
			string _mimeType;
			mixin(GetterSetter!("string", "Thumbnail")(MIMETYPE));

			/** The thumbnail data encoded with URL-safe Base64 (RFC 4648 section 5).*/
			private static const string IMAGE = "image";
			string _image;
			mixin(GetterSetter!("string", "Thumbnail")(IMAGE));

		}

		/** Text to be indexed for the file to improve fullText queries. This is limited to 128KB in length and may contain HTML elements.*/
		private static const string INDEXABLETEXT = "indexableText";
		string _indexableText;
		mixin(GetterSetter!("string", "ContentHints")(INDEXABLETEXT));

	}

	/** A short description of the file.*/
	private static const string DESCRIPTION = "description";
	string _description;
	mixin(GetterSetter!("string", "File")(DESCRIPTION));

	/** The last time the file was viewed by the user (RFC 3339 date-time).*/
	private static const string VIEWEDBYMETIME = "viewedByMeTime";
	string _viewedByMeTime;
	mixin(GetterSetter!("string", "File")(VIEWEDBYMETIME));

	/** Whether the file has been viewed by this user.*/
	private static const string VIEWEDBYME = "viewedByMe";
	bool _viewedByMe;
	mixin(GetterSetter!("bool", "File")(VIEWEDBYME));

}
