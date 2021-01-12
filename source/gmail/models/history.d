module gmail.models.history;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct History {
	/** The mailbox sequence ID.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "History")(ID));

	/** Labels added to messages in this history record.*/
	private static const string LABELSADDED = "labelsAdded";
	import gmail.models.historylabeladded;
	HistoryLabelAdded[] _labelsAdded;
	mixin(GetterSetter!("HistoryLabelAdded[]", "History")(LABELSADDED));

	/** List of messages changed in this history record. The fields for specific change types, such as `messagesAdded` may duplicate messages in this field. We recommend using the specific change-type fields instead of this.*/
	private static const string MESSAGES = "messages";
	import gmail.models.message;
	Message[] _messages;
	mixin(GetterSetter!("Message[]", "History")(MESSAGES));

	/** Messages added to the mailbox in this history record.*/
	private static const string MESSAGESADDED = "messagesAdded";
	import gmail.models.historymessageadded;
	HistoryMessageAdded[] _messagesAdded;
	mixin(GetterSetter!("HistoryMessageAdded[]", "History")(MESSAGESADDED));

	/** Messages deleted (not Trashed) from the mailbox in this history record.*/
	private static const string MESSAGESDELETED = "messagesDeleted";
	import gmail.models.historymessagedeleted;
	HistoryMessageDeleted[] _messagesDeleted;
	mixin(GetterSetter!("HistoryMessageDeleted[]", "History")(MESSAGESDELETED));

	/** Labels removed from messages in this history record.*/
	private static const string LABELSREMOVED = "labelsRemoved";
	import gmail.models.historylabelremoved;
	HistoryLabelRemoved[] _labelsRemoved;
	mixin(GetterSetter!("HistoryLabelRemoved[]", "History")(LABELSREMOVED));

}
