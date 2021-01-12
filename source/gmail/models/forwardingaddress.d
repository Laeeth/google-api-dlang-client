module gmail.models.forwardingaddress;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ForwardingAddress {
	/** Indicates whether this address has been verified and is usable for forwarding. Read-only.*/
	private static const string VERIFICATIONSTATUS = "verificationStatus";
	string _verificationStatus;
	mixin(GetterSetter!("string", "ForwardingAddress")(VERIFICATIONSTATUS));

	/** An email address to which messages can be forwarded.*/
	private static const string FORWARDINGEMAIL = "forwardingEmail";
	string _forwardingEmail;
	mixin(GetterSetter!("string", "ForwardingAddress")(FORWARDINGEMAIL));

}
