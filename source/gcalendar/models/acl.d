module gcalendar.models.acl;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Acl {
	/** Type of the collection ("calendar#acl").*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "Acl")(KIND));

	/** Token used at a later point in time to retrieve only the entries that have changed since this result was returned. Omitted if further results are available, in which case nextPageToken is provided.*/
	private static const string NEXTSYNCTOKEN = "nextSyncToken";
	@optional string _nextSyncToken;
	mixin(GetterSetter!("string", "Acl")(NEXTSYNCTOKEN));

	/** Token used to access the next page of this result. Omitted if no further results are available, in which case nextSyncToken is provided.*/
	private static const string NEXTPAGETOKEN = "nextPageToken";
	@optional string _nextPageToken;
	mixin(GetterSetter!("string", "Acl")(NEXTPAGETOKEN));

	/** List of rules on the access control list.*/
	private static const string ITEMS = "items";
	import gcalendar.models.aclrule;
	AclRule[] _items;
	mixin(GetterSetter!("AclRule[]", "Acl")(ITEMS));

	/** ETag of the collection.*/
	private static const string ETAG = "etag";
	string _etag;
	mixin(GetterSetter!("string", "Acl")(ETAG));

}
