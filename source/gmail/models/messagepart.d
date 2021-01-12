module gmail.models.messagepart;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct MessagePart {
	/** The child MIME message parts of this part. This only applies to container MIME message parts, for example `multipart/*`. For non- container MIME message part types, such as `text/plain`, this field is empty. For more information, see RFC 1521.*/
	private static const string PARTS = "parts";
	import gmail.models.messagepart;
	MessagePart[] _parts;
	mixin(GetterSetter!("MessagePart[]", "MessagePart")(PARTS));

	/** The message part body for this part, which may be empty for container MIME message parts.*/
	private static const string BODY = "body";
	import gmail.models.messagepartbody;
	MessagePartBody _body;
	mixin(GetterSetter!("MessagePartBody", "MessagePart")(BODY));

	/** The immutable ID of the message part.*/
	private static const string PARTID = "partId";
	string _partId;
	mixin(GetterSetter!("string", "MessagePart")(PARTID));

	/** List of headers on this message part. For the top-level message part, representing the entire message payload, it will contain the standard RFC 2822 email headers such as `To`, `From`, and `Subject`.*/
	private static const string HEADERS = "headers";
	import gmail.models.messagepartheader;
	MessagePartHeader[] _headers;
	mixin(GetterSetter!("MessagePartHeader[]", "MessagePart")(HEADERS));

	/** The MIME type of the message part.*/
	private static const string MIMETYPE = "mimeType";
	string _mimeType;
	mixin(GetterSetter!("string", "MessagePart")(MIMETYPE));

	/** The filename of the attachment. Only present if this message part represents an attachment.*/
	private static const string FILENAME = "filename";
	string _filename;
	mixin(GetterSetter!("string", "MessagePart")(FILENAME));

}
