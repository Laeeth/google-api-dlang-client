module gdrive.models.revisionlist;

import gdrive.drive;
import gdrive.models.revision;
import std.json;
import std.typecons : Nullable, nullable;
import std.conv : to;
import std.datetime : SysTime;

public final struct RevisionList {
    JSONValue container;
    alias container this;

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#revisionList".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";

    /**
    * The page token for the next page of revisions. This will be absent if the end of the revisions
    * list has been reached. If the token is rejected for any reason, it should be discarded, and
    * pagination should be restarted from the first page of results.
    * The value may be {@code null}.
    */
    private static const string NEXT_PAGE_TOKEN = "nextPageToken";

    /**
    * The list of revisions. If nextPageToken is populated, then this list may be incomplete and an
    * additional page of results should be fetched.
    * The value may be {@code null}.
    */
    private static const string REVISIONS = "revisions";

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#revisionList".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "RevisionList")(KIND));

    /**
    * The page token for the next page of revisions. This will be absent if the end of the revisions
    * list has been reached. If the token is rejected for any reason, it should be discarded, and
    * pagination should be restarted from the first page of results.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "RevisionList")(NEXT_PAGE_TOKEN));


    /**
    * The list of revisions. If nextPageToken is populated, then this list may be incomplete and an
    * additional page of results should be fetched.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("Revision[]", "RevisionList")(REVISIONS));
}

