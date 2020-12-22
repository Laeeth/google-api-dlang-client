module gdrive.models.reply;

import gdrive.drive;
import gdrive.models.user;
import std.json;
import std.typecons : Nullable, nullable;
import std.conv : to;
import std.datetime : SysTime;

public final struct Reply {
    JSONValue container;
    alias container this;

    /**
    * The action the reply performed to the parent comment. Valid values are: - resolve  - reopen
    * The value may be {@code null}.
    */
    private static const string ACTION = "action";

    /**
    * The author of the reply. The author's email address and permission ID will not be populated.
    * The value may be {@code null}.
    */
    private static const string AUTHOR = "author";

    /**
    * The plain text content of the reply. This field is used for setting the content, while
    * htmlContent should be displayed. This is required on creates if no action is specified.
    * The value may be {@code null}.
    */
    private static const string CONTENT = "content";

    /**
    * The time at which the reply was created (RFC 3339 date-time).
    * The value may be {@code null}.
    */
    private static const string CREATED_TIME = "createdTime";

    /**
    * Whether the reply has been deleted. A deleted reply has no content.
    * The value may be {@code null}.
    */
    private static const string DELETED = "deleted";

    /**
    * The content of the reply with HTML formatting.
    * The value may be {@code null}.
    */
    private static const string HTML_CONTENT = "htmlContent";    

    /**
    * The ID of the reply.
    * The value may be {@code null}.
    */
    private static const string ID = "id";

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#reply".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";

    /**
    * The last time the reply was modified (RFC 3339 date-time).
    * The value may be {@code null}.
    */
    private static const string MODIFIED_TIME = "modifiedTime";

    /**
    * The action the reply performed to the parent comment. Valid values are: - resolve  - reopen
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Reply")(ACTION));

    /**
    * The author of the reply. The author's email address and permission ID will not be populated.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("User", "Reply")(AUTHOR));

    /**
    * The plain text content of the reply. This field is used for setting the content, while
    * htmlContent should be displayed. This is required on creates if no action is specified.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Reply")(CONTENT));

    /**
    * The time at which the reply was created (RFC 3339 date-time).
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(SysTime, "Reply")(CREATED_TIME));

    /**
    * Whether the reply has been deleted. A deleted reply has no content.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "Reply")(DELETED));

    /**
    * The content of the reply with HTML formatting.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Reply")(HTML_CONTENT));

    /**
    * The ID of the reply.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Reply")(ID));

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#reply".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Reply")(KIND));

    /**
    * The last time the reply was modified (RFC 3339 date-time).
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(SysTime, "Reply")(MODIFIED_TIME));
}