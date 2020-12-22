module gdrive.models.File;

import gdrive.drive;
import gdrive.models.ContentRestriction;
import gdrive.models.Permission;
import std.json;
import std.datetime : SysTime;
import std.conv : to;
import std.typecons : Nullable, nullable;

public final struct File {
    JSONValue container;
    alias container this;

    /**
    * A collection of arbitrary key-value pairs which are private to the requesting app. Entries with
    * null values are cleared in update and copy requests. These properties can only be retrieved
    * using an authenticated request. An authenticated request uses an access token obtained with a
    * OAuth 2 client ID. You cannot use an API key to retrieve private properties.
    * The value may be {@code null}.
    */
    private static const string APP_PROPERTIES = "appProperties";

    /**
    * Capabilities the current user has on this file. Each capability corresponds to a fine-grained
    * action that a user may take.
    * The value may be {@code null}.
    */
    private static const string CAPABILITIES = "capabilities";

    /**
    * Additional information about the content of the file. These fields are never populated in
    * responses.
    * The value may be {@code null}.
    */
    private static const string CONTENT_HINTS = "contentHints";

    /**
    * Restrictions for accessing the content of the file. Only populated if such a restriction
    * exists.
    * The value may be {@code null}.
    */
    private static const string CONTENT_RESTRICTIONS = "contentRestrictions";

    /**
    * Whether the options to copy, print, or download this file, should be disabled for readers and
    * commenters.
    * The value may be {@code null}.
    */
    private static const string COPY_REQUIRES_WRITER_PERMISSION = "copyRequiresWriterPermission";

    /**
    * The time at which the file was created (RFC 3339 date-time).
    * The value may be {@code null}.
    */
    private static const string CREATED_TIME = "createdTime";

    /**
    * A short description of the file.
    * The value may be {@code null}.
    */
    private static const string DESCRIPTION = "description";

    /**
    * ID of the shared drive the file resides in. Only populated for items in shared drives.
    * The value may be {@code null}.
    */
    private static const string DRIVE_ID = "driveId";

    /**
    * Whether the file has been explicitly trashed, as opposed to recursively trashed from a parent
    * folder.
    * The value may be {@code null}.
    */
    private static const string EXPLICITLY_TRASHED = "explicitlyTrashed";

    /**
    * Links for exporting Docs Editors files to specific formats.
    * The value may be {@code null}.
    */
    private static const string EXPORT_LINKS = "exportLinks";

    /**
    * The final component of fullFileExtension. This is only available for files with binary content
    * in Google Drive.
    * The value may be {@code null}.
    */
    private static const string FILE_EXTENSION = "fileExtension";

    /**
    * The color for a folder as an RGB hex string. The supported colors are published in the
    * folderColorPalette field of the About resource. If an unsupported color is specified, the
    * closest color in the palette will be used instead.
    * The value may be {@code null}.
    */
    private static const string FOLDER_COLOR_RGB = "folderColorRgb";

    /**
    * The full file extension extracted from the name field. May contain multiple concatenated
    * extensions, such as "tar.gz". This is only available for files with binary content in Google
    * Drive. This is automatically updated when the name field changes, however it is not cleared if
    * the new name does not contain a valid extension.
    * The value may be {@code null}.
    */
    private static const string FULL_FILE_EXTENSION = "fullFileExtension";

    /**
    * Whether there are permissions directly on this file. This field is only populated for items in
    * shared drives.
    * The value may be {@code null}.
    */
    private static const string HAS_AUGMENTED_PERMISSIONS = "hasAugmentedPermissions";

    /**
    * Whether this file has a thumbnail. This does not indicate whether the requesting app has access
    * to the thumbnail. To check access, look for the presence of the thumbnailLink field.
    * The value may be {@code null}.
    */
    private static const string HAS_THUMBNAIL = "hasThumbnail";

    /**
    * The ID of the file's head revision. This is currently only available for files with binary
    * content in Google Drive.
    * The value may be {@code null}.
    */
    private static const string HEAD_REVISION_ID = "headRevisionId";

    /**
    * A static, unauthenticated link to the file's icon.
    * The value may be {@code null}.
    */
    private static const string ICON_LINK = "iconLink";

    /**
    * The ID of the file.
    * The value may be {@code null}.
    */
    private static const string ID = "id";

    /**
    * Additional metadata about image media, if available.
    * The value may be {@code null}.
    */
    private static const string IMAGE_MEDIA_METADATA = "imageMediaMetadata";

    /**
    * Whether the file was created or opened by the requesting app.
    * The value may be {@code null}.
    */
    private static const string IS_APP_AUTHORIZED = "isAppAuthorized";

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#file".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";

    /**
    * The last user to modify the file.
    * The value may be {@code null}.
    */

    //private User lastModifyingUser;

    /**
    * The MD5 checksum for the content of the file. This is only applicable to files with binary
    * content in Google Drive.
    * The value may be {@code null}.
    */
    private static const string MD5_CHECKSUM = "md5Checksum";

    /**
    * The MIME type of the file. Google Drive will attempt to automatically detect an appropriate
    * value from uploaded content if no value is provided. The value cannot be changed unless a new
    * revision is uploaded. If a file is created with a Google Doc MIME type, the uploaded content
    * will be imported if possible. The supported import formats are published in the About resource.
    * The value may be {@code null}.
    */
    private static const string MIME_TYPE = "mimeType";

    /**
    * Whether the file has been modified by this user.
    * The value may be {@code null}.
    */
    private static const string MODIFIED_BY_ME = "modifiedByMe";

    /**
    * The last time the file was modified by the user (RFC 3339 date-time).
    * The value may be {@code null}.
    */
    private static const string MODIFIED_BY_ME_TIME = "modifiedByMeTime";

    /**
    * The last time the file was modified by anyone (RFC 3339 date-time). Note that setting
    * modifiedTime will also update modifiedByMeTime for the user.
    * The value may be {@code null}.
    */
    private static const string MODIFIED_TIME = "modifiedTime";

    /**
    * The name of the file. This is not necessarily unique within a folder. Note that for immutable
    * items such as the top level folders of shared drives, My Drive root folder, and Application
    * Data folder the name is constant.
    * The value may be {@code null}.
    */
    private static const string NAME = "name";

    /**
    * The original filename of the uploaded content if available, or else the original value of the
    * name field. This is only available for files with binary content in Google Drive.
    * The value may be {@code null}.
    */
    private static const string ORIGINAL_FILENAME = "originalFilename";

    /**
    * Whether the user owns the file. Not populated for items in shared drives.
    * The value may be {@code null}.
    */
    private static const string OWNED_BY_ME = "ownedByMe";

    /**
    * The owners of the file. Currently, only certain legacy files may have more than one owner. Not
    * populated for items in shared drives.
    * The value may be {@code null}.
    */
    private static const string OWNERS = "owners";
    //private java.util.List<User> owners;

    /**
    * The IDs of the parent folders which contain the file. If not specified as part of a create
    * request, the file will be placed directly in the user's My Drive folder. If not specified as
    * part of a copy request, the file will inherit any discoverable parents of the source file.
    * Update requests must use the addParents and removeParents parameters to modify the parents
    * list.
    * The value may be {@code null}.
    */
    private static const string PARENTS = "parents";

    /**
    * List of permission IDs for users with access to this file.
    * The value may be {@code null}.
    */
    private static const string PERMISSION_IDS = "permissionIds";

    /**
    * The full list of permissions for the file. This is only available if the requesting user can
    * share the file. Not populated for items in shared drives.
    * The value may be {@code null}.
    */
    private static const string PERMISSIONS = "permissions";

    /**
    * A collection of arbitrary key-value pairs which are visible to all apps. Entries with null
    * values are cleared in update and copy requests.
    * The value may be {@code null}.
    */
    private static const string PROPERTIES = "properties";

    /**
    * The number of storage quota bytes used by the file. This includes the head revision as well as
    * previous revisions with keepForever enabled.
    * The value may be {@code null}.
    */
    private static const string QUOTA_BYTES_USED = "quotaBytesUsed";

    /**
    * Whether the file has been shared. Not populated for items in shared drives.
    * The value may be {@code null}.
    */
    private static const string SHARED = "shared";

    /**
    * The time at which the file was shared with the user, if applicable (RFC 3339 date-time).
    * The value may be {@code null}.
    */
    private static const string SHARED_WITH_ME_TIME = "sharedWithMeTime";

    /**
    * The user who shared the file with the requesting user, if applicable.
    * The value may be {@code null}.
    */

    //private User sharingUser;

    /**
    * Shortcut file details. Only populated for shortcut files, which have the mimeType field set to
    * application/vnd.google-apps.shortcut.
    * The value may be {@code null}.
    */
    private static const string SHORTCUT_DETAILS = "shortcutDetails";

    /**
    * The size of the file's content in bytes. This is applicable to binary files in Google Drive and
    * Google Docs files.
    * The value may be {@code null}.
    */
    private static const string SIZE = "size";

    /**
    * The list of spaces which contain the file. The currently supported values are 'drive',
    * 'appDataFolder' and 'photos'.
    * The value may be {@code null}.
    */
    private static const string SPACES = "spaces";

    /**
    * Whether the user has starred the file.
    * The value may be {@code null}.
    */
    private static const string STARRED = "starred";

    /**
    * Deprecated - use driveId instead.
    * The value may be {@code null}.
    */
    private static const string TEAM_DRIVE_ID = "teamDriveId";

    /**
    * A short-lived link to the file's thumbnail, if available. Typically lasts on the order of
    * hours. Only populated when the requesting app can access the file's content. If the file isn't
    * shared publicly, the URL returned in Files.thumbnailLink must be fetched using a credentialed
    * request.
    * The value may be {@code null}.
    */
    private static const string THUMBNAIL_LINK = "thumbnailLink";

    /**
    * The thumbnail version for use in thumbnail cache invalidation.
    * The value may be {@code null}.
    */
    private static const string THUMBNAIL_VERSION = "thumbnailVersion";

    /**
    * Whether the file has been trashed, either explicitly or from a trashed parent folder. Only the
    * owner may trash a file. The trashed item is excluded from all files.list responses returned for
    * any user who does not own the file. However, all users with access to the file can see the
    * trashed item metadata in an API response. All users with access can copy, download, export, and
    * share the file.
    * The value may be {@code null}.
    */
    private static const string TRASHED = "trashed";

    /**
    * The time that the item was trashed (RFC 3339 date-time). Only populated for items in shared
    * drives.
    * The value may be {@code null}.
    */
    private static const string TRASHED_TIME = "trashedTime";

    /**
    * If the file has been explicitly trashed, the user who trashed it. Only populated for items in
    * shared drives.
    * The value may be {@code null}.
    */

    //private User trashingUser;

    /**
    * A monotonically increasing version number for the file. This reflects every change made to the
    * file on the server, even those not visible to the user.
    * The value may be {@code null}.
    */
    private static const string VERSION = "version";

    /**
    * Additional metadata about video media. This may not be available immediately upon upload.
    * The value may be {@code null}.
    */
    private static const string VIDEO_MEDIA_METADATA = "videoMediaMetadata";

    /**
    * Whether the file has been viewed by this user.
    * The value may be {@code null}.
    */
    private static const string VIEWED_BY_ME = "viewedByMe";

    /**
    * The last time the file was viewed by the user (RFC 3339 date-time).
    * The value may be {@code null}.
    */
    private static const string VIEWED_BY_ME_TIME = "viewedByMeTime";

    /**
    * Deprecated - use copyRequiresWriterPermission instead.
    * The value may be {@code null}.
    */
    private static const string VIEWERS_CAN_COPY_CONTENT = "viewersCanCopyContent";

    /**
    * A link for downloading the content of the file in a browser. This is only available for files
    * with binary content in Google Drive.
    * The value may be {@code null}.
    */
    private static const string WEB_CONTENT_LINK = "webContentLink";

    /**
    * A link for opening the file in a relevant Google editor or viewer in a browser.
    * The value may be {@code null}.
    */
    private static const string WEB_VIEW_LINK = "webViewLink";

    /**
    * Whether users with only writer permission can modify the file's permissions. Not populated for
    * items in shared drives.
    * The value may be {@code null}.
    */
    private static const string WRITERS_CAN_SHARE = "writersCanShare";

    /**
    * A collection of arbitrary key-value pairs which are private to the requesting app. Entries with
    * null values are cleared in update and copy requests. These properties can only be retrieved
    * using an authenticated request. An authenticated request uses an access token obtained with a
    * OAuth 2 client ID. You cannot use an API key to retrieve private properties.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAssocArray!("string", "string[string]", "File")(APP_PROPERTIES));

    /**
    * Capabilities the current user has on this file. Each capability corresponds to a fine-grained
    * action that a user may take.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("Capabilities", "File")(CAPABILITIES));

    /**
    * Additional information about the content of the file. These fields are never populated in
    * responses.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("ContentHints", "File")(CONTENT_HINTS));

    /**
    * Restrictions for accessing the content of the file. Only populated if such a restriction
    * exists.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("ContentRestriction[]", "File")(CONTENT_RESTRICTIONS));

    /**
    * Whether the options to copy, print, or download this file, should be disabled for readers and
    * commenters.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "File")(COPY_REQUIRES_WRITER_PERMISSION));

    /**
    * The time at which the file was created (RFC 3339 date-time).
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(SysTime, "File")(CREATED_TIME));

    /**
    * A short description of the file.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(DESCRIPTION));

    /**
    * ID of the shared drive the file resides in. Only populated for items in shared drives.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(DRIVE_ID));

    /**
    * Whether the file has been explicitly trashed, as opposed to recursively trashed from a parent
    * folder.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "File")(EXPLICITLY_TRASHED));

    /**
    * Links for exporting Docs Editors files to specific formats.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAssocArray!("string", "string[string]", "File")(EXPORT_LINKS));

    /**
    * The final component of fullFileExtension. This is only available for files with binary content
    * in Google Drive.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(FILE_EXTENSION));

    /**
    * The color for a folder as an RGB hex string. The supported colors are published in the
    * folderColorPalette field of the About resource. If an unsupported color is specified, the
    * closest color in the palette will be used instead.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(FOLDER_COLOR_RGB));

    /**
    * The full file extension extracted from the name field. May contain multiple concatenated
    * extensions, such as "tar.gz". This is only available for files with binary content in Google
    * Drive. This is automatically updated when the name field changes, however it is not cleared if
    * the new name does not contain a valid extension.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(FULL_FILE_EXTENSION));

    /**
    * Whether there are permissions directly on this file. This field is only populated for items in
    * shared drives.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "File")(HAS_AUGMENTED_PERMISSIONS));

    /**
    * Whether this file has a thumbnail. This does not indicate whether the requesting app has access
    * to the thumbnail. To check access, look for the presence of the thumbnailLink field.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "File")(HAS_THUMBNAIL));

    /**
    * The ID of the file's head revision. This is currently only available for files with binary
    * content in Google Drive.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(HEAD_REVISION_ID));

    /**
    * A static, unauthenticated link to the file's icon.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(ICON_LINK));

    /**
    * The ID of the file.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(ID));

    /**
    * Additional metadata about image media, if available.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("ImageMediaMetadata", "File")(IMAGE_MEDIA_METADATA));

    /**
    * Whether the file was created or opened by the requesting app.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "File")(IS_APP_AUTHORIZED));

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#file".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(KIND));

    /**
    * The last user to modify the file.
    * @return value or {@code null} for none
    */
    // public User getLastModifyingUser() {
    // return lastModifyingUser;
    // }

    /**
    * The last user to modify the file.
    * @param lastModifyingUser lastModifyingUser or {@code null} for none
    */
    // public File setLastModifyingUser(User lastModifyingUser) {
    // this.lastModifyingUser = lastModifyingUser;
    // return this;
    // }

    /**
    * The MD5 checksum for the content of the file. This is only applicable to files with binary
    * content in Google Drive.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(MD5_CHECKSUM));

    /**
    * The MIME type of the file. Google Drive will attempt to automatically detect an appropriate
    * value from uploaded content if no value is provided. The value cannot be changed unless a new
    * revision is uploaded. If a file is created with a Google Doc MIME type, the uploaded content
    * will be imported if possible. The supported import formats are published in the About resource.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(MIME_TYPE));

    /**
    * Whether the file has been modified by this user.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "File")(MODIFIED_BY_ME));

    /**
    * The last time the file was modified by the user (RFC 3339 date-time).
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(SysTime, "File")(MODIFIED_BY_ME_TIME));

    /**
    * The last time the file was modified by anyone (RFC 3339 date-time). Note that setting
    * modifiedTime will also update modifiedByMeTime for the user.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(SysTime, "File")(MODIFIED_TIME));

    /**
    * The name of the file. This is not necessarily unique within a folder. Note that for immutable
    * items such as the top level folders of shared drives, My Drive root folder, and Application
    * Data folder the name is constant.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(NAME));

    /**
    * The original filename of the uploaded content if available, or else the original value of the
    * name field. This is only available for files with binary content in Google Drive.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(ORIGINAL_FILENAME));

    /**
    * Whether the user owns the file. Not populated for items in shared drives.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "File")(OWNED_BY_ME));

    /**
    * The owners of the file. Currently, only certain legacy files may have more than one owner. Not
    * populated for items in shared drives.
    * @return value or {@code null} for none
    */
    // public java.util.List<User> getOwners() {
    // return owners;
    // }

    /**
    * The owners of the file. Currently, only certain legacy files may have more than one owner. Not
    * populated for items in shared drives.
    * @param owners owners or {@code null} for none
    */
    // public File setOwners(java.util.List<User> owners) {
    // this.owners = owners;
    // return this;
    // }

    /**
    * The IDs of the parent folders which contain the file. If not specified as part of a create
    * request, the file will be placed directly in the user's My Drive folder. If not specified as
    * part of a copy request, the file will inherit any discoverable parents of the source file.
    * Update requests must use the addParents and removeParents parameters to modify the parents
    * list.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string[], "File")(PARENTS));

    /**
    * List of permission IDs for users with access to this file.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string[], "File")(PERMISSION_IDS));

    /**
    * The full list of permissions for the file. This is only available if the requesting user can
    * share the file. Not populated for items in shared drives.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("Permission[]", "File")(PERMISSIONS));

    /**
    * A collection of arbitrary key-value pairs which are visible to all apps. Entries with null
    * values are cleared in update and copy requests.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAssocArray!("string", "string[string]", "File")(PROPERTIES));

    /**
    * The number of storage quota bytes used by the file. This includes the head revision as well as
    * previous revisions with keepForever enabled.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(long, "File")(QUOTA_BYTES_USED));

    /**
    * Whether the file has been shared. Not populated for items in shared drives.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "File")(SHARED));

    /**
    * The time at which the file was shared with the user, if applicable (RFC 3339 date-time).
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(SysTime, "File")(SHARED_WITH_ME_TIME));

    /**
    * The user who shared the file with the requesting user, if applicable.
    * @return value or {@code null} for none
    */
    // public User getSharingUser() {
    // return sharingUser;
    // }

    /**
    * The user who shared the file with the requesting user, if applicable.
    * @param sharingUser sharingUser or {@code null} for none
    */
    // public File setSharingUser(User sharingUser) {
    // this.sharingUser = sharingUser;
    // return this;
    // }

    /**
    * Shortcut file details. Only populated for shortcut files, which have the mimeType field set to
    * application/vnd.google-apps.shortcut.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("ShortcutDetails", "File")(SHORTCUT_DETAILS));

    /**
    * The size of the file's content in bytes. This is applicable to binary files in Google Drive and
    * Google Docs files.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(long, "File")(SIZE));

    /**
    * The list of spaces which contain the file. The currently supported values are 'drive',
    * 'appDataFolder' and 'photos'.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string[], "File")(SPACES));

    /**
    * Whether the user has starred the file.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "File")(STARRED));

    /**
    * Deprecated - use driveId instead.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(TEAM_DRIVE_ID));

    /**
    * A short-lived link to the file's thumbnail, if available. Typically lasts on the order of
    * hours. Only populated when the requesting app can access the file's content. If the file isn't
    * shared publicly, the URL returned in Files.thumbnailLink must be fetched using a credentialed
    * request.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(THUMBNAIL_LINK));

    /**
    * The thumbnail version for use in thumbnail cache invalidation.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(long, "File")(THUMBNAIL_VERSION));

    /**
    * Whether the file has been trashed, either explicitly or from a trashed parent folder. Only the
    * owner may trash a file. The trashed item is excluded from all files.list responses returned for
    * any user who does not own the file. However, all users with access to the file can see the
    * trashed item metadata in an API response. All users with access can copy, download, export, and
    * share the file.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "File")(TRASHED));

    /**
    * The time that the item was trashed (RFC 3339 date-time). Only populated for items in shared
    * drives.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(SysTime, "File")(TRASHED_TIME));

    /**
    * If the file has been explicitly trashed, the user who trashed it. Only populated for items in
    * shared drives.
    * @return value or {@code null} for none
    */
    // public User getTrashingUser() {
    // return trashingUser;
    // }

    /**
    * If the file has been explicitly trashed, the user who trashed it. Only populated for items in
    * shared drives.
    * @param trashingUser trashingUser or {@code null} for none
    */
    // public File setTrashingUser(User trashingUser) {
    // this.trashingUser = trashingUser;
    // return this;
    // }

    /**
    * A monotonically increasing version number for the file. This reflects every change made to the
    * file on the server, even those not visible to the user.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(long, "File")(VERSION));

    /**
    * Additional metadata about video media. This may not be available immediately upon upload.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("VideoMediaMetadata", "File")(VIDEO_MEDIA_METADATA));

    /**
    * Whether the file has been viewed by this user.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "File")(VIEWED_BY_ME));

    /**
    * The last time the file was viewed by the user (RFC 3339 date-time).
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(SysTime, "File")(VIEWED_BY_ME_TIME));

    /**
    * Deprecated - use copyRequiresWriterPermission instead.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "File")(VIEWERS_CAN_COPY_CONTENT));

    /**
    * A link for downloading the content of the file in a browser. This is only available for files
    * with binary content in Google Drive.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(WEB_CONTENT_LINK));

    /**
    * A link for opening the file in a relevant Google editor or viewer in a browser.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "File")(WEB_VIEW_LINK));

    /**
    * Whether users with only writer permission can modify the file's permissions. Not populated for
    * items in shared drives.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "File")(WRITERS_CAN_SHARE));

    /**
    * Capabilities the current user has on this file. Each capability corresponds to a fine-grained
    * action that a user may take.
    */
    public  final struct Capabilities {
        JSONValue container;
        alias container this;
        /**
        * Whether the current user can add children to this folder. This is always false when the item is
        * not a folder.
        * The value may be {@code null}.
        */
        private static const string CAN_ADD_CHILDREN = "canAddChildren";

        /**
        * Whether the current user can add a folder from another drive (different shared drive or My
        * Drive) to this folder. This is false when the item is not a folder. Only populated for items in
        * shared drives.
        * The value may be {@code null}.
        */
        private static const string CAN_ADD_FOLDER_FROM_ANOTHER_DRIVE = "canAddFolderFromAnotherDrive";

        /**
        * Whether the current user can add a parent for the item without removing an existing parent in
        * the same request. Not populated for shared drive files.
        * The value may be {@code null}.
        */
        private static const string  CAN_ADD_MY_DRIVE_PARENT = "canAddMyDriveParent";

        /**
        * Whether the current user can change the copyRequiresWriterPermission restriction of this file.
        * The value may be {@code null}.
        */
        private static const string  CAN_CHANGE_COPY_REQUIRES_WRITER_PERMISSION =
            "canChangeCopyRequiresWritePermission";

        /**
        * Deprecated
        * The value may be {@code null}.
        */
        private static const string CAN_CHANGE_VIEWERS_CAN_COPY_CONTENT =
            "canChangeViewersCanCopyContent";

        /**
        * Whether the current user can comment on this file.
        * The value may be {@code null}.
        */
        private static const string CAN_COMMENT = "canComment";

        /**
        * Whether the current user can copy this file. For an item in a shared drive, whether the current
        * user can copy non-folder descendants of this item, or this item itself if it is not a folder.
        * The value may be {@code null}.
        */
        private static const string CAN_COPY = "canCopy";

        /**
        * Whether the current user can delete this file.
        * The value may be {@code null}.
        */
        private static const string CAN_DELETE = "canDelete";

        /**
        * Whether the current user can delete children of this folder. This is false when the item is not
        * a folder. Only populated for items in shared drives.
        * The value may be {@code null}.
        */
        private static const string CAN_DELETE_CHILDREN = "canDeleteChildren";

        /**
        * Whether the current user can download this file.
        * The value may be {@code null}.
        */
        private static const string CAN_DOWNLOAD = "canDownload";

        /**
        * Whether the current user can edit this file. Other factors may limit the type of changes a user
        * can make to a file. For example, see canChangeCopyRequiresWriterPermission or canModifyContent.
        * The value may be {@code null}.
        */
        private static const string CAN_EDIT = "canEdit";

        /**
        * Whether the current user can list the children of this folder. This is always false when the
        * item is not a folder.
        * The value may be {@code null}.
        */
        private static const string CAN_LIST_CHILDREN = "canListChildren";

        /**
        * Whether the current user can modify the content of this file.
        * The value may be {@code null}.
        */
        private static const string CAN_MODIFY_CONTENT = "canModifyContent";

        /**
        * Whether the current user can modify restrictions on content of this file.
        * The value may be {@code null}.
        */
        private static const string  CAN_MODIFY_CONTENT_RESTRICTION =
            "canModifyContentRestriction";

        /**
        * Whether the current user can move children of this folder outside of the shared drive. This is
        * false when the item is not a folder. Only populated for items in shared drives.
        * The value may be {@code null}.
        */
        private static const string CAN_MOVE_CHILDREN_OUT_OF_DRIVE =
            "canMoveChildrenOutOfDrive";

        /**
        * Deprecated - use canMoveChildrenOutOfDrive instead.
        * The value may be {@code null}.
        */
        private static const string CAN_MOVE_CHILDREN_OUT_OF_TEAM_DRIVE =
            "canMoveChildrenOutOfTeamDrive";

        /**
        * Whether the current user can move children of this folder within this drive. This is false when
        * the item is not a folder. Note that a request to move the child may still fail depending on the
        * current user's access to the child and to the destination folder.
        * The value may be {@code null}.
        */
        private static const string CAN_MOVE_CHILDREN_WITHIN_DRIVE =
            "canMoveChildrenWithinDrive";

        /**
        * Deprecated - use canMoveChildrenWithinDrive instead.
        * The value may be {@code null}.
        */
        private static const string CAN_MOVE_CHILDREN_WITHIN_TEAM_DRIVE =
            "canMoveChildrenWithinTeamDrive";

        /**
        * Deprecated - use canMoveItemOutOfDrive instead.
        * The value may be {@code null}.
        */
        private static const string CAN_MOVE_ITEM_INTO_TEAM_DRIVE =
            "canMoveItemIntoTeamDrive";

        /**
        * Whether the current user can move this item outside of this drive by changing its parent. Note
        * that a request to change the parent of the item may still fail depending on the new parent that
        * is being added.
        * The value may be {@code null}.
        */
        private static const string CAN_MOVE_ITEM_OUT_OF_DRIVE =
            "canMOveItemOutOfDrive";

        /**
        * Deprecated - use canMoveItemOutOfDrive instead.
        * The value may be {@code null}.
        */
        private static const string CAN_MOVE_ITEM_OUT_OF_TEAM_DRIVE =
            "canMoveItemOutOfTeamDrive";

        /**
        * Whether the current user can move this item within this drive. Note that a request to change
        * the parent of the item may still fail depending on the new parent that is being added and the
        * parent that is being removed.
        * The value may be {@code null}.
        */
        private static const string CAN_MOVE_ITEM_WITHIN_DRIVE =
            "canMoveItemWithinDrive";

        /**
        * Deprecated - use canMoveItemWithinDrive instead.
        * The value may be {@code null}.
        */
        private static const string CAN_MOVE_ITEM_WITHIN_TEAM_DRIVE =
            "canMoveItemWithinTeamDrive";

        /**
        * Deprecated - use canMoveItemWithinDrive or canMoveItemOutOfDrive instead.
        * The value may be {@code null}.
        */
        private static const string CAN_MOVE_TEAM_DRIVE_ITEM =
            "canMoveTeamDriveItem";

        /**
        * Whether the current user can read the shared drive to which this file belongs. Only populated
        * for items in shared drives.
        * The value may be {@code null}.
        */
        private static const string CAN_READ_DRIVE = "canReadDrive";

        /**
        * Whether the current user can read the revisions resource of this file. For a shared drive item,
        * whether revisions of non-folder descendants of this item, or this item itself if it is not a
        * folder, can be read.
        * The value may be {@code null}.
        */
        private static const string CAN_READ_REVISIONS = "canReadRevisions";

        /**
        * Deprecated - use canReadDrive instead.
        * The value may be {@code null}.
        */
        private static const string CAN_READ_TEAM_DRIVE = "canReadTeamDrive";

        /**
        * Whether the current user can remove children from this folder. This is always false when the
        * item is not a folder. For a folder in a shared drive, use canDeleteChildren or canTrashChildren
        * instead.
        * The value may be {@code null}.
        */
        private static const string CAN_REMOVE_CHILDREN = "canRemoveChildren";

        /**
        * Whether the current user can remove a parent from the item without adding another parent in the
        * same request. Not populated for shared drive files.
        * The value may be {@code null}.
        */
        private static const string CAN_REMOVE_MY_DRIVE_PARENT =
            "canRemoveMyDriveParent";

        /**
        * Whether the current user can rename this file.
        * The value may be {@code null}.
        */
        private static const string CAN_RENAME = "canRename";

        /**
        * Whether the current user can modify the sharing settings for this file.
        * The value may be {@code null}.
        */
        private static const string CAN_SHARE = "canShare";

        /**
        * Whether the current user can move this file to trash.
        * The value may be {@code null}.
        */
        private static const string CAN_TRASH = "canTrash";

        /**
        * Whether the current user can trash children of this folder. This is false when the item is not
        * a folder. Only populated for items in shared drives.
        * The value may be {@code null}.
        */
        private static const string CAN_TRASH_CHILDREN = "canTrashChildren";

        /**
        * Whether the current user can restore this file from trash.
        * The value may be {@code null}.
        */
        private static const string CAN_UNTRASH = "canUntrash";

        /**
        * Whether the current user can add children to this folder. This is always false when the item is
        * not a folder.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_ADD_CHILDREN));

        /**
        * Whether the current user can add a folder from another drive (different shared drive or My
        * Drive) to this folder. This is false when the item is not a folder. Only populated for items in
        * shared drives.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_ADD_FOLDER_FROM_ANOTHER_DRIVE));

        /**
        * Whether the current user can add a parent for the item without removing an existing parent in
        * the same request. Not populated for shared drive files.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_ADD_MY_DRIVE_PARENT));

        /**
        * Whether the current user can change the copyRequiresWriterPermission restriction of this file.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_CHANGE_COPY_REQUIRES_WRITER_PERMISSION));

        /**
        * Deprecated
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_CHANGE_VIEWERS_CAN_COPY_CONTENT));

        /**
        * Whether the current user can comment on this file.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_COMMENT));

        /**
        * Whether the current user can copy this file. For an item in a shared drive, whether the current
        * user can copy non-folder descendants of this item, or this item itself if it is not a folder.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_COPY));

        /**
        * Whether the current user can delete this file.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_DELETE));

        /**
        * Whether the current user can delete children of this folder. This is false when the item is not
        * a folder. Only populated for items in shared drives.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_DELETE_CHILDREN));

        /**
        * Whether the current user can download this file.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_DOWNLOAD));

        /**
        * Whether the current user can edit this file. Other factors may limit the type of changes a user
        * can make to a file. For example, see canChangeCopyRequiresWriterPermission or canModifyContent.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_EDIT));

        /**
        * Whether the current user can list the children of this folder. This is always false when the
        * item is not a folder.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_LIST_CHILDREN));

        /**
        * Whether the current user can modify the content of this file.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_MODIFY_CONTENT));

        /**
        * Whether the current user can modify restrictions on content of this file.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_MODIFY_CONTENT_RESTRICTION));


        /**
        * Whether the current user can move children of this folder outside of the shared drive. This is
        * false when the item is not a folder. Only populated for items in shared drives.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_MOVE_CHILDREN_OUT_OF_DRIVE));

        /**
        * Deprecated - use canMoveChildrenOutOfDrive instead.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_MOVE_CHILDREN_OUT_OF_TEAM_DRIVE));

        /**
        * Whether the current user can move children of this folder within this drive. This is false when
        * the item is not a folder. Note that a request to move the child may still fail depending on the
        * current user's access to the child and to the destination folder.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_MOVE_CHILDREN_WITHIN_DRIVE));

        /**
        * Deprecated - use canMoveChildrenWithinDrive instead.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_MOVE_CHILDREN_WITHIN_TEAM_DRIVE));

        /**
        * Deprecated - use canMoveItemOutOfDrive instead.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_MOVE_ITEM_INTO_TEAM_DRIVE));

        /**
        * Whether the current user can move this item outside of this drive by changing its parent. Note
        * that a request to change the parent of the item may still fail depending on the new parent that
        * is being added.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_MOVE_ITEM_OUT_OF_DRIVE));

        /**
        * Deprecated - use canMoveItemOutOfDrive instead.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_MOVE_ITEM_OUT_OF_TEAM_DRIVE));

        /**
        * Whether the current user can move this item within this drive. Note that a request to change
        * the parent of the item may still fail depending on the new parent that is being added and the
        * parent that is being removed.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_MOVE_ITEM_WITHIN_DRIVE));

        /**
        * Deprecated - use canMoveItemWithinDrive instead.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_MOVE_ITEM_WITHIN_TEAM_DRIVE));

        /**
        * Deprecated - use canMoveItemWithinDrive or canMoveItemOutOfDrive instead.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_MOVE_TEAM_DRIVE_ITEM));

        /**
        * Whether the current user can read the shared drive to which this file belongs. Only populated
        * for items in shared drives.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_READ_DRIVE));

        /**
        * Whether the current user can read the revisions resource of this file. For a shared drive item,
        * whether revisions of non-folder descendants of this item, or this item itself if it is not a
        * folder, can be read.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_READ_REVISIONS));

        /**
        * Deprecated - use canReadDrive instead.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_READ_TEAM_DRIVE));

        /**
        * Whether the current user can remove children from this folder. This is always false when the
        * item is not a folder. For a folder in a shared drive, use canDeleteChildren or canTrashChildren
        * instead.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_REMOVE_CHILDREN));

        /**
        * Whether the current user can remove a parent from the item without adding another parent in the
        * same request. Not populated for shared drive files.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_REMOVE_MY_DRIVE_PARENT));

        /**
        * Whether the current user can rename this file.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_RENAME));

        /**
        * Whether the current user can modify the sharing settings for this file.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_SHARE));

        /**
        * Whether the current user can move this file to trash.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_TRASH));

        /**
        * Whether the current user can trash children of this folder. This is false when the item is not
        * a folder. Only populated for items in shared drives.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_TRASH_CHILDREN));

        /**
        * Whether the current user can restore this file from trash.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "Capabilities")(CAN_UNTRASH));
    }

    /**
    * Additional information about the content of the file. These fields are never populated in
    * responses.
    */
    public final struct ContentHints {
        JSONValue container;
        alias container this;
        /**
        * Text to be indexed for the file to improve fullText queries. This is limited to 128KB in length
        * and may contain HTML elements.
        * The value may be {@code null}.
        */
        private static const string INDEXABLE_TEXT = "indexableText";

        /**
        * A thumbnail for the file. This will only be used if Google Drive cannot generate a standard
        * thumbnail.
        * The value may be {@code null}.
        */
        private static const string THUMBNAIL = "thumbnail";

        /**
        * Text to be indexed for the file to improve fullText queries. This is limited to 128KB in length
        * and may contain HTML elements.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "ContentHints")(INDEXABLE_TEXT));

        /**
        * A thumbnail for the file. This will only be used if Google Drive cannot generate a standard
        * thumbnail.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterAgregateType!("Thumbnail", "ContentHints")(THUMBNAIL));

        /**
        * A thumbnail for the file. This will only be used if Google Drive cannot generate a standard
        * thumbnail.
        */
        public final struct Thumbnail {
            JSONValue container;
            alias container this;
            /**
            * The thumbnail data encoded with URL-safe Base64 (RFC 4648 section 5).
            * The value may be {@code null}.
            */
            private static const string IMAGE = "image";

            /**
            * The MIME type of the thumbnail.
            * The value may be {@code null}.
            */
            private static const string MIME_TYPE = "mimeType";

            /**
            * The thumbnail data encoded with URL-safe Base64 (RFC 4648 section 5).
            * @see #decodeImage()
            * @return value or {@code null} for none
            */
            mixin(Drive.GetterSetterBasicType!(string, "Thumbnail")(IMAGE));

            /**
            * The thumbnail data encoded with URL-safe Base64 (RFC 4648 section 5).
            * @see #getImage()
            * @return Base64 decoded value or {@code null} for none
            *
            * @since 1.14
            */
            /*public byte[] decodeImage() {
                string image = this[IMAGE].toJSON;
                return decodeBase64(image);
            }*/

            /**
            * The thumbnail data encoded with URL-safe Base64 (RFC 4648 section 5).
            * @see #setImage()
            *
            * <p>
            * The value is encoded Base64 or {@code null} for none.
            * </p>
            *
            * @since 1.14
            */
            // public Thumbnail encodeImage(byte[] image) {
            // this.image = com.google.api.client.util.Base64.encodeBase64URLSafeString(image);
            // return this;
            // }

            /**
            * The MIME type of the thumbnail.
            * @return value or {@code null} for none
            */
            mixin(Drive.GetterSetterBasicType!(string, "Thumbnail")(MIME_TYPE));
        }
    }

    /**
    * Additional metadata about image media, if available.
    */
    public final struct ImageMediaMetadata {
        JSONValue container;
        alias container this;

        /**
        * The aperture used to create the photo (f-number).
        * The value may be {@code null}.
        */
        private static const string APERTURE = "aperture";

        /**
        * The make of the camera used to create the photo.
        * The value may be {@code null}.
        */
        private static const string CAMERA_MAKE = "cameraMake";

        /**
        * The model of the camera used to create the photo.
        * The value may be {@code null}.
        */
        private static const string CAMERA_MODEL = "cameraModel";

        /**
        * The color space of the photo.
        * The value may be {@code null}.
        */
        private static const string COLOR_SPACE = "colorSpace";

        /**
        * The exposure bias of the photo (APEX value).
        * The value may be {@code null}.
        */
        private static const string EXPOSURE_BIAS = "exposureBias";

        /**
        * The exposure mode used to create the photo.
        * The value may be {@code null}.
        */
        private static const string EXPOSURE_MODE = "exposureMode";

        /**
        * The length of the exposure, in seconds.
        * The value may be {@code null}.
        */
        private static const string EXPOSURE_TIME = "exposureTime";

        /**
        * Whether a flash was used to create the photo.
        * The value may be {@code null}.
        */
        private static const string FLASH_USED = "flashUsed";

        /**
        * The focal length used to create the photo, in millimeters.
        * The value may be {@code null}.
        */
        private static const string FOCAL_LENGTH = "focalLength";

        /**
        * The height of the image in pixels.
        * The value may be {@code null}.
        */
        private static const string HEIGHT = "height";

        /**
        * The ISO speed used to create the photo.
        * The value may be {@code null}.
        */
        private static const string ISO_SPEED = "isoSpeed";

        /**
        * The lens used to create the photo.
        * The value may be {@code null}.
        */
        private static const string LENS = "lens";

        /**
        * Geographic location information stored in the image.
        * The value may be {@code null}.
        */
        private static const string LOCATION = "location";

        /**
        * The smallest f-number of the lens at the focal length used to create the photo (APEX value).
        * The value may be {@code null}.
        */
        private static const string MAX_APERTURE_VALUE = "maxApertureValue";

        /**
        * The metering mode used to create the photo.
        * The value may be {@code null}.
        */
        private static const string METERING_MODE = "meteringMode";

        /**
        * The number of clockwise 90 degree rotations applied from the image's original orientation.
        * The value may be {@code null}.
        */
        private static const string ROTATION = "rotation";

        /**
        * The type of sensor used to create the photo.
        * The value may be {@code null}.
        */
        private static const string SENSOR = "sensor";

        /**
        * The distance to the subject of the photo, in meters.
        * The value may be {@code null}.
        */
        private static const string SUBJECT_DISTANCE = "subjectDistance";

        /**
        * The date and time the photo was taken (EXIF DateTime).
        * The value may be {@code null}.
        */
        private static const string TIME = "time";

        /**
        * The white balance mode used to create the photo.
        * The value may be {@code null}.
        */
        private static const string WHITE_BALANCE = "whiteBalance";

        /**
        * The width of the image in pixels.
        * The value may be {@code null}.
        */
        private static const string WIDTH = "width";

        /**
        * The aperture used to create the photo (f-number).
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(float, "ImageMediaMetadata")(APERTURE));

        /**
        * The make of the camera used to create the photo.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "ImageMediaMetadata")(CAMERA_MAKE));

        /**
        * The model of the camera used to create the photo.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "ImageMediaMetadata")(CAMERA_MODEL));

        /**
        * The color space of the photo.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "ImageMediaMetadata")(COLOR_SPACE));

        /**
        * The exposure bias of the photo (APEX value).
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(float, "ImageMediaMetadata")(EXPOSURE_BIAS));

        /**
        * The exposure mode used to create the photo.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "ImageMediaMetadata")(EXPOSURE_MODE));

       /**
        * The length of the exposure, in seconds.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(float, "ImageMediaMetadata")(EXPOSURE_TIME));

        /**
        * Whether a flash was used to create the photo.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(bool, "ImageMediaMetadata")(FLASH_USED));

        /**
        * The focal length used to create the photo, in millimeters.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(float, "ImageMediaMetadata")(FOCAL_LENGTH));

        /**
        * The height of the image in pixels.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(int, "ImageMediaMetadata")(HEIGHT));

        /**
        * The ISO speed used to create the photo.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(int, "ImageMediaMetadata")(ISO_SPEED));

        /**
        * The lens used to create the photo.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "ImageMediaMetadata")(LENS));

        /**
        * Geographic location information stored in the image.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterAgregateType!("Location", "ImageMediaMetadata")(LOCATION));

        /**
        * The smallest f-number of the lens at the focal length used to create the photo (APEX value).
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(float, "ImageMediaMetadata")(MAX_APERTURE_VALUE));

        /**
        * The metering mode used to create the photo.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "ImageMediaMetadata")(METERING_MODE));

        /**
        * The number of clockwise 90 degree rotations applied from the image's original orientation.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(int, "ImageMediaMetadata")(ROTATION));

        /**
        * The type of sensor used to create the photo.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "ImageMediaMetadata")(SENSOR));

        /**
        * The distance to the subject of the photo, in meters.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(int, "ImageMediaMetadata")(SUBJECT_DISTANCE));

        /**
        * The date and time the photo was taken (EXIF DateTime).
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "ImageMediaMetadata")(TIME));

        /**
        * The white balance mode used to create the photo.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "ImageMediaMetadata")(WHITE_BALANCE));

        /**
        * The width of the image in pixels.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(int, "ImageMediaMetadata")(WIDTH));

        /**
        * Geographic location information stored in the image.
        */
        public final struct Location {
            JSONValue container;
            alias container this;

            /**
            * The altitude stored in the image.
            * The value may be {@code null}.
            */
            private static const string ALTITUDE = "altitude";

            /**
            * The latitude stored in the image.
            * The value may be {@code null}.
            */
            private static const string LATITUDE = "latitude";

            /**
            * The longitude stored in the image.
            * The value may be {@code null}.
            */
            private static const string LONGITUDE = "longitude";

            /**
            * The altitude stored in the image.
            * @return value or {@code null} for none
            */
            mixin(Drive.GetterSetterBasicType!(double, "Location")(ALTITUDE));

            /**
            * The latitude stored in the image.
            * @return value or {@code null} for none
            */
            mixin(Drive.GetterSetterBasicType!(double, "Location")(LATITUDE));
            /**
            * The longitude stored in the image.
            * @return value or {@code null} for none
            */
            mixin(Drive.GetterSetterBasicType!(double, "Location")(LONGITUDE));
        }
    }

    /**
    * Shortcut file details. Only populated for shortcut files, which have the mimeType field set to
    * application/vnd.google-apps.shortcut.
    */
    public final struct ShortcutDetails {
        JSONValue container;
        alias container this;

        /**
        * The ID of the file that this shortcut points to.
        * The value may be {@code null}.
        */
        private static const string TARGET_ID = "targetId";

        /**
        * The MIME type of the file that this shortcut points to. The value of this field is a snapshot
        * of the target's MIME type, captured when the shortcut is created.
        * The value may be {@code null}.
        */
        private static const string TARGET_MIME_TYPE = "targetMimeType";

        /**
        * The ID of the file that this shortcut points to.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "ShortcutDetails")(TARGET_ID));

        /**
        * The MIME type of the file that this shortcut points to. The value of this field is a snapshot
        * of the target's MIME type, captured when the shortcut is created.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "ShortcutDetails")(TARGET_MIME_TYPE));
    }

    /**
    * Additional metadata about video media. This may not be available immediately upon upload.
    */
    public final struct VideoMediaMetadata {
        JSONValue container;
        alias container this;
        /**
        * The duration of the video in milliseconds.
        * The value may be {@code null}.
        */
        private static const string DURATION_MILLIS = "durationMillis";

        /**
        * The height of the video in pixels.
        * The value may be {@code null}.
        */
        private static const string HEIGHT = "height";

        /**
        * The width of the video in pixels.
        * The value may be {@code null}.
        */
        private static const string WIDTH = "width";

        /**
        * The duration of the video in milliseconds.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(long, "VideoMediaMetadata")(DURATION_MILLIS));

        /**
        * The height of the video in pixels.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(int, "VideoMediaMetadata")(HEIGHT));

        /**
        * The width of the video in pixels.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(int, "VideoMediaMetadata")(WIDTH));
    }
}