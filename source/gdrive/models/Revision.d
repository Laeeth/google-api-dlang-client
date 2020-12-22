module gdrive.models.revision;

import gdrive.drive;
import gdrive.models.user;
import std.json;
import std.typecons : Nullable, nullable;
import std.conv : to;
import std.datetime : SysTime;

public final struct Revision {
    JSONValue container;
    alias container this;

    /**
    * Links for exporting Docs Editors files to specific formats.
    * The value may be {@code null}.
    */
    private static const string EXPORT_LINKS = "exportLinks";

    /**
    * The ID of the revision.
    * The value may be {@code null}.
    */
    private static const string ID = "id";    

    /**
    * Whether to keep this revision forever, even if it is no longer the head revision. If not set,
    * the revision will be automatically purged 30 days after newer content is uploaded. This can be
    * set on a maximum of 200 revisions for a file. This field is only applicable to files with
    * binary content in Drive.
    * The value may be {@code null}.
    */
    private static const string KEEP_FOREVER = "keepForever";    

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#revision".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";    

    /**
    * The last user to modify this revision.
    * The value may be {@code null}.
    */
    private static const string LAST_MODIFYING_USER = "lastModifyingUser";    

    /**
    * The MD5 checksum of the revision's content. This is only applicable to files with binary
    * content in Drive.
    * The value may be {@code null}.
    */
    private static const string MD5_CHECKSUM = "md5Checksum";    

    /**
    * The MIME type of the revision.
    * The value may be {@code null}.
    */
    private static const string MIME_TYPE = "mimeType";   

    /**
    * The last time the revision was modified (RFC 3339 date-time).
    * The value may be {@code null}.
    */
    private static const string MODIFIED_TIME = "modifiedTime";    

    /**
    * The original filename used to create this revision. This is only applicable to files with
    * binary content in Drive.
    * The value may be {@code null}.
    */
    private static const string ORIGINAL_FILENAME = "originalFilename";    

    /**
    * Whether subsequent revisions will be automatically republished. This is only applicable to Docs
    * Editors files.
    * The value may be {@code null}.
    */
    private static const string PUBLISH_AUTO = "publishAuto";    

    /**
    * Whether this revision is published. This is only applicable to Docs Editors files.
    * The value may be {@code null}.
    */
    private static const string PUBLISHED = "published";

    /**
    * A link to the published revision. This is only populated for Google Sites files.
    * The value may be {@code null}.
    */
    private static const string PUBLISHED_LINK = "publishedLink";

    /**
    * Whether this revision is published outside the domain. This is only applicable to Docs Editors
    * files.
    * The value may be {@code null}.
    */
    private static const string PUBLISHED_OUTSIDE_DOMAIN = "publishedOutsideDomain";

    /**
    * The size of the revision's content in bytes. This is only applicable to files with binary
    * content in Drive.
    * The value may be {@code null}.
    */
    private static const string SIZE = "size";

    /**
    * Links for exporting Docs Editors files to specific formats.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAssocArray!("string", "string[string]", "Revision")(EXPORT_LINKS));

    /**
    * The ID of the revision.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Revision")(ID));

    /**
    * Whether to keep this revision forever, even if it is no longer the head revision. If not set,
    * the revision will be automatically purged 30 days after newer content is uploaded. This can be
    * set on a maximum of 200 revisions for a file. This field is only applicable to files with
    * binary content in Drive.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "Revision")(KEEP_FOREVER));

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#revision".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Revision")(KIND));

    /**
    * The last user to modify this revision.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("User", "Revision")(LAST_MODIFYING_USER));

    /**
    * The MD5 checksum of the revision's content. This is only applicable to files with binary
    * content in Drive.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Revision")(MD5_CHECKSUM));

    /**
    * The MIME type of the revision.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Revision")(MIME_TYPE));

    /**
    * The last time the revision was modified (RFC 3339 date-time).
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(SysTime, "Revision")(MODIFIED_TIME));

    /**
    * The original filename used to create this revision. This is only applicable to files with
    * binary content in Drive.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Revision")(ORIGINAL_FILENAME));

    /**
    * Whether subsequent revisions will be automatically republished. This is only applicable to Docs
    * Editors files.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "Revision")(PUBLISH_AUTO));

    /**
    * Whether this revision is published. This is only applicable to Docs Editors files.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "Revision")(PUBLISHED));

    /**
    * A link to the published revision. This is only populated for Google Sites files.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Revision")(PUBLISHED_LINK));

    /**
    * Whether this revision is published outside the domain. This is only applicable to Docs Editors
    * files.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "Revision")(PUBLISHED_OUTSIDE_DOMAIN));

    /**
    * The size of the revision's content in bytes. This is only applicable to files with binary
    * content in Drive.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(long, "Revision")(SIZE));
}