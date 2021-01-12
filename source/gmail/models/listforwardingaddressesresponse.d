module gmail.models.listforwardingaddressesresponse;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ListForwardingAddressesResponse {
	/** List of addresses that may be used for forwarding.*/
	private static const string FORWARDINGADDRESSES = "forwardingAddresses";
	import gmail.models.forwardingaddress;
	ForwardingAddress[] _forwardingAddresses;
	mixin(GetterSetter!("ForwardingAddress[]", "ListForwardingAddressesResponse")(FORWARDINGADDRESSES));

}
