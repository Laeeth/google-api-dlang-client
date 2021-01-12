module gmail.models.smtpmsa;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct SmtpMsa {
	/** The hostname of the SMTP service. Required.*/
	private static const string HOST = "host";
	string _host;
	mixin(GetterSetter!("string", "SmtpMsa")(HOST));

	/** The username that will be used for authentication with the SMTP service. This is a write-only field that can be specified in requests to create or update SendAs settings; it is never populated in responses.*/
	private static const string USERNAME = "username";
	string _username;
	mixin(GetterSetter!("string", "SmtpMsa")(USERNAME));

	/** The protocol that will be used to secure communication with the SMTP service. Required.*/
	private static const string SECURITYMODE = "securityMode";
	string _securityMode;
	mixin(GetterSetter!("string", "SmtpMsa")(SECURITYMODE));

	/** The password that will be used for authentication with the SMTP service. This is a write-only field that can be specified in requests to create or update SendAs settings; it is never populated in responses.*/
	private static const string PASSWORD = "password";
	string _password;
	mixin(GetterSetter!("string", "SmtpMsa")(PASSWORD));

	/** The port of the SMTP service. Required.*/
	private static const string PORT = "port";
	int _port;
	mixin(GetterSetter!("int", "SmtpMsa")(PORT));

}
