module gdrive.models.teamdrive;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct TeamDrive {
	/** A short-lived link to this Team Drive's background image.*/
	private static const string BACKGROUNDIMAGELINK = "backgroundImageLink";
	string _backgroundImageLink;
	mixin(GetterSetter!("string", "TeamDrive")(BACKGROUNDIMAGELINK));

	/** The time at which the Team Drive was created (RFC 3339 date-time).*/
	private static const string CREATEDTIME = "createdTime";
	string _createdTime;
	mixin(GetterSetter!("string", "TeamDrive")(CREATEDTIME));

	/** A set of restrictions that apply to this Team Drive or items inside this Team Drive.*/
	private static const string RESTRICTIONS = "restrictions";
	public struct Restrictions {
		/** Whether access to this Team Drive and items inside this Team Drive is restricted to users of the domain to which this Team Drive belongs. This restriction may be overridden by other sharing policies controlled outside of this Team Drive.*/
		private static const string DOMAINUSERSONLY = "domainUsersOnly";
		bool _domainUsersOnly;
		mixin(GetterSetter!("bool", "Restrictions")(DOMAINUSERSONLY));

		/** Whether the options to copy, print, or download files inside this Team Drive, should be disabled for readers and commenters. When this restriction is set to true, it will override the similarly named field to true for any file inside this Team Drive.*/
		private static const string COPYREQUIRESWRITERPERMISSION = "copyRequiresWriterPermission";
		bool _copyRequiresWriterPermission;
		mixin(GetterSetter!("bool", "Restrictions")(COPYREQUIRESWRITERPERMISSION));

		/** Whether access to items inside this Team Drive is restricted to members of this Team Drive.*/
		private static const string TEAMMEMBERSONLY = "teamMembersOnly";
		bool _teamMembersOnly;
		mixin(GetterSetter!("bool", "Restrictions")(TEAMMEMBERSONLY));

		/** Whether administrative privileges on this Team Drive are required to modify restrictions.*/
		private static const string ADMINMANAGEDRESTRICTIONS = "adminManagedRestrictions";
		bool _adminManagedRestrictions;
		mixin(GetterSetter!("bool", "Restrictions")(ADMINMANAGEDRESTRICTIONS));

	}

	/** The ID of this Team Drive which is also the ID of the top level folder of this Team Drive.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "TeamDrive")(ID));

	/** Identifies what kind of resource this is. Value: the fixed string "drive#teamDrive".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "TeamDrive")(KIND));

	/** The color of this Team Drive as an RGB hex string. It can only be set on a drive.teamdrives.update request that does not set themeId.*/
	private static const string COLORRGB = "colorRgb";
	string _colorRgb;
	mixin(GetterSetter!("string", "TeamDrive")(COLORRGB));

	/** Capabilities the current user has on this Team Drive.*/
	private static const string CAPABILITIES = "capabilities";
	public struct Capabilities {
		/** Whether the current user can rename files or folders in this Team Drive.*/
		private static const string CANRENAME = "canRename";
		bool _canRename;
		mixin(GetterSetter!("bool", "Capabilities")(CANRENAME));

		/** Whether the current user can change the domainUsersOnly restriction of this Team Drive.*/
		private static const string CANCHANGEDOMAINUSERSONLYRESTRICTION = "canChangeDomainUsersOnlyRestriction";
		bool _canChangeDomainUsersOnlyRestriction;
		mixin(GetterSetter!("bool", "Capabilities")(CANCHANGEDOMAINUSERSONLYRESTRICTION));

		/** Whether the current user can read the revisions resource of files in this Team Drive.*/
		private static const string CANREADREVISIONS = "canReadRevisions";
		bool _canReadRevisions;
		mixin(GetterSetter!("bool", "Capabilities")(CANREADREVISIONS));

		/** Whether the current user can share files or folders in this Team Drive.*/
		private static const string CANSHARE = "canShare";
		bool _canShare;
		mixin(GetterSetter!("bool", "Capabilities")(CANSHARE));

		/** Whether the current user can add children to folders in this Team Drive.*/
		private static const string CANADDCHILDREN = "canAddChildren";
		bool _canAddChildren;
		mixin(GetterSetter!("bool", "Capabilities")(CANADDCHILDREN));

		/** Whether the current user can download files in this Team Drive.*/
		private static const string CANDOWNLOAD = "canDownload";
		bool _canDownload;
		mixin(GetterSetter!("bool", "Capabilities")(CANDOWNLOAD));

		/** Whether the current user can list the children of folders in this Team Drive.*/
		private static const string CANLISTCHILDREN = "canListChildren";
		bool _canListChildren;
		mixin(GetterSetter!("bool", "Capabilities")(CANLISTCHILDREN));

		/** Deprecated - use canDeleteChildren or canTrashChildren instead.*/
		private static const string CANREMOVECHILDREN = "canRemoveChildren";
		bool _canRemoveChildren;
		mixin(GetterSetter!("bool", "Capabilities")(CANREMOVECHILDREN));

		/** Whether the current user can rename this Team Drive.*/
		private static const string CANRENAMETEAMDRIVE = "canRenameTeamDrive";
		bool _canRenameTeamDrive;
		mixin(GetterSetter!("bool", "Capabilities")(CANRENAMETEAMDRIVE));

		/** Whether the current user can comment on files in this Team Drive.*/
		private static const string CANCOMMENT = "canComment";
		bool _canComment;
		mixin(GetterSetter!("bool", "Capabilities")(CANCOMMENT));

		/** Whether the current user can copy files in this Team Drive.*/
		private static const string CANCOPY = "canCopy";
		bool _canCopy;
		mixin(GetterSetter!("bool", "Capabilities")(CANCOPY));

		/** Whether the current user can edit files in this Team Drive*/
		private static const string CANEDIT = "canEdit";
		bool _canEdit;
		mixin(GetterSetter!("bool", "Capabilities")(CANEDIT));

		/** Whether the current user can delete this Team Drive. Attempting to delete the Team Drive may still fail if there are untrashed items inside the Team Drive.*/
		private static const string CANDELETETEAMDRIVE = "canDeleteTeamDrive";
		bool _canDeleteTeamDrive;
		mixin(GetterSetter!("bool", "Capabilities")(CANDELETETEAMDRIVE));

		/** Whether the current user can trash children from folders in this Team Drive.*/
		private static const string CANTRASHCHILDREN = "canTrashChildren";
		bool _canTrashChildren;
		mixin(GetterSetter!("bool", "Capabilities")(CANTRASHCHILDREN));

		/** Whether the current user can add members to this Team Drive or remove them or change their role.*/
		private static const string CANMANAGEMEMBERS = "canManageMembers";
		bool _canManageMembers;
		mixin(GetterSetter!("bool", "Capabilities")(CANMANAGEMEMBERS));

		/** Whether the current user can delete children from folders in this Team Drive.*/
		private static const string CANDELETECHILDREN = "canDeleteChildren";
		bool _canDeleteChildren;
		mixin(GetterSetter!("bool", "Capabilities")(CANDELETECHILDREN));

		/** Whether the current user can change the teamMembersOnly restriction of this Team Drive.*/
		private static const string CANCHANGETEAMMEMBERSONLYRESTRICTION = "canChangeTeamMembersOnlyRestriction";
		bool _canChangeTeamMembersOnlyRestriction;
		mixin(GetterSetter!("bool", "Capabilities")(CANCHANGETEAMMEMBERSONLYRESTRICTION));

		/** Whether the current user can change the copyRequiresWriterPermission restriction of this Team Drive.*/
		private static const string CANCHANGECOPYREQUIRESWRITERPERMISSIONRESTRICTION = "canChangeCopyRequiresWriterPermissionRestriction";
		bool _canChangeCopyRequiresWriterPermissionRestriction;
		mixin(GetterSetter!("bool", "Capabilities")(CANCHANGECOPYREQUIRESWRITERPERMISSIONRESTRICTION));

		/** Whether the current user can change the background of this Team Drive.*/
		private static const string CANCHANGETEAMDRIVEBACKGROUND = "canChangeTeamDriveBackground";
		bool _canChangeTeamDriveBackground;
		mixin(GetterSetter!("bool", "Capabilities")(CANCHANGETEAMDRIVEBACKGROUND));

	}

	/** The name of this Team Drive.*/
	private static const string NAME = "name";
	string _name;
	mixin(GetterSetter!("string", "TeamDrive")(NAME));

	/** The ID of the theme from which the background image and color will be set. The set of possible teamDriveThemes can be retrieved from a drive.about.get response. When not specified on a drive.teamdrives.create request, a random theme is chosen from which the background image and color are set. This is a write-only field; it can only be set on requests that don't set colorRgb or backgroundImageFile.*/
	private static const string THEMEID = "themeId";
	string _themeId;
	mixin(GetterSetter!("string", "TeamDrive")(THEMEID));

	/** An image file and cropping parameters from which a background image for this Team Drive is set. This is a write only field; it can only be set on drive.teamdrives.update requests that don't set themeId. When specified, all fields of the backgroundImageFile must be set.*/
	private static const string BACKGROUNDIMAGEFILE = "backgroundImageFile";
	public struct BackgroundImageFile {
		/** The X coordinate of the upper left corner of the cropping area in the background image. This is a value in the closed range of 0 to 1. This value represents the horizontal distance from the left side of the entire image to the left side of the cropping area divided by the width of the entire image.*/
		private static const string XCOORDINATE = "xCoordinate";
		float _xCoordinate;
		mixin(GetterSetter!("float", "BackgroundImageFile")(XCOORDINATE));

		/** The width of the cropped image in the closed range of 0 to 1. This value represents the width of the cropped image divided by the width of the entire image. The height is computed by applying a width to height aspect ratio of 80 to 9. The resulting image must be at least 1280 pixels wide and 144 pixels high.*/
		private static const string WIDTH = "width";
		float _width;
		mixin(GetterSetter!("float", "BackgroundImageFile")(WIDTH));

		/** The ID of an image file in Drive to use for the background image.*/
		private static const string ID = "id";
		string _id;
		mixin(GetterSetter!("string", "BackgroundImageFile")(ID));

		/** The Y coordinate of the upper left corner of the cropping area in the background image. This is a value in the closed range of 0 to 1. This value represents the vertical distance from the top side of the entire image to the top side of the cropping area divided by the height of the entire image.*/
		private static const string YCOORDINATE = "yCoordinate";
		float _yCoordinate;
		mixin(GetterSetter!("float", "BackgroundImageFile")(YCOORDINATE));

	}

}
