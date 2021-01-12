module gmail.models.imapsettings;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ImapSettings {
	/** The action that will be executed on a message when it is marked as deleted and expunged from the last visible IMAP folder.*/
	private static const string EXPUNGEBEHAVIOR = "expungeBehavior";
	string _expungeBehavior;
	mixin(GetterSetter!("string", "ImapSettings")(EXPUNGEBEHAVIOR));

	/** An optional limit on the number of messages that an IMAP folder may contain. Legal values are 0, 1000, 2000, 5000 or 10000. A value of zero is interpreted to mean that there is no limit.*/
	private static const string MAXFOLDERSIZE = "maxFolderSize";
	int _maxFolderSize;
	mixin(GetterSetter!("int", "ImapSettings")(MAXFOLDERSIZE));

	/** Whether IMAP is enabled for the account.*/
	private static const string ENABLED = "enabled";
	bool _enabled;
	mixin(GetterSetter!("bool", "ImapSettings")(ENABLED));

	/** If this value is true, Gmail will immediately expunge a message when it is marked as deleted in IMAP. Otherwise, Gmail will wait for an update from the client before expunging messages marked as deleted.*/
	private static const string AUTOEXPUNGE = "autoExpunge";
	bool _autoExpunge;
	mixin(GetterSetter!("bool", "ImapSettings")(AUTOEXPUNGE));

}
