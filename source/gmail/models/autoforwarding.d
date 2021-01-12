module gmail.models.autoforwarding;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct AutoForwarding {
	/** Whether all incoming mail is automatically forwarded to another address.*/
	private static const string ENABLED = "enabled";
	bool _enabled;
	mixin(GetterSetter!("bool", "AutoForwarding")(ENABLED));

	/** The state that a message should be left in after it has been forwarded.*/
	private static const string DISPOSITION = "disposition";
	string _disposition;
	mixin(GetterSetter!("string", "AutoForwarding")(DISPOSITION));

	/** Email address to which all incoming messages are forwarded. This email address must be a verified member of the forwarding addresses.*/
	private static const string EMAILADDRESS = "emailAddress";
	string _emailAddress;
	mixin(GetterSetter!("string", "AutoForwarding")(EMAILADDRESS));

}
