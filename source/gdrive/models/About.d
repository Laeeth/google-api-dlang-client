module gdrive.models.About;

import gdrive.drive;
import std.json;
import std.datetime : SysTime;
import std.typecons : Nullable, nullable;
import std.conv : to;

public struct About {
    JSONValue container;
    alias container this;

    /**
    * Whether the user has installed the requesting app.
    * The value may be {@code null}.
    */
    private static const string APP_INSTALLED = "appInstalled";

    /**
    * Whether the user can create shared drives.
    * The value may be {@code null}.
    */
    private static const string CAN_CREATE_DRIVES = "canCreateDrives";

    /**
    * Deprecated - use canCreateDrives instead.
    * The value may be {@code null}.
    */
    private static const string CAN_CREATE_TEAM_DRIVES = "canCreateTeamDrives";

    /**
    * A list of themes that are supported for shared drives.
    * The value may be {@code null}.
    */
    private static const string DRIVE_THEMES = "driveThemes";

    /**
    * A map of source MIME type to possible targets for all supported exports.
    * The value may be {@code null}.
    */
    private static const string EXPORT_FORMATS = "exportFormats";

    /**
    * The currently supported folder colors as RGB hex strings.
    * The value may be {@code null}.
    */
    private static const string FOLDER_COLOR_PALETTE = "folderColorPalette";

    /**
    * A map of source MIME type to possible targets for all supported imports.
    * The value may be {@code null}.
    */
    private static const string IMPORT_FORMATS = "importFormats";

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#about".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";

    /**
    * A map of maximum import sizes by MIME type, in bytes.
    * The value may be {@code null}.
    */
    private static const string MAX_IMPORT_SIZES = "maxImportSizes";

    /**
    * The maximum upload size in bytes.
    * The value may be {@code null}.
    */
    private static const string MAX_UPLOAD_SIZE = "maxUploadSize";

    /**
    * The user's storage quota limits and usage. All fields are measured in bytes.
    * The value may be {@code null}.
    */
    private static const string STORAGE_QUOTA = "storageQuota";

    /**
    * Deprecated - use driveThemes instead.
    * The value may be {@code null}.
    */
    private static const string TEAM_DRIVE_THEMES = "teamDriveThemes";

    /**
    * The authenticated user.
    * The value may be {@code null}.
    */
    //public User user;
    import gdrive.drive : Drive;
    /**
    * Whether the user has installed the requesting app.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "About")(APP_INSTALLED));

    /**
    * Whether the user can create shared drives.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "About")(CAN_CREATE_DRIVES));

    /**
    * Deprecated - use canCreateDrives instead.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "About")(CAN_CREATE_TEAM_DRIVES));

    /**
    * A list of themes that are supported for shared drives.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("DriveThemes[]", "About")(DRIVE_THEMES));

    /**
    * A map of source MIME type to possible targets for all supported exports.
    * @return value or {@code null} for none
    */
    
    mixin(Drive.GetterSetterAssocArray!("string[]", "string[][string]", "About")(EXPORT_FORMATS));

    /**
    * The currently supported folder colors as RGB hex strings.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string[], "About")(FOLDER_COLOR_PALETTE));

    /**
    * A map of source MIME type to possible targets for all supported imports.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAssocArray!("string[]", "string[][string]", "About")(IMPORT_FORMATS));
    

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#about".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "About")(KIND));

    /**
    * A map of maximum import sizes by MIME type, in bytes.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAssocArray!("long", "long[string]", "About")(MAX_IMPORT_SIZES));

    /**
    * The maximum upload size in bytes.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(long, "About")(MAX_UPLOAD_SIZE));

    /**
    * The user's storage quota limits and usage. All fields are measured in bytes.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("StorageQuota", "About")(STORAGE_QUOTA));

    /**
    * Deprecated - use driveThemes instead.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("TeamDriveThemes", "About")(TEAM_DRIVE_THEMES));

    /**
    * The authenticated user.
    * @return value or {@code null} for none
    
    public User getUser() {
        return user;
    } */

    /**
    * The authenticated user.
    * @param user user or {@code null} for none
    
    public About setUser(User user) {
        this.user = user;
        return this;
    }

    /*
    @Override
    public About set(String fieldName, Object value) {
    return (About) super.set(fieldName, value);
    }

    @Override
    public About clone() {
    return (About) super.clone();
    }
    */
    /**
    * Model definition for AboutDriveThemes.
    */
    public struct DriveThemes {
        JSONValue container;
        alias container this;
        /**
            * A link to this theme's background image.
            * The value may be {@code null}.
            */
        public string backgroundImageLink;
        private static const string BACKGROUND_IMAGE_LINK = "backgroundImageLink";

        /**
            * The color of this theme as an RGB hex string.
            * The value may be {@code null}.
            */
        public string colorRgb;
        private static const string COLOR_RGB = "colorRgb";
        /**
            * The ID of the theme.
            * The value may be {@code null}.
            */
        public string id;
        private static const string ID = "id";
        /**
            * A link to this theme's background image.
            * @return value or {@code null} for none
            */
        public string getBackgroundImageLink() {
            if (BACKGROUND_IMAGE_LINK in this) {
                return this[BACKGROUND_IMAGE_LINK].toJSON;
            }
            return string.init;
        }

        /**
            * A link to this theme's background image.
            * @param backgroundImageLink backgroundImageLink or {@code null} for none
            */
        public DriveThemes setBackgroundImageLink(string backgroundImageLink) {
            this[BACKGROUND_IMAGE_LINK] = JSONValue(backgroundImageLink);
            return this;
        }

        /**
            * The color of this theme as an RGB hex string.
            * @return value or {@code null} for none
            */
        public string getColorRgb() {
            if (COLOR_RGB in this) {
                return this[COLOR_RGB].toJSON;
            }
            return string.init;
        }

        /**
            * The color of this theme as an RGB hex string.
            * @param colorRgb colorRgb or {@code null} for none
            */
        public DriveThemes setColorRgb(string colorRgb) {
            this[COLOR_RGB] = JSONValue(colorRgb);
            return this;
        }

        /**
            * The ID of the theme.
            * @return value or {@code null} for none
            */
        public string getId() {
            if (ID in this) {
                return this[ID].toJSON;
            }
            return string.init;
        }

        /**
            * The ID of the theme.
            * @param id id or {@code null} for none
            */
        public DriveThemes setId(string id) {
            this[ID] = JSONValue(id);
            return this;
        }
    }

    /**
    * The user's storage quota limits and usage. All fields are measured in bytes.
    */
    public struct StorageQuota {
        JSONValue container;
        alias container this;
        /**
            * The usage limit, if applicable. This will not be present if the user has unlimited storage.
            * The value may be {@code null}.
            */
        public long limit;
        private static const string LIMIT = "limit";
        /**
            * The total usage across all services.
            * The value may be {@code null}.
            */
        public long usage;
        private static const string USAGE = "usage";
        /**
            * The usage by all files in Google Drive.
            * The value may be {@code null}.
            */
        public long usageInDrive;
        private static const string USAGE_IN_DRIVE = "usageInDrive";
        /**
            * The usage by trashed files in Google Drive.
            * The value may be {@code null}.
            */
        public long usageInDriveTrash;
        private static const string USAGE_IN_DRIVE_THRASH = "usageInDriveThrash";
        /**
            * The usage limit, if applicable. This will not be present if the user has unlimited storage.
            * @return value or {@code null} for none
            */
        public long getLimit() {
            if (LIMIT in this) {
                return to!(long)(this[LIMIT].toJSON);
            }
            return long.init;
        }

        /**
            * The usage limit, if applicable. This will not be present if the user has unlimited storage.
            * @param limit limit or {@code null} for none
            */
        public StorageQuota setLimit(long limit) {
            this[LIMIT] = JSONValue(limit);
            return this;
        }

        /**
            * The total usage across all services.
            * @return value or {@code null} for none
            */
        public long getUsage() {
            if (USAGE in this) {
                return to!(long)(this[USAGE].toJSON);
            }
            return long.init;
        }

        /**
            * The total usage across all services.
            * @param usage usage or {@code null} for none
            */
        public StorageQuota setUsage(long usage) {
            this[USAGE] = JSONValue(usage);
            return this;
        }

        /**
            * The usage by all files in Google Drive.
            * @return value or {@code null} for none
            */
        public long getUsageInDrive() {
            if (USAGE_IN_DRIVE in this) {
                return to!(long)(this[USAGE_IN_DRIVE].toJSON);
            }
            return long.init;
        }

        /**
            * The usage by all files in Google Drive.
            * @param usageInDrive usageInDrive or {@code null} for none
            */
        public StorageQuota setUsageInDrive(long usageInDrive) {
            this[USAGE_IN_DRIVE] = JSONValue(usageInDrive);
            return this;
        }

        /**
            * The usage by trashed files in Google Drive.
            * @return value or {@code null} for none
            */
        public long getUsageInDriveTrash() {
            if (USAGE_IN_DRIVE_THRASH in this) {
                return to!(long)(this[USAGE_IN_DRIVE_THRASH].toJSON);
            }
            return long.init;
        }

        /**
            * The usage by trashed files in Google Drive.
            * @param usageInDriveTrash usageInDriveTrash or {@code null} for none
            */
        public StorageQuota setUsageInDriveTrash(long usageInDriveTrash) {
            this[USAGE_IN_DRIVE_THRASH] = JSONValue(usageInDriveTrash);
            return this;
        }
    }

    /**
    * Model definition for AboutTeamDriveThemes.
    */
    public struct TeamDriveThemes {
        JSONValue container;
        alias container this;
        /**
            * Deprecated - use driveThemes/backgroundImageLink instead.
            * The value may be {@code null}.
            */
        public string backgroundImageLink;
        private static const string BACKGROUND_IMAGE_LINK = "backgroundImageLink";
        /**
            * Deprecated - use driveThemes/colorRgb instead.
            * The value may be {@code null}.
            */
        public string colorRgb;
        private static const string COLOR_RGB = "colorRgb";
        /**
            * Deprecated - use driveThemes/id instead.
            * The value may be {@code null}.
            */
        public string id;
        private static const string ID = "id";
        /**
            * Deprecated - use driveThemes/backgroundImageLink instead.
            * @return value or {@code null} for none
            */
        public string getBackgroundImageLink() {
            if (BACKGROUND_IMAGE_LINK in this) {
                return this[BACKGROUND_IMAGE_LINK].toJSON;
            }
            return string.init;
        }

        /**
            * Deprecated - use driveThemes/backgroundImageLink instead.
            * @param backgroundImageLink backgroundImageLink or {@code null} for none
            */
        public TeamDriveThemes setBackgroundImageLink(string backgroundImageLink) {
            this[BACKGROUND_IMAGE_LINK] = JSONValue(backgroundImageLink);
            return this;
        }

        /**
            * Deprecated - use driveThemes/colorRgb instead.
            * @return value or {@code null} for none
            */
        public string getColorRgb() {
            if (COLOR_RGB in this) {
                return this[COLOR_RGB].toJSON;
            }
            return string.init;
        }

        /**
            * Deprecated - use driveThemes/colorRgb instead.
            * @param colorRgb colorRgb or {@code null} for none
            */
        public TeamDriveThemes setColorRgb(string colorRgb) {
            this[COLOR_RGB] = JSONValue(colorRgb);
            return this;
        }

        /**
            * Deprecated - use driveThemes/id instead.
            * @return value or {@code null} for none
            */
        public string getId() {
            if (ID in this) {
                return this[ID].toJSON;
            }
            return string.init;
        }

        /**
            * Deprecated - use driveThemes/id instead.
            * @param id id or {@code null} for none
            */
        public TeamDriveThemes setId(string id) {
            this[ID] = JSONValue(id);
            return this;
        }
    }
}