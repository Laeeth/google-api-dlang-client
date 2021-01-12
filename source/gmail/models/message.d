module gmail.models.message;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Message {
	/** The parsed email structure in the message parts.*/
	private static const string PAYLOAD = "payload";
	import gmail.models.messagepart;
	MessagePart _payload;
	mixin(GetterSetter!("MessagePart", "Message")(PAYLOAD));

	/** The entire email message in an RFC 2822 formatted and base64url encoded string. Returned in `messages.get` and `drafts.get` responses when the `format=RAW` parameter is supplied.*/
	private static const string RAW = "raw";
	string _raw;
	mixin(GetterSetter!("string", "Message")(RAW));

	/** The immutable ID of the message.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "Message")(ID));

	/** List of IDs of labels applied to this message.*/
	private static const string LABELIDS = "labelIds";
	string[] _labelIds;
	mixin(GetterSetter!("string[]", "Message")(LABELIDS));

	/** The ID of the last history record that modified this message.*/
	private static const string HISTORYID = "historyId";
	string _historyId;
	mixin(GetterSetter!("string", "Message")(HISTORYID));

	/** Estimated size in bytes of the message.*/
	private static const string SIZEESTIMATE = "sizeEstimate";
	int _sizeEstimate;
	mixin(GetterSetter!("int", "Message")(SIZEESTIMATE));

	/** A short part of the message text.*/
	private static const string SNIPPET = "snippet";
	string _snippet;
	mixin(GetterSetter!("string", "Message")(SNIPPET));

	/** The internal message creation timestamp (epoch ms), which determines ordering in the inbox. For normal SMTP-received email, this represents the time the message was originally accepted by Google, which is more reliable than the `Date` header. However, for API-migrated mail, it can be configured by client to be based on the `Date` header.*/
	private static const string INTERNALDATE = "internalDate";
	string _internalDate;
	mixin(GetterSetter!("string", "Message")(INTERNALDATE));

	/** The ID of the thread the message belongs to. To add a message or draft to a thread, the following criteria must be met: 1. The requested `threadId` must be specified on the `Message` or `Draft.Message` you supply with your request. 2. The `References` and `In-Reply-To` headers must be set in compliance with the [RFC 2822](https://tools.ietf.org/html/rfc2822) standard. 3. The `Subject` headers must match. */
	private static const string THREADID = "threadId";
	string _threadId;
	mixin(GetterSetter!("string", "Message")(THREADID));

}
