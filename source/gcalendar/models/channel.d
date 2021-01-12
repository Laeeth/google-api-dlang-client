module gcalendar.models.channel;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Channel {
	/** A bool value to indicate whether payload is wanted. Optional.*/
	private static const string PAYLOAD = "payload";
	@optional bool _payload;
	mixin(GetterSetter!("bool", "Channel")(PAYLOAD));

	/** A UUID or similar unique string that identifies this channel.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "Channel")(ID));

	/** Identifies this as a notification channel used to watch for changes to a resource, which is "api#channel".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "Channel")(KIND));

	/** An arbitrary string delivered to the target address with each notification delivered over this channel. Optional.*/
	private static const string TOKEN = "token";
	@optional string _token;
	mixin(GetterSetter!("string", "Channel")(TOKEN));

	/** Date and time of notification channel expiration, expressed as a Unix timestamp, in milliseconds. Optional.*/
	private static const string EXPIRATION = "expiration";
	@optional string _expiration;
	mixin(GetterSetter!("string", "Channel")(EXPIRATION));

	/** An opaque ID that identifies the resource being watched on this channel. Stable across different API versions.*/
	private static const string RESOURCEID = "resourceId";
	string _resourceId;
	mixin(GetterSetter!("string", "Channel")(RESOURCEID));

	/** Additional parameters controlling delivery channel behavior. Optional.*/
	private static const string PARAMS = "params";
	@optional string[string] _params;
	mixin(GetterSetter!("string[string]", "Channel")(PARAMS));

	/** A version-specific identifier for the watched resource.*/
	private static const string RESOURCEURI = "resourceUri";
	string _resourceUri;
	mixin(GetterSetter!("string", "Channel")(RESOURCEURI));

	/** The address where notifications are delivered for this channel.*/
	private static const string ADDRESS = "address";
	string _address;
	mixin(GetterSetter!("string", "Channel")(ADDRESS));

	/** The type of delivery mechanism used for this channel.*/
	private static const string TYPE = "type";
	string _type;
	mixin(GetterSetter!("string", "Channel")(TYPE));

}
