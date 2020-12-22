module gdrive.models.comments;

import gdrive.drive;
import gdrive.models.user;
import gdrive.models.reply;
import std.json;
import std.typecons : Nullable, nullable;
import std.conv : to;
import std.datetime : SysTime;

public final struct Comment {
    JSONValue container;
    alias container this;

    /**
    * A region of the document represented as a JSON string. See anchor documentation for details on
    * how to define and interpret anchor properties.
    * The value may be {@code null}.
    */
    private static const string ANCHOR = "anchor";

    /**
    * The author of the comment. The author's email address and permission ID will not be populated.
    * The value may be {@code null}.
    */
    private static const string AUTHOR = "author";    

    /**
    * The plain text content of the comment. This field is used for setting the content, while
    * htmlContent should be displayed.
    * The value may be {@code null}.
    */
    private static const string CONTENT = "content";

    /**
    * The time at which the comment was created (RFC 3339 date-time).
    * The value may be {@code null}.
    */
    private static const string CREATED_TIME = "createdTime";

    /**
    * Whether the comment has been deleted. A deleted comment has no content.
    * The value may be {@code null}.
    */
    private static const string DELETED = "deleted";    

    /**
    * The content of the comment with HTML formatting.
    * The value may be {@code null}.
    */
    private static const string HTML_CONTENT = "htmlContent";    

    /**
    * The ID of the comment.
    * The value may be {@code null}.
    */
    private static const string ID = "id";    

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#comment".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";    

    /**
    * The last time the comment or any of its replies was modified (RFC 3339 date-time).
    * The value may be {@code null}.
    */
    private static const string MODIFIED_TIME = "modifiedTime";    

    /**
    * The file content to which the comment refers, typically within the anchor region. For a text
    * file, for example, this would be the text at the location of the comment.
    * The value may be {@code null}.
    */
    private static const string QUOTED_FILE_CONTENT = "quotedFileContent";    

    /**
    * The full list of replies to the comment in chronological order.
    * The value may be {@code null}.
    */
    private static const string REPLIES = "replies";

    /**
    * Whether the comment has been resolved by one of its replies.
    * The value may be {@code null}.
    */
    private static const string RESOLVED = "resolved";

    /**
    * A region of the document represented as a JSON string. See anchor documentation for details on
    * how to define and interpret anchor properties.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Comment")(ANCHOR));

    /**
    * The author of the comment. The author's email address and permission ID will not be populated.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("User", "Comment")(AUTHOR));

    /**
    * The plain text content of the comment. This field is used for setting the content, while
    * htmlContent should be displayed.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Comment")(CONTENT));

    /**
    * The time at which the comment was created (RFC 3339 date-time).
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(SysTime, "Comment")(CREATED_TIME));

    /**
    * Whether the comment has been deleted. A deleted comment has no content.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "Comment")(DELETED));

    /**
    * The content of the comment with HTML formatting.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Comment")(HTML_CONTENT));

    /**
    * The ID of the comment.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Comment")(ID));

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#comment".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Comment")(KIND));

    /**
    * The last time the comment or any of its replies was modified (RFC 3339 date-time).
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(SysTime, "Comment")(MODIFIED_TIME));

    /**
    * The file content to which the comment refers, typically within the anchor region. For a text
    * file, for example, this would be the text at the location of the comment.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("QuotedFileContent", "Comment")(QUOTED_FILE_CONTENT));

    /**
    * The full list of replies to the comment in chronological order.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("Reply[]", "Comment")(REPLIES));

    /**
    * Whether the comment has been resolved by one of its replies.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "Comment")(RESOLVED));

    /**
    * The file content to which the comment refers, typically within the anchor region. For a text
    * file, for example, this would be the text at the location of the comment.
    */
    public final struct QuotedFileContent {
        JSONValue container;
        alias container this;

        /**
        * The MIME type of the quoted content.
        * The value may be {@code null}.
        */
        private static const string MIME_TYPE = "mimeType";    

        /**
        * The quoted content itself. This is interpreted as plain text if set through the API.
        * The value may be {@code null}.
        */
        private static const string VALUE = "value";

        /**
        * The MIME type of the quoted content.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "QuotedFileContent")(MIME_TYPE));

        /**
        * The quoted content itself. This is interpreted as plain text if set through the API.
        * @return value or {@code null} for none
        */
        mixin(Drive.GetterSetterBasicType!(string, "QuotedFileContent")(VALUE));
    }
}