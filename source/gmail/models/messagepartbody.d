module gmail.models.messagepartbody;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct MessagePartBody {
	/** Number of bytes for the message part data (encoding notwithstanding).*/
	private static const string SIZE = "size";
	int _size;
	mixin(GetterSetter!("int", "MessagePartBody")(SIZE));

	/** When present, contains the ID of an external attachment that can be retrieved in a separate `messages.attachments.get` request. When not present, the entire content of the message part body is contained in the data field.*/
	private static const string ATTACHMENTID = "attachmentId";
	string _attachmentId;
	mixin(GetterSetter!("string", "MessagePartBody")(ATTACHMENTID));

	/** The body data of a MIME message part as a base64url encoded string. May be empty for MIME container types that have no message body or when the body data is sent as a separate attachment. An attachment ID is present if the body data is contained in a separate attachment.*/
	private static const string DATA = "data";
	string _data;
	mixin(GetterSetter!("string", "MessagePartBody")(DATA));

}
