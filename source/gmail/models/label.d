module gmail.models.label;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Label {
	/** The immutable ID of the label.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "Label")(ID));

	/** The number of unread messages with the label.*/
	private static const string MESSAGESUNREAD = "messagesUnread";
	int _messagesUnread;
	mixin(GetterSetter!("int", "Label")(MESSAGESUNREAD));

	/** The total number of threads with the label.*/
	private static const string THREADSTOTAL = "threadsTotal";
	int _threadsTotal;
	mixin(GetterSetter!("int", "Label")(THREADSTOTAL));

	/** The display name of the label.*/
	private static const string NAME = "name";
	string _name;
	mixin(GetterSetter!("string", "Label")(NAME));

	/** The color to assign to the label. Color is only available for labels that have their `type` set to `user`.*/
	private static const string COLOR = "color";
	import gmail.models.labelcolor;
	@optional LabelColor _color;
	mixin(GetterSetter!("LabelColor", "Label")(COLOR));

	/** The number of unread threads with the label.*/
	private static const string THREADSUNREAD = "threadsUnread";
	int _threadsUnread;
	mixin(GetterSetter!("int", "Label")(THREADSUNREAD));

	/** The visibility of the label in the label list in the Gmail web interface.*/
	private static const string LABELLISTVISIBILITY = "labelListVisibility";
	string _labelListVisibility;
	mixin(GetterSetter!("string", "Label")(LABELLISTVISIBILITY));

	/** The owner type for the label. User labels are created by the user and can be modified and deleted by the user and can be applied to any message or thread. System labels are internally created and cannot be added, modified, or deleted. System labels may be able to be applied to or removed from messages and threads under some circumstances but this is not guaranteed. For example, users can apply and remove the `INBOX` and `UNREAD` labels from messages and threads, but cannot apply or remove the `DRAFTS` or `SENT` labels from messages or threads.*/
	private static const string TYPE = "type";
	string _type;
	mixin(GetterSetter!("string", "Label")(TYPE));

	/** The total number of messages with the label.*/
	private static const string MESSAGESTOTAL = "messagesTotal";
	int _messagesTotal;
	mixin(GetterSetter!("int", "Label")(MESSAGESTOTAL));

	/** The visibility of messages with this label in the message list in the Gmail web interface.*/
	private static const string MESSAGELISTVISIBILITY = "messageListVisibility";
	string _messageListVisibility;
	mixin(GetterSetter!("string", "Label")(MESSAGELISTVISIBILITY));

}
