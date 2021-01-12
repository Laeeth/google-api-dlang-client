module gmail.models.listlabelsresponse;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct ListLabelsResponse {
	/** List of labels. Note that each label resource only contains an `id`, `name`, `messageListVisibility`, `labelListVisibility`, and `type`. The labels.get method can fetch additional label details.*/
	private static const string LABELS = "labels";
	import gmail.models.label;
	Label[] _labels;
	mixin(GetterSetter!("Label[]", "ListLabelsResponse")(LABELS));

}
