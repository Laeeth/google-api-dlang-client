module gmail.models.delegate;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Delegate {
	/** The email address of the delegate.*/
	private static const string DELEGATEEMAIL = "delegateEmail";
	string _delegateEmail;
	mixin(GetterSetter!("string", "Delegate")(DELEGATEEMAIL));

	/** Indicates whether this address has been verified and can act as a delegate for the account. Read-only.*/
	private static const string VERIFICATIONSTATUS = "verificationStatus";
	string _verificationStatus;
	mixin(GetterSetter!("string", "Delegate")(VERIFICATIONSTATUS));

}
