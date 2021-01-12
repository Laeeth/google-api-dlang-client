module gmail.models.filtercriteria;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct FilterCriteria {
	/** Only return messages matching the specified query. Supports the same query format as the Gmail search box. For example, `"from:someuser@example.com rfc822msgid: is:unread"`.*/
	private static const string QUERY = "query";
	string _query;
	mixin(GetterSetter!("string", "FilterCriteria")(QUERY));

	/** The recipient's display name or email address. Includes recipients in the "to", "cc", and "bcc" header fields. You can use simply the local part of the email address. For example, "example" and "example@" both match "example@gmail.com". This field is case-insensitive.*/
	private static const string TO = "to";
	string _to;
	mixin(GetterSetter!("string", "FilterCriteria")(TO));

	/** Whether the response should exclude chats.*/
	private static const string EXCLUDECHATS = "excludeChats";
	bool _excludeChats;
	mixin(GetterSetter!("bool", "FilterCriteria")(EXCLUDECHATS));

	/** The size of the entire RFC822 message in bytes, including all headers and attachments.*/
	private static const string SIZE = "size";
	int _size;
	mixin(GetterSetter!("int", "FilterCriteria")(SIZE));

	/** Only return messages not matching the specified query. Supports the same query format as the Gmail search box. For example, `"from:someuser@example.com rfc822msgid: is:unread"`.*/
	private static const string NEGATEDQUERY = "negatedQuery";
	string _negatedQuery;
	mixin(GetterSetter!("string", "FilterCriteria")(NEGATEDQUERY));

	/** Whether the message has any attachment.*/
	private static const string HASATTACHMENT = "hasAttachment";
	bool _hasAttachment;
	mixin(GetterSetter!("bool", "FilterCriteria")(HASATTACHMENT));

	/** Case-insensitive phrase found in the message's subject. Trailing and leading whitespace are be trimmed and adjacent spaces are collapsed.*/
	private static const string SUBJECT = "subject";
	string _subject;
	mixin(GetterSetter!("string", "FilterCriteria")(SUBJECT));

	/** The sender's display name or email address.*/
	private static const string FROM = "from";
	string _from;
	mixin(GetterSetter!("string", "FilterCriteria")(FROM));

	/** How the message size in bytes should be in relation to the size field.*/
	private static const string SIZECOMPARISON = "sizeComparison";
	string _sizeComparison;
	mixin(GetterSetter!("string", "FilterCriteria")(SIZECOMPARISON));

}
