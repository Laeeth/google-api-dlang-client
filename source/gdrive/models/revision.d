module gdrive.models.revision;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct Revision {
	/** The last time the revision was modified (RFC 3339 date-time).*/
	private static const string MODIFIEDTIME = "modifiedTime";
	string _modifiedTime;
	mixin(GetterSetter!("string", "Revision")(MODIFIEDTIME));

	/** Whether this revision is published outside the domain. This is only applicable to Docs Editors files.*/
	private static const string PUBLISHEDOUTSIDEDOMAIN = "publishedOutsideDomain";
	bool _publishedOutsideDomain;
	mixin(GetterSetter!("bool", "Revision")(PUBLISHEDOUTSIDEDOMAIN));

	/** Links for exporting Docs Editors files to specific formats.*/
	private static const string EXPORTLINKS = "exportLinks";
	string[string] _exportLinks;
	mixin(GetterSetter!("string[string]", "Revision")(EXPORTLINKS));

	/** The ID of the revision.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "Revision")(ID));

	/** The MD5 checksum of the revision's content. This is only applicable to files with binary content in Drive.*/
	private static const string MD5CHECKSUM = "md5Checksum";
	string _md5Checksum;
	mixin(GetterSetter!("string", "Revision")(MD5CHECKSUM));

	/** Identifies what kind of resource this is. Value: the fixed string "drive#revision".*/
	private static const string KIND = "kind";
	string _kind;
	mixin(GetterSetter!("string", "Revision")(KIND));

	/** The original filename used to create this revision. This is only applicable to files with binary content in Drive.*/
	private static const string ORIGINALFILENAME = "originalFilename";
	string _originalFilename;
	mixin(GetterSetter!("string", "Revision")(ORIGINALFILENAME));

	/** Whether subsequent revisions will be automatically republished. This is only applicable to Docs Editors files.*/
	private static const string PUBLISHAUTO = "publishAuto";
	bool _publishAuto;
	mixin(GetterSetter!("bool", "Revision")(PUBLISHAUTO));

	/** Whether this revision is published. This is only applicable to Docs Editors files.*/
	private static const string PUBLISHED = "published";
	bool _published;
	mixin(GetterSetter!("bool", "Revision")(PUBLISHED));

	/** The size of the revision's content in bytes. This is only applicable to files with binary content in Drive.*/
	private static const string SIZE = "size";
	string _size;
	mixin(GetterSetter!("string", "Revision")(SIZE));

	/** The last user to modify this revision.*/
	private static const string LASTMODIFYINGUSER = "lastModifyingUser";
	import gdrive.models.user;
	User _lastModifyingUser;
	mixin(GetterSetter!("User", "Revision")(LASTMODIFYINGUSER));

	/** A link to the published revision. This is only populated for Google Sites files.*/
	private static const string PUBLISHEDLINK = "publishedLink";
	string _publishedLink;
	mixin(GetterSetter!("string", "Revision")(PUBLISHEDLINK));

	/** Whether to keep this revision forever, even if it is no longer the head revision. If not set, the revision will be automatically purged 30 days after newer content is uploaded. This can be set on a maximum of 200 revisions for a file.
This field is only applicable to files with binary content in Drive.*/
	private static const string KEEPFOREVER = "keepForever";
	bool _keepForever;
	mixin(GetterSetter!("bool", "Revision")(KEEPFOREVER));

	/** The MIME type of the revision.*/
	private static const string MIMETYPE = "mimeType";
	string _mimeType;
	mixin(GetterSetter!("string", "Revision")(MIMETYPE));

}
