module gmail.models.sendas;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct SendAs {
	/** An optional HTML signature that is included in messages composed with this alias in the Gmail web UI.*/
	private static const string SIGNATURE = "signature";
	string _signature;
	mixin(GetterSetter!("string", "SendAs")(SIGNATURE));

	/** Whether Gmail should treat this address as an alias for the user's primary email address. This setting only applies to custom "from" aliases.*/
	private static const string TREATASALIAS = "treatAsAlias";
	bool _treatAsAlias;
	mixin(GetterSetter!("bool", "SendAs")(TREATASALIAS));

	/** An optional SMTP service that will be used as an outbound relay for mail sent using this alias. If this is empty, outbound mail will be sent directly from Gmail's servers to the destination SMTP service. This setting only applies to custom "from" aliases.*/
	private static const string SMTPMSA = "smtpMsa";
	import gmail.models.smtpmsa;
	SmtpMsa _smtpMsa;
	mixin(GetterSetter!("SmtpMsa", "SendAs")(SMTPMSA));

	/** An optional email address that is included in a "Reply-To:" header for mail sent using this alias. If this is empty, Gmail will not generate a "Reply-To:" header.*/
	private static const string REPLYTOADDRESS = "replyToAddress";
	string _replyToAddress;
	mixin(GetterSetter!("string", "SendAs")(REPLYTOADDRESS));

	/** The email address that appears in the "From:" header for mail sent using this alias. This is read-only for all operations except create.*/
	private static const string SENDASEMAIL = "sendAsEmail";
	string _sendAsEmail;
	mixin(GetterSetter!("string", "SendAs")(SENDASEMAIL));

	/** A name that appears in the "From:" header for mail sent using this alias. For custom "from" addresses, when this is empty, Gmail will populate the "From:" header with the name that is used for the primary address associated with the account. If the admin has disabled the ability for users to update their name format, requests to update this field for the primary login will silently fail.*/
	private static const string DISPLAYNAME = "displayName";
	string _displayName;
	mixin(GetterSetter!("string", "SendAs")(DISPLAYNAME));

	/** Whether this address is selected as the default "From:" address in situations such as composing a new message or sending a vacation auto-reply. Every Gmail account has exactly one default send-as address, so the only legal value that clients may write to this field is `true`. Changing this from `false` to `true` for an address will result in this field becoming `false` for the other previous default address.*/
	private static const string ISDEFAULT = "isDefault";
	bool _isDefault;
	mixin(GetterSetter!("bool", "SendAs")(ISDEFAULT));

	/** Indicates whether this address has been verified for use as a send-as alias. Read-only. This setting only applies to custom "from" aliases.*/
	private static const string VERIFICATIONSTATUS = "verificationStatus";
	string _verificationStatus;
	mixin(GetterSetter!("string", "SendAs")(VERIFICATIONSTATUS));

	/** Whether this address is the primary address used to login to the account. Every Gmail account has exactly one primary address, and it cannot be deleted from the collection of send-as aliases. This field is read-only.*/
	private static const string ISPRIMARY = "isPrimary";
	bool _isPrimary;
	mixin(GetterSetter!("bool", "SendAs")(ISPRIMARY));

}
