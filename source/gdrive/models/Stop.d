module gdrive.models.stop;

import gdrive.drive;
import std.json;
import std.typecons : Nullable, nullable;
import std.conv : to;
import std.datetime : SysTime;

public final struct Stop {
    JSONValue container;
    alias container this;

    private static const string KIND = "kind";

    private static const string ID = "id";

    private static const string RESOURCE_ID = "resourceId";

    private static const string RESOURCE_URI = "resourceUri";

    private static const string TOKEN = "token";

    private static const string EXPIRATION = "expiration";

    private static const string TYPE = "type";

    private static const string ADDRESS = "address";

    private static const string PAYLOAD = "payload";

    private static const string PARAMS = "params";

    mixin(Drive.GetterSetterBasicType!(string, "Stop")(KIND));

    mixin(Drive.GetterSetterBasicType!(string, "Stop")(ID));

    mixin(Drive.GetterSetterBasicType!(string, "Stop")(RESOURCE_ID));

    mixin(Drive.GetterSetterBasicType!(string, "Stop")(RESOURCE_URI));

    mixin(Drive.GetterSetterBasicType!(string, "Stop")(TOKEN));

    mixin(Drive.GetterSetterBasicType!(long, "Stop")(EXPIRATION));

    mixin(Drive.GetterSetterBasicType!(string, "Stop")(TYPE));

    mixin(Drive.GetterSetterBasicType!(string, "Stop")(ADDRESS));

    mixin(Drive.GetterSetterBasicType!(bool, "Stop")(PAYLOAD));

    mixin(Drive.GetterSetterAssocArray!("string", "string[string]", "Stop")(PARAMS));
}

