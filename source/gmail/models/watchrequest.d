module gmail.models.watchrequest;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct WatchRequest {
	/** List of label_ids to restrict notifications about. By default, if unspecified, all changes are pushed out. If specified then dictates which labels are required for a push notification to be generated.*/
	private static const string LABELIDS = "labelIds";
	string[] _labelIds;
	mixin(GetterSetter!("string[]", "WatchRequest")(LABELIDS));

	/** A fully qualified Google Cloud Pub/Sub API topic name to publish the events to. This topic name **must** already exist in Cloud Pub/Sub and you **must** have already granted gmail "publish" permission on it. For example, "projects/my-project-identifier/topics/my-topic-name" (using the Cloud Pub/Sub "v1" topic naming format). Note that the "my-project-identifier" portion must exactly match your Google developer project id (the one executing this watch request).*/
	private static const string TOPICNAME = "topicName";
	string _topicName;
	mixin(GetterSetter!("string", "WatchRequest")(TOPICNAME));

	/** Filtering behavior of labelIds list specified.*/
	private static const string LABELFILTERACTION = "labelFilterAction";
	string _labelFilterAction;
	mixin(GetterSetter!("string", "WatchRequest")(LABELFILTERACTION));

}
