module gmail.models.thread;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Thread {
	/** The ID of the last history record that modified this thread.*/
	private static const string HISTORYID = "historyId";
	string _historyId;
	mixin(GetterSetter!("string", "Thread")(HISTORYID));

	/** A short part of the message text.*/
	private static const string SNIPPET = "snippet";
	string _snippet;
	mixin(GetterSetter!("string", "Thread")(SNIPPET));

	/** The list of messages in the thread.*/
	private static const string MESSAGES = "messages";
	import gmail.models.message;
	Message[] _messages;
	mixin(GetterSetter!("Message[]", "Thread")(MESSAGES));

	/** The unique ID of the thread.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "Thread")(ID));

}
