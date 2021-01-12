module gcalendar.models.aclrule;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct AclRule {
	/** Type of the resource ("calendar#aclRule").*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "AclRule")(KIND));

	/** The scope of the rule.*/
	private static const string SCOPE = "scope";
	public struct Scope {
		/** The type of the scope. Possible values are:  
- "default" - The public scope. This is the default value. 
- "user" - Limits the scope to a single user. 
- "group" - Limits the scope to a group. 
- "domain" - Limits the scope to a domain.  Note: The permissions granted to the "default", or public, scope apply to any user, authenticated or not.*/
		private static const string TYPE = "type";
		string _type;
		mixin(GetterSetter!("string", "Scope")(TYPE));

		/** The email address of a user or group, or the name of a domain, depending on the scope type. Omitted for type "default".*/
		private static const string VALUE = "value";
		string _value;
		mixin(GetterSetter!("string", "Scope")(VALUE));

	}

	/** Identifier of the ACL rule.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "AclRule")(ID));

	/** The role assigned to the scope. Possible values are:  
- "none" - Provides no access. 
- "freeBusyReader" - Provides read access to free/busy information. 
- "reader" - Provides read access to the calendar. Private events will appear to users with reader access, but event details will be hidden. 
- "writer" - Provides read and write access to the calendar. Private events will appear to users with writer access, and event details will be visible. 
- "owner" - Provides ownership of the calendar. This role has all of the permissions of the writer role with the additional ability to see and manipulate ACLs.*/
	private static const string ROLE = "role";
	string _role;
	mixin(GetterSetter!("string", "AclRule")(ROLE));

	/** ETag of the resource.*/
	private static const string ETAG = "etag";
	string _etag;
	mixin(GetterSetter!("string", "AclRule")(ETAG));

}
