module gmail.models.profile;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Profile {
	/** The ID of the mailbox's current history record.*/
	private static const string HISTORYID = "historyId";
	string _historyId;
	mixin(GetterSetter!("string", "Profile")(HISTORYID));

	/** The total number of threads in the mailbox.*/
	private static const string THREADSTOTAL = "threadsTotal";
	int _threadsTotal;
	mixin(GetterSetter!("int", "Profile")(THREADSTOTAL));

	/** The total number of messages in the mailbox.*/
	private static const string MESSAGESTOTAL = "messagesTotal";
	int _messagesTotal;
	mixin(GetterSetter!("int", "Profile")(MESSAGESTOTAL));

	/** The user's email address.*/
	private static const string EMAILADDRESS = "emailAddress";
	string _emailAddress;
	mixin(GetterSetter!("string", "Profile")(EMAILADDRESS));

}
