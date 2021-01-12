module gcalendar.models.eventattachment;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct EventAttachment {
	/** Internet media type (MIME type) of the attachment.*/
	private static const string MIMETYPE = "mimeType";
	string _mimeType;
	mixin(GetterSetter!("string", "EventAttachment")(MIMETYPE));

	/** Attachment title.*/
	private static const string TITLE = "title";
	string _title;
	mixin(GetterSetter!("string", "EventAttachment")(TITLE));

	/** ID of the attached file. Read-only.
For Google Drive files, this is the ID of the corresponding Files resource entry in the Drive API.*/
	private static const string FILEID = "fileId";
	string _fileId;
	mixin(GetterSetter!("string", "EventAttachment")(FILEID));

	/** URL link to the attachment's icon. Read-only.*/
	private static const string ICONLINK = "iconLink";
	string _iconLink;
	mixin(GetterSetter!("string", "EventAttachment")(ICONLINK));

	/** URL link to the attachment.
For adding Google Drive file attachments use the same format as in alternateLink property of the Files resource in the Drive API.
Required when adding an attachment.*/
	private static const string FILEURL = "fileUrl";
	string _fileUrl;
	mixin(GetterSetter!("string", "EventAttachment")(FILEURL));

}
