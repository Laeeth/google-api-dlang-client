module gdrive.models.comment;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Comment {
	/** The content of the comment with HTML formatting.*/
	private static const string HTMLCONTENT = "htmlContent";
	string _htmlContent;
	mixin(GetterSetter!("string", "Comment")(HTMLCONTENT));

	/** The time at which the comment was created (RFC 3339 date-time).*/
	private static const string CREATEDTIME = "createdTime";
	string _createdTime;
	mixin(GetterSetter!("string", "Comment")(CREATEDTIME));

	/** The file content to which the comment refers, typically within the anchor region. For a text file, for example, this would be the text at the location of the comment.*/
	private static const string QUOTEDFILECONTENT = "quotedFileContent";
	public struct QuotedFileContent {
		/** The quoted content itself. This is interpreted as plain text if set through the API.*/
		private static const string VALUE = "value";
		string _value;
		mixin(GetterSetter!("string", "QuotedFileContent")(VALUE));

		/** The MIME type of the quoted content.*/
		private static const string MIMETYPE = "mimeType";
		string _mimeType;
		mixin(GetterSetter!("string", "QuotedFileContent")(MIMETYPE));

	}

	/** The last time the comment or any of its replies was modified (RFC 3339 date-time).*/
	private static const string MODIFIEDTIME = "modifiedTime";
	string _modifiedTime;
	mixin(GetterSetter!("string", "Comment")(MODIFIEDTIME));

	/** The ID of the comment.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "Comment")(ID));

	/** Identifies what kind of resource this is. Value: the fixed string "drive#comment".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "Comment")(KIND));

	/** A region of the document represented as a JSON string. See anchor documentation for details on how to define and interpret anchor properties.*/
	private static const string ANCHOR = "anchor";
	string _anchor;
	mixin(GetterSetter!("string", "Comment")(ANCHOR));

	/** The plain text content of the comment. This field is used for setting the content, while htmlContent should be displayed.*/
	private static const string CONTENT = "content";
	string _content;
	mixin(GetterSetter!("string", "Comment")(CONTENT));

	/** Whether the comment has been resolved by one of its replies.*/
	private static const string RESOLVED = "resolved";
	bool _resolved;
	mixin(GetterSetter!("bool", "Comment")(RESOLVED));

	/** The full list of replies to the comment in chronological order.*/
	private static const string REPLIES = "replies";
	import gdrive.models.reply;
	Reply[] _replies;
	mixin(GetterSetter!("Reply[]", "Comment")(REPLIES));

	/** The author of the comment. The author's email address and permission ID will not be populated.*/
	private static const string AUTHOR = "author";
	import gdrive.models.user;
	User _author;
	mixin(GetterSetter!("User", "Comment")(AUTHOR));

	/** Whether the comment has been deleted. A deleted comment has no content.*/
	private static const string DELETED = "deleted";
	bool _deleted;
	mixin(GetterSetter!("bool", "Comment")(DELETED));

}
