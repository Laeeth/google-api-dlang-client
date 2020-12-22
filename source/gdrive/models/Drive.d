module gdrive.models.Drive;

import std.json;
import std.datetime : SysTime;
import std.typecons : Nullable, nullable;
import std.conv : to;

public final struct Drive {
    JSONValue container;
    alias container this;
    /**
    * An image file and cropping parameters from which a background image for this shared drive is
    * set. This is a write only field; it can only be set on drive.drives.update requests that don't
    * set themeId. When specified, all fields of the backgroundImageFile must be set.
    * The value may be {@code null}.
    */
    private static const string BACKGROUND_IMAGE_FILE = "backgroundImageFile";

    /**
    * A short-lived link to this shared drive's background image.
    * The value may be {@code null}.
    */
    private static const string BACKGROUND_IMAGE_LINK =  "backgroundImageLink";

    /**
    * Capabilities the current user has on this shared drive.
    * The value may be {@code null}.
    */
    private static const string CAPABILITIES = "capabilities";

    /**
    * The color of this shared drive as an RGB hex string. It can only be set on a
    * drive.drives.update request that does not set themeId.
    * The value may be {@code null}.
    */
    private static const string COLOR_RGB = "colorRgb";

    /**
    * The time at which the shared drive was created (RFC 3339 date-time).
    * The value may be {@code null}.
    */
    private static const string CREATED_TIME = "createdTime";
    /**
    * Whether the shared drive is hidden from default view.
    * The value may be {@code null}.
    */
    private static const string HIDDEN = "hidden";

    /**
    * The ID of this shared drive which is also the ID of the top level folder of this shared drive.
    * The value may be {@code null}.
    */
    private static const string ID = "id";
    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#drive".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";

    /**
    * The name of this shared drive.
    * The value may be {@code null}.
    */    
    private static const string NAME = "name";

    /**
    * A set of restrictions that apply to this shared drive or items inside this shared drive.
    * The value may be {@code null}.
    */    
    private static const string RESTRICTIONS = "restrictions";
    /**
    * The ID of the theme from which the background image and color will be set. The set of possible
    * driveThemes can be retrieved from a drive.about.get response. When not specified on a
    * drive.drives.create request, a random theme is chosen from which the background image and color
    * are set. This is a write-only field; it can only be set on requests that don't set colorRgb or
    * backgroundImageFile.
    * The value may be {@code null}.
    */
    private static const string THEME_ID = "themeId";
    /**
    * An image file and cropping parameters from which a background image for this shared drive is
    * set. This is a write only field; it can only be set on drive.drives.update requests that don't
    * set themeId. When specified, all fields of the backgroundImageFile must be set.
    * @return value or {@code null} for none
    */
    import gdrive.drive;
    mixin(gdrive.drive.Drive.GetterSetterAgregateType!("BackgroundImageFile", "Drive")(BACKGROUND_IMAGE_FILE));

    /**
    * A short-lived link to this shared drive's background image.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(string, "Drive")(BACKGROUND_IMAGE_LINK));

    /**
    * Capabilities the current user has on this shared drive.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterAgregateType!("Capabilities", "Drive")(CAPABILITIES));

    /**
    * The color of this shared drive as an RGB hex string. It can only be set on a
    * drive.drives.update request that does not set themeId.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(string, "Drive")(COLOR_RGB));

    /**
    * The time at which the shared drive was created (RFC 3339 date-time).
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(SysTime, "Drive")(CREATED_TIME));

    /**
    * Whether the shared drive is hidden from default view.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Drive")(HIDDEN));

    /**
    * The ID of this shared drive which is also the ID of the top level folder of this shared drive.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(string, "Drive")(ID));

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#drive".
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(string, "Drive")(KIND));

    /**
    * The name of this shared drive.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(string, "Drive")(NAME));

    /**
    * A set of restrictions that apply to this shared drive or items inside this shared drive.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterAgregateType!("Restrictions", "Drive")(RESTRICTIONS));

    /**
    * The ID of the theme from which the background image and color will be set. The set of possible
    * driveThemes can be retrieved from a drive.about.get response. When not specified on a
    * drive.drives.create request, a random theme is chosen from which the background image and color
    * are set. This is a write-only field; it can only be set on requests that don't set colorRgb or
    * backgroundImageFile.
    * @return value or {@code null} for none
    */
    mixin(gdrive.drive.Drive.GetterSetterBasicType!(string, "Drive")(THEME_ID));
    /**
    * An image file and cropping parameters from which a background image for this shared drive is set.
    * This is a write only field; it can only be set on drive.drives.update requests that don't set
    * themeId. When specified, all fields of the backgroundImageFile must be set.
    */
    public final struct BackgroundImageFile {
        JSONValue container;
        alias container this;
        /**
        * The ID of an image file in Google Drive to use for the background image.
        * The value may be {@code null}.
        */
        private static const string ID = "id";

        /**
        * The width of the cropped image in the closed range of 0 to 1. This value represents the width
        * of the cropped image divided by the width of the entire image. The height is computed by
        * applying a width to height aspect ratio of 80 to 9. The resulting image must be at least 1280
        * pixels wide and 144 pixels high.
        * The value may be {@code null}.
        */
        private static const string WIDTH = "width";

        /**
        * The X coordinate of the upper left corner of the cropping area in the background image. This is
        * a value in the closed range of 0 to 1. This value represents the horizontal distance from the
        * left side of the entire image to the left side of the cropping area divided by the width of the
        * entire image.
        * The value may be {@code null}.
        */
        private static const string X_COORDINATE = "xCoordinate";        

        /**
        * The Y coordinate of the upper left corner of the cropping area in the background image. This is
        * a value in the closed range of 0 to 1. This value represents the vertical distance from the top
        * side of the entire image to the top side of the cropping area divided by the height of the
        * entire image.
        * The value may be {@code null}.
        */
        private static const string Y_COORDINATE = "yCoordinate";        

        /**
        * The ID of an image file in Google Drive to use for the background image.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(string, "BackgroundImageFile")(ID));

        /**
        * The width of the cropped image in the closed range of 0 to 1. This value represents the width
        * of the cropped image divided by the width of the entire image. The height is computed by
        * applying a width to height aspect ratio of 80 to 9. The resulting image must be at least 1280
        * pixels wide and 144 pixels high.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(float, "BackgroundImageFile")(WIDTH));

        /**
        * The X coordinate of the upper left corner of the cropping area in the background image. This is
        * a value in the closed range of 0 to 1. This value represents the horizontal distance from the
        * left side of the entire image to the left side of the cropping area divided by the width of the
        * entire image.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(float, "BackgroundImageFile")(X_COORDINATE));

        /**
        * The Y coordinate of the upper left corner of the cropping area in the background image. This is
        * a value in the closed range of 0 to 1. This value represents the vertical distance from the top
        * side of the entire image to the top side of the cropping area divided by the height of the
        * entire image.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(float, "BackgroundImageFile")(Y_COORDINATE));
    }

    /**
    * Capabilities the current user has on this shared drive.
    */
    public final struct Capabilities {
        JSONValue container;
        alias container this;
        /**
        * Whether the current user can add children to folders in this shared drive.
        * The value may be {@code null}.
        */
        private static const string CAN_ADD_CHILDREN = "canAddChildren";

        /**
        * Whether the current user can change the copyRequiresWriterPermission restriction of this shared
        * drive.
        * The value may be {@code null}.
        */
        private static const string CAN_CHANGE_COPY_REQUIRES_WRITER_PERMISSION_RESTRICTION =
            "canChangeCopyRequiresWriterPermissionRestriction";

        /**
        * Whether the current user can change the domainUsersOnly restriction of this shared drive.
        * The value may be {@code null}.
        */
        private static const string CAN_CHANGE_DOMAIN_USERS_ONLY_RESTRICTION =
            "canChangeDomainUsersOnlyRestriction";

        /**
        * Whether the current user can change the background of this shared drive.
        * The value may be {@code null}.
        */
        private static const string CAN_CHANGE_DRIVE_BACKGROUND = "canChangeDriveBackground";

        /**
        * Whether the current user can change the driveMembersOnly restriction of this shared drive.
        * The value may be {@code null}.
        */
        private static const string CAN_CHANGE_DRIVE_MEMBERS_ONLY_RESTRICTION =
            "canChangeDriveMembersOnlyRestriction";

        /**
        * Whether the current user can comment on files in this shared drive.
        * The value may be {@code null}.
        */
        private static const string CAN_COMMENT = "canComment";

        /**
        * Whether the current user can copy files in this shared drive.
        * The value may be {@code null}.
        */
        private static const string CAN_COPY = "canCopy";

        /**
        * Whether the current user can delete children from folders in this shared drive.
        * The value may be {@code null}.
        */
        private static const string CAN_DELETE_CHILDREN = "canDeleteChildren";

        /**
        * Whether the current user can delete this shared drive. Attempting to delete the shared drive
        * may still fail if there are untrashed items inside the shared drive.
        * The value may be {@code null}.
        */
        private static const string CAN_DELETE_DRIVE = "canDeletDrive";

        /**
        * Whether the current user can download files in this shared drive.
        * The value may be {@code null}.
        */
        private static const string CAN_DOWNLOAD = "canDownload";

        /**
        * Whether the current user can edit files in this shared drive
        * The value may be {@code null}.
        */
        private static const string CAN_EDIT = "canEdit";        

        /**
        * Whether the current user can list the children of folders in this shared drive.
        * The value may be {@code null}.
        */
        private static const string CAN_LIST_CHILDREN = "canListChildren";        

        /**
        * Whether the current user can add members to this shared drive or remove them or change their
        * role.
        * The value may be {@code null}.
        */
        private static const string CAN_MANAGE_MEMBERS = "canManageMembers";        

        /**
        * Whether the current user can read the revisions resource of files in this shared drive.
        * The value may be {@code null}.
        */
        private static const string CAN_READ_REVISIONS = "canReadRevisions";

        /**
        * Whether the current user can rename files or folders in this shared drive.
        * The value may be {@code null}.
        */
        private static const string CAN_RENAME = "canRename";        

        /**
        * Whether the current user can rename this shared drive.
        * The value may be {@code null}.
        */
        private static const string CAN_RENAME_DRIVE = "canRenameDrive";

        /**
        * Whether the current user can share files or folders in this shared drive.
        * The value may be {@code null}.
        */
        private static const string CAN_SHARE = "canShare";        

        /**
        * Whether the current user can trash children from folders in this shared drive.
        * The value may be {@code null}.
        */
        private static const string CAN_THRASH_CHILDREN = "canThrashChildren";        

        /**
        * Whether the current user can add children to folders in this shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_ADD_CHILDREN));

        /**
        * Whether the current user can change the copyRequiresWriterPermission restriction of this shared
        * drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")
            (CAN_CHANGE_COPY_REQUIRES_WRITER_PERMISSION_RESTRICTION));

        /**
        * Whether the current user can change the domainUsersOnly restriction of this shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_CHANGE_DOMAIN_USERS_ONLY_RESTRICTION));

        /**
        * Whether the current user can change the background of this shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_CHANGE_DRIVE_BACKGROUND));

        /**
        * Whether the current user can change the driveMembersOnly restriction of this shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_CHANGE_DRIVE_MEMBERS_ONLY_RESTRICTION));

        /**
        * Whether the current user can comment on files in this shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_COMMENT));

        /**
        * Whether the current user can copy files in this shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_COPY));

        /**
        * Whether the current user can delete children from folders in this shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_DELETE_CHILDREN));

        /**
        * Whether the current user can delete this shared drive. Attempting to delete the shared drive
        * may still fail if there are untrashed items inside the shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_DELETE_DRIVE));

        /**
        * Whether the current user can download files in this shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_DOWNLOAD));

        /**
        * Whether the current user can edit files in this shared drive
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_EDIT));

        /**
        * Whether the current user can list the children of folders in this shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_LIST_CHILDREN));

        /**
        * Whether the current user can add members to this shared drive or remove them or change their
        * role.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_MANAGE_MEMBERS));

        /**
        * Whether the current user can read the revisions resource of files in this shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_READ_REVISIONS));

        /**
        * Whether the current user can rename files or folders in this shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_RENAME));

        /**
        * Whether the current user can rename this shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_RENAME_DRIVE));

        /**
        * Whether the current user can share files or folders in this shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_SHARE));

        /**
        * Whether the current user can trash children from folders in this shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_THRASH_CHILDREN));
    }

    /**
    * A set of restrictions that apply to this shared drive or items inside this shared drive.
    */
    public final struct Restrictions {
        JSONValue container;
        alias container this;
        /**
        * Whether administrative privileges on this shared drive are required to modify restrictions.
        * The value may be {@code null}.
        */
        private static const string ADMIN_MANAGED_RESTRICTIONS = "adminManagedRestrictions";

        /**
        * Whether the options to copy, print, or download files inside this shared drive, should be
        * disabled for readers and commenters. When this restriction is set to true, it will override the
        * similarly named field to true for any file inside this shared drive.
        * The value may be {@code null}.
        */
        private static const string COPY_REQUIRES_WRITER_PERMISSION = "copyRequiresWriterPermission";

        /**
        * Whether access to this shared drive and items inside this shared drive is restricted to users
        * of the domain to which this shared drive belongs. This restriction may be overridden by other
        * sharing policies controlled outside of this shared drive.
        * The value may be {@code null}.
        */
        private static const string DOMAIN_USERS_ONLY = "domainUsersOnly";

        /**
        * Whether access to items inside this shared drive is restricted to its members.
        * The value may be {@code null}.
        */
        private static const string DRIVE_MEMBERS_ONLY = "driveMembersOnly";

        /**
        * Whether administrative privileges on this shared drive are required to modify restrictions.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Restrictions")(ADMIN_MANAGED_RESTRICTIONS));

        /**
        * Whether the options to copy, print, or download files inside this shared drive, should be
        * disabled for readers and commenters. When this restriction is set to true, it will override the
        * similarly named field to true for any file inside this shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Restrictions")(COPY_REQUIRES_WRITER_PERMISSION));

        /**
        * Whether access to this shared drive and items inside this shared drive is restricted to users
        * of the domain to which this shared drive belongs. This restriction may be overridden by other
        * sharing policies controlled outside of this shared drive.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Restrictions")(DOMAIN_USERS_ONLY));

        /**
        * Whether access to items inside this shared drive is restricted to its members.
        * @return value or {@code null} for none
        */
        mixin(gdrive.drive.Drive.GetterSetterBasicType!(bool, "Restrictions")(DRIVE_MEMBERS_ONLY));
    }    
}