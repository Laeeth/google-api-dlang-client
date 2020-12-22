module gdrive.models.replylist;

import gdrive.drive;
import gdrive.models.reply;
import std.json;
import std.typecons : Nullable, nullable;
import std.conv : to;
import std.datetime : SysTime;

public final struct ReplyList {
    JSONValue container;
    alias container this;

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#replyList".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";

    /**
    * The page token for the next page of replies. This will be absent if the end of the replies list
    * has been reached. If the token is rejected for any reason, it should be discarded, and
    * pagination should be restarted from the first page of results.
    * The value may be {@code null}.
    */
    private static const string NEXT_PAGE_TOKEN = "nextPageToken";

    /**
    * The list of replies. If nextPageToken is populated, then this list may be incomplete and an
    * additional page of results should be fetched.
    * The value may be {@code null}.
    */
    private static const string REPLIES = "replies";

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#replyList".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "ReplyList")(KIND));

    /**
    * The page token for the next page of replies. This will be absent if the end of the replies list
    * has been reached. If the token is rejected for any reason, it should be discarded, and
    * pagination should be restarted from the first page of results.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "ReplyList")(NEXT_PAGE_TOKEN));

    /**
    * The list of replies. If nextPageToken is populated, then this list may be incomplete and an
    * additional page of results should be fetched.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("Reply[]", "ReplyList")(REPLIES));
}
