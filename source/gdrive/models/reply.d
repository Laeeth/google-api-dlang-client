module gdrive.models.reply;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Reply {
	/** The content of the reply with HTML formatting.*/
	private static const string HTMLCONTENT = "htmlContent";
	string _htmlContent;
	mixin(GetterSetter!("string", "Reply")(HTMLCONTENT));

	/** The time at which the reply was created (RFC 3339 date-time).*/
	private static const string CREATEDTIME = "createdTime";
	string _createdTime;
	mixin(GetterSetter!("string", "Reply")(CREATEDTIME));

	/** The last time the reply was modified (RFC 3339 date-time).*/
	private static const string MODIFIEDTIME = "modifiedTime";
	string _modifiedTime;
	mixin(GetterSetter!("string", "Reply")(MODIFIEDTIME));

	/** The ID of the reply.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "Reply")(ID));

	/** Identifies what kind of resource this is. Value: the fixed string "drive#reply".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "Reply")(KIND));

	/** The plain text content of the reply. This field is used for setting the content, while htmlContent should be displayed. This is required on creates if no action is specified.*/
	private static const string CONTENT = "content";
	string _content;
	mixin(GetterSetter!("string", "Reply")(CONTENT));

	/** The action the reply performed to the parent comment. Valid values are:  
- resolve 
- reopen*/
	private static const string ACTION = "action";
	string _action;
	mixin(GetterSetter!("string", "Reply")(ACTION));

	/** The author of the reply. The author's email address and permission ID will not be populated.*/
	private static const string AUTHOR = "author";
	import gdrive.models.user;
	User _author;
	mixin(GetterSetter!("User", "Reply")(AUTHOR));

	/** Whether the reply has been deleted. A deleted reply has no content.*/
	private static const string DELETED = "deleted";
	bool _deleted;
	mixin(GetterSetter!("bool", "Reply")(DELETED));

}
