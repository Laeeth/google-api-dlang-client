module gdrive.models.commentlist;

import gdrive.drive;
import gdrive.models.comments;
import std.json;
import std.datetime : SysTime;
import std.typecons : Nullable, nullable;
import std.conv : to;

public final struct CommentList {
    JSONValue container;
    alias container this;

    /**
    * The list of comments. If nextPageToken is populated, then this list may be incomplete and an
    * additional page of results should be fetched.
    * The value may be {@code null}.
    */
    private static const string COMMENTS = "comments";

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#commentList".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";

    /**
    * The page token for the next page of comments. This will be absent if the end of the comments
    * list has been reached. If the token is rejected for any reason, it should be discarded, and
    * pagination should be restarted from the first page of results.
    * The value may be {@code null}.
    */
    private static const string NEXT_PAGE_TOKEN = "nextPageToken";

    /**
    * The list of comments. If nextPageToken is populated, then this list may be incomplete and an
    * additional page of results should be fetched.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("Comment[]", "CommentList")(COMMENTS));

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#commentList".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "CommentList")(KIND));

    /**
    * The page token for the next page of comments. This will be absent if the end of the comments
    * list has been reached. If the token is rejected for any reason, it should be discarded, and
    * pagination should be restarted from the first page of results.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "CommentList")(NEXT_PAGE_TOKEN));
}