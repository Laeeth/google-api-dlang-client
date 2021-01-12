module gmail.models.vacationsettings;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct VacationSettings {
	/** Flag that determines whether responses are sent to recipients who are outside of the user's domain. This feature is only available for G Suite users.*/
	private static const string RESTRICTTODOMAIN = "restrictToDomain";
	@optional bool _restrictToDomain;
	mixin(GetterSetter!("bool", "VacationSettings")(RESTRICTTODOMAIN));

	/** Response body in plain text format. If both `response_body_plain_text` and `response_body_html` are specified, `response_body_html` will be used.*/
	private static const string RESPONSEBODYPLAINTEXT = "responseBodyPlainText";
	string _responseBodyPlainText;
	mixin(GetterSetter!("string", "VacationSettings")(RESPONSEBODYPLAINTEXT));

	/** Flag that determines whether responses are sent to recipients who are not in the user's list of contacts.*/
	private static const string RESTRICTTOCONTACTS = "restrictToContacts";
	bool _restrictToContacts;
	mixin(GetterSetter!("bool", "VacationSettings")(RESTRICTTOCONTACTS));

	/** An optional end time for sending auto-replies (epoch ms). When this is specified, Gmail will automatically reply only to messages that it receives before the end time. If both `startTime` and `endTime` are specified, `startTime` must precede `endTime`.*/
	private static const string ENDTIME = "endTime";
	string _endTime;
	mixin(GetterSetter!("string", "VacationSettings")(ENDTIME));

	/** Response body in HTML format. Gmail will sanitize the HTML before storing it. If both `response_body_plain_text` and `response_body_html` are specified, `response_body_html` will be used.*/
	private static const string RESPONSEBODYHTML = "responseBodyHtml";
	string _responseBodyHtml;
	mixin(GetterSetter!("string", "VacationSettings")(RESPONSEBODYHTML));

	/** Flag that controls whether Gmail automatically replies to messages.*/
	private static const string ENABLEAUTOREPLY = "enableAutoReply";
	bool _enableAutoReply;
	mixin(GetterSetter!("bool", "VacationSettings")(ENABLEAUTOREPLY));

	/** Optional text to prepend to the subject line in vacation responses. In order to enable auto-replies, either the response subject or the response body must be nonempty.*/
	private static const string RESPONSESUBJECT = "responseSubject";
	@optional string _responseSubject;
	mixin(GetterSetter!("string", "VacationSettings")(RESPONSESUBJECT));

	/** An optional start time for sending auto-replies (epoch ms). When this is specified, Gmail will automatically reply only to messages that it receives after the start time. If both `startTime` and `endTime` are specified, `startTime` must precede `endTime`.*/
	private static const string STARTTIME = "startTime";
	string _startTime;
	mixin(GetterSetter!("string", "VacationSettings")(STARTTIME));

}
