module gmail.models.messagepartheader;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct MessagePartHeader {
	/** The value of the header after the `:` separator. For example, `someuser@example.com`.*/
	private static const string VALUE = "value";
	string _value;
	mixin(GetterSetter!("string", "MessagePartHeader")(VALUE));

	/** The name of the header before the `:` separator. For example, `To`.*/
	private static const string NAME = "name";
	string _name;
	mixin(GetterSetter!("string", "MessagePartHeader")(NAME));

}
