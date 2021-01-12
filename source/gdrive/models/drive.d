module gdrive.models.drive;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Drive {
	/** A short-lived link to this shared drive's background image.*/
	private static const string BACKGROUNDIMAGELINK = "backgroundImageLink";
	string _backgroundImageLink;
	mixin(GetterSetter!("string", "Drive")(BACKGROUNDIMAGELINK));

	/** The time at which the shared drive was created (RFC 3339 date-time).*/
	private static const string CREATEDTIME = "createdTime";
	string _createdTime;
	mixin(GetterSetter!("string", "Drive")(CREATEDTIME));

	/** Whether the shared drive is hidden from default view.*/
	private static const string HIDDEN = "hidden";
	bool _hidden;
	mixin(GetterSetter!("bool", "Drive")(HIDDEN));

	/** The ID of this shared drive which is also the ID of the top level folder of this shared drive.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "Drive")(ID));

	/** Identifies what kind of resource this is. Value: the fixed string "drive#drive".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "Drive")(KIND));

	/** The color of this shared drive as an RGB hex string. It can only be set on a drive.drives.update request that does not set themeId.*/
	private static const string COLORRGB = "colorRgb";
	string _colorRgb;
	mixin(GetterSetter!("string", "Drive")(COLORRGB));

	/** Capabilities the current user has on this shared drive.*/
	private static const string CAPABILITIES = "capabilities";
	public struct Capabilities {
		/** Whether the current user can rename files or folders in this shared drive.*/
		private static const string CANRENAME = "canRename";
		bool _canRename;
		mixin(GetterSetter!("bool", "Capabilities")(CANRENAME));

		/** Whether the current user can change the domainUsersOnly restriction of this shared drive.*/
		private static const string CANCHANGEDOMAINUSERSONLYRESTRICTION = "canChangeDomainUsersOnlyRestriction";
		bool _canChangeDomainUsersOnlyRestriction;
		mixin(GetterSetter!("bool", "Capabilities")(CANCHANGEDOMAINUSERSONLYRESTRICTION));

		/** Whether the current user can read the revisions resource of files in this shared drive.*/
		private static const string CANREADREVISIONS = "canReadRevisions";
		bool _canReadRevisions;
		mixin(GetterSetter!("bool", "Capabilities")(CANREADREVISIONS));

		/** Whether the current user can share files or folders in this shared drive.*/
		private static const string CANSHARE = "canShare";
		bool _canShare;
		mixin(GetterSetter!("bool", "Capabilities")(CANSHARE));

		/** Whether the current user can add children to folders in this shared drive.*/
		private static const string CANADDCHILDREN = "canAddChildren";
		bool _canAddChildren;
		mixin(GetterSetter!("bool", "Capabilities")(CANADDCHILDREN));

		/** Whether the current user can download files in this shared drive.*/
		private static const string CANDOWNLOAD = "canDownload";
		bool _canDownload;
		mixin(GetterSetter!("bool", "Capabilities")(CANDOWNLOAD));

		/** Whether the current user can list the children of folders in this shared drive.*/
		private static const string CANLISTCHILDREN = "canListChildren";
		bool _canListChildren;
		mixin(GetterSetter!("bool", "Capabilities")(CANLISTCHILDREN));

		/** Whether the current user can change the driveMembersOnly restriction of this shared drive.*/
		private static const string CANCHANGEDRIVEMEMBERSONLYRESTRICTION = "canChangeDriveMembersOnlyRestriction";
		bool _canChangeDriveMembersOnlyRestriction;
		mixin(GetterSetter!("bool", "Capabilities")(CANCHANGEDRIVEMEMBERSONLYRESTRICTION));

		/** Whether the current user can comment on files in this shared drive.*/
		private static const string CANCOMMENT = "canComment";
		bool _canComment;
		mixin(GetterSetter!("bool", "Capabilities")(CANCOMMENT));

		/** Whether the current user can copy files in this shared drive.*/
		private static const string CANCOPY = "canCopy";
		bool _canCopy;
		mixin(GetterSetter!("bool", "Capabilities")(CANCOPY));

		/** Whether the current user can delete this shared drive. Attempting to delete the shared drive may still fail if there are untrashed items inside the shared drive.*/
		private static const string CANDELETEDRIVE = "canDeleteDrive";
		bool _canDeleteDrive;
		mixin(GetterSetter!("bool", "Capabilities")(CANDELETEDRIVE));

		/** Whether the current user can edit files in this shared drive*/
		private static const string CANEDIT = "canEdit";
		bool _canEdit;
		mixin(GetterSetter!("bool", "Capabilities")(CANEDIT));

		/** Whether the current user can rename this shared drive.*/
		private static const string CANRENAMEDRIVE = "canRenameDrive";
		bool _canRenameDrive;
		mixin(GetterSetter!("bool", "Capabilities")(CANRENAMEDRIVE));

		/** Whether the current user can trash children from folders in this shared drive.*/
		private static const string CANTRASHCHILDREN = "canTrashChildren";
		bool _canTrashChildren;
		mixin(GetterSetter!("bool", "Capabilities")(CANTRASHCHILDREN));

		/** Whether the current user can add members to this shared drive or remove them or change their role.*/
		private static const string CANMANAGEMEMBERS = "canManageMembers";
		bool _canManageMembers;
		mixin(GetterSetter!("bool", "Capabilities")(CANMANAGEMEMBERS));

		/** Whether the current user can delete children from folders in this shared drive.*/
		private static const string CANDELETECHILDREN = "canDeleteChildren";
		bool _canDeleteChildren;
		mixin(GetterSetter!("bool", "Capabilities")(CANDELETECHILDREN));

		/** Whether the current user can change the background of this shared drive.*/
		private static const string CANCHANGEDRIVEBACKGROUND = "canChangeDriveBackground";
		bool _canChangeDriveBackground;
		mixin(GetterSetter!("bool", "Capabilities")(CANCHANGEDRIVEBACKGROUND));

		/** Whether the current user can change the copyRequiresWriterPermission restriction of this shared drive.*/
		private static const string CANCHANGECOPYREQUIRESWRITERPERMISSIONRESTRICTION = "canChangeCopyRequiresWriterPermissionRestriction";
		bool _canChangeCopyRequiresWriterPermissionRestriction;
		mixin(GetterSetter!("bool", "Capabilities")(CANCHANGECOPYREQUIRESWRITERPERMISSIONRESTRICTION));

	}

	/** A set of restrictions that apply to this shared drive or items inside this shared drive.*/
	private static const string RESTRICTIONS = "restrictions";
	public struct Restrictions {
		/** Whether access to this shared drive and items inside this shared drive is restricted to users of the domain to which this shared drive belongs. This restriction may be overridden by other sharing policies controlled outside of this shared drive.*/
		private static const string DOMAINUSERSONLY = "domainUsersOnly";
		bool _domainUsersOnly;
		mixin(GetterSetter!("bool", "Restrictions")(DOMAINUSERSONLY));

		/** Whether the options to copy, print, or download files inside this shared drive, should be disabled for readers and commenters. When this restriction is set to true, it will override the similarly named field to true for any file inside this shared drive.*/
		private static const string COPYREQUIRESWRITERPERMISSION = "copyRequiresWriterPermission";
		bool _copyRequiresWriterPermission;
		mixin(GetterSetter!("bool", "Restrictions")(COPYREQUIRESWRITERPERMISSION));

		/** Whether access to items inside this shared drive is restricted to its members.*/
		private static const string DRIVEMEMBERSONLY = "driveMembersOnly";
		bool _driveMembersOnly;
		mixin(GetterSetter!("bool", "Restrictions")(DRIVEMEMBERSONLY));

		/** Whether administrative privileges on this shared drive are required to modify restrictions.*/
		private static const string ADMINMANAGEDRESTRICTIONS = "adminManagedRestrictions";
		bool _adminManagedRestrictions;
		mixin(GetterSetter!("bool", "Restrictions")(ADMINMANAGEDRESTRICTIONS));

	}

	/** The name of this shared drive.*/
	private static const string NAME = "name";
	string _name;
	mixin(GetterSetter!("string", "Drive")(NAME));

	/** The ID of the theme from which the background image and color will be set. The set of possible driveThemes can be retrieved from a drive.about.get response. When not specified on a drive.drives.create request, a random theme is chosen from which the background image and color are set. This is a write-only field; it can only be set on requests that don't set colorRgb or backgroundImageFile.*/
	private static const string THEMEID = "themeId";
	string _themeId;
	mixin(GetterSetter!("string", "Drive")(THEMEID));

	/** An image file and cropping parameters from which a background image for this shared drive is set. This is a write only field; it can only be set on drive.drives.update requests that don't set themeId. When specified, all fields of the backgroundImageFile must be set.*/
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

		/** The ID of an image file in Google Drive to use for the background image.*/
		private static const string ID = "id";
		string _id;
		mixin(GetterSetter!("string", "BackgroundImageFile")(ID));

		/** The Y coordinate of the upper left corner of the cropping area in the background image. This is a value in the closed range of 0 to 1. This value represents the vertical distance from the top side of the entire image to the top side of the cropping area divided by the height of the entire image.*/
		private static const string YCOORDINATE = "yCoordinate";
		float _yCoordinate;
		mixin(GetterSetter!("float", "BackgroundImageFile")(YCOORDINATE));

	}

}
