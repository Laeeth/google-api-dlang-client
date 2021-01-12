module gcalendar.models.entrypoint;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct EntryPoint {
	/** The type of the conference entry point.
Possible values are:  
- "video" - joining a conference over HTTP. A conference can have zero or one video entry point.
- "phone" - joining a conference by dialing a phone number. A conference can have zero or more phone entry points.
- "sip" - joining a conference over SIP. A conference can have zero or one sip entry point.
- "more" - further conference joining instructions, for example additional phone numbers. A conference can have zero or one more entry point. A conference with only a more entry point is not a valid conference.*/
	private static const string ENTRYPOINTTYPE = "entryPointType";
	string _entryPointType;
	mixin(GetterSetter!("string", "EntryPoint")(ENTRYPOINTTYPE));

	/** The meeting code to access the conference. The maximum length is 128 characters.
When creating new conference data, populate only the subset of {meetingCode, accessCode, passcode, password, pin} fields that match the terminology that the conference provider uses. Only the populated fields should be displayed.
Optional.*/
	private static const string MEETINGCODE = "meetingCode";
	@optional string _meetingCode;
	mixin(GetterSetter!("string", "EntryPoint")(MEETINGCODE));

	/** The URI of the entry point. The maximum length is 1300 characters.
Format:  
- for video, http: or https: schema is required.
- for phone, tel: schema is required. The URI should include the entire dial sequence (e.g., tel:+12345678900,,,123456789;1234).
- for sip, sip: schema is required, e.g., sip:12345678@myprovider.com.
- for more, http: or https: schema is required.*/
	private static const string URI = "uri";
	string _uri;
	mixin(GetterSetter!("string", "EntryPoint")(URI));

	/** The CLDR/ISO 3166 region code for the country associated with this phone access. Example: "SE" for Sweden.
Calendar backend will populate this field only for EntryPointType.PHONE.*/
	private static const string REGIONCODE = "regionCode";
	string _regionCode;
	mixin(GetterSetter!("string", "EntryPoint")(REGIONCODE));

	/** The passcode to access the conference. The maximum length is 128 characters.
When creating new conference data, populate only the subset of {meetingCode, accessCode, passcode, password, pin} fields that match the terminology that the conference provider uses. Only the populated fields should be displayed.*/
	private static const string PASSCODE = "passcode";
	string _passcode;
	mixin(GetterSetter!("string", "EntryPoint")(PASSCODE));

	/** Features of the entry point, such as being toll or toll-free. One entry point can have multiple features. However, toll and toll-free cannot be both set on the same entry point.*/
	private static const string ENTRYPOINTFEATURES = "entryPointFeatures";
	string[] _entryPointFeatures;
	mixin(GetterSetter!("string[]", "EntryPoint")(ENTRYPOINTFEATURES));

	/** The label for the URI. Visible to end users. Not localized. The maximum length is 512 characters.
Examples:  
- for video: meet.google.com/aaa-bbbb-ccc
- for phone: +1 123 268 2601
- for sip: 12345678@altostrat.com
- for more: should not be filled  
Optional.*/
	private static const string LABEL = "label";
	@optional string _label;
	mixin(GetterSetter!("string", "EntryPoint")(LABEL));

	/** The PIN to access the conference. The maximum length is 128 characters.
When creating new conference data, populate only the subset of {meetingCode, accessCode, passcode, password, pin} fields that match the terminology that the conference provider uses. Only the populated fields should be displayed.
Optional.*/
	private static const string PIN = "pin";
	@optional string _pin;
	mixin(GetterSetter!("string", "EntryPoint")(PIN));

	/** The password to access the conference. The maximum length is 128 characters.
When creating new conference data, populate only the subset of {meetingCode, accessCode, passcode, password, pin} fields that match the terminology that the conference provider uses. Only the populated fields should be displayed.
Optional.*/
	private static const string PASSWORD = "password";
	@optional string _password;
	mixin(GetterSetter!("string", "EntryPoint")(PASSWORD));

	/** The access code to access the conference. The maximum length is 128 characters.
When creating new conference data, populate only the subset of {meetingCode, accessCode, passcode, password, pin} fields that match the terminology that the conference provider uses. Only the populated fields should be displayed.
Optional.*/
	private static const string ACCESSCODE = "accessCode";
	@optional string _accessCode;
	mixin(GetterSetter!("string", "EntryPoint")(ACCESSCODE));

}
