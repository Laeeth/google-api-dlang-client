module gdrive.models.filelist;

import gdrive.drive;
import gdrive.models.File;
import std.json;
import std.typecons : Nullable, nullable;
import std.conv : to;
import std.datetime : SysTime;

public final struct FileList {
    JSONValue container;
    alias container this;

    /**
    * The list of files. If nextPageToken is populated, then this list may be incomplete and an
    * additional page of results should be fetched.
    * The value may be {@code null}.
    */
    private static const string FILES = "files";

    /**
    * Whether the search process was incomplete. If true, then some search results may be missing,
    * since all documents were not searched. This may occur when searching multiple drives with the
    * "allDrives" corpora, but all corpora could not be searched. When this happens, it is suggested
    * that clients narrow their query by choosing a different corpus such as "user" or "drive".
    * The value may be {@code null}.
    */
    private static const string INCOMPLETE_SEARCH = "incompleteSearch";

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#fileList".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";

    /**
    * The page token for the next page of files. This will be absent if the end of the files list has
    * been reached. If the token is rejected for any reason, it should be discarded, and pagination
    * should be restarted from the first page of results.
    * The value may be {@code null}.
    */
    private static const string NEXT_PAGE_TOKEN = "nextPageToken";

    /**
    * The list of files. If nextPageToken is populated, then this list may be incomplete and an
    * additional page of results should be fetched.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAgregateType!("File[]", "FileList")(FILES));

    /**
    * Whether the search process was incomplete. If true, then some search results may be missing,
    * since all documents were not searched. This may occur when searching multiple drives with the
    * "allDrives" corpora, but all corpora could not be searched. When this happens, it is suggested
    * that clients narrow their query by choosing a different corpus such as "user" or "drive".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "FileList")(INCOMPLETE_SEARCH));

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#fileList".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "FileList")(KIND));

    /**
    * The page token for the next page of files. This will be absent if the end of the files list has
    * been reached. If the token is rejected for any reason, it should be discarded, and pagination
    * should be restarted from the first page of results.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "FileList")(NEXT_PAGE_TOKEN));
}