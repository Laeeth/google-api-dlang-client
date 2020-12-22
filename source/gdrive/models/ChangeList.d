module gdrive.models.ChangeList;

import gdrive.drive;
import std.json;
import gdrive.models.Change;
import std.datetime : SysTime;
import std.typecons : Nullable, nullable;
import std.conv : to;

public final struct ChangeList {
    JSONValue container;
    alias container this;
    /**
    * The list of changes. If nextPageToken is populated, then this list may be incomplete and an
    * additional page of results should be fetched.
    * The value may be {@code null}.
    */
    private static const string CHANGES = "changes";

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#changeList".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";

    /**
    * The starting page token for future changes. This will be present only if the end of the current
    * changes list has been reached.
    * The value may be {@code null}.
    */
    private static const string NEW_START_PAGE_TOKEN = "newStartPageToken";

    /**
    * The page token for the next page of changes. This will be absent if the end of the changes list
    * has been reached. If the token is rejected for any reason, it should be discarded, and
    * pagination should be restarted from the first page of results.
    * The value may be {@code null}.
    */
    private static const string NEXT_PAGE_TOKEN = "nextPageToken";
    /**
    * The list of changes. If nextPageToken is populated, then this list may be incomplete and an
    * additional page of results should be fetched.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("Change[]", "ChangeList")(CHANGES));

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#changeList".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "ChangeList")(KIND));

    /**
    * The starting page token for future changes. This will be present only if the end of the current
    * changes list has been reached.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "ChangeList")(NEW_START_PAGE_TOKEN));

    /**
    * The page token for the next page of changes. This will be absent if the end of the changes list
    * has been reached. If the token is rejected for any reason, it should be discarded, and
    * pagination should be restarted from the first page of results.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "ChangeList")(NEXT_PAGE_TOKEN));
}