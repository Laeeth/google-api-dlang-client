module gdrive.models.filelist;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct FileList {
	/** Identifies what kind of resource this is. Value: the fixed string "drive#fileList".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "FileList")(KIND));

	/** Whether the search process was incomplete. If true, then some search results may be missing, since all documents were not searched. This may occur when searching multiple drives with the "allDrives" corpora, but all corpora could not be searched. When this happens, it is suggested that clients narrow their query by choosing a different corpus such as "user" or "drive".*/
	private static const string INCOMPLETESEARCH = "incompleteSearch";
	bool _incompleteSearch;
	mixin(GetterSetter!("bool", "FileList")(INCOMPLETESEARCH));

	/** The page token for the next page of files. This will be absent if the end of the files list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results.*/
	private static const string NEXTPAGETOKEN = "nextPageToken";
	string _nextPageToken;
	mixin(GetterSetter!("string", "FileList")(NEXTPAGETOKEN));

	/** The list of files. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched.*/
	private static const string FILES = "files";
	import gdrive.models.file;
	File[] _files;
	mixin(GetterSetter!("File[]", "FileList")(FILES));

}
