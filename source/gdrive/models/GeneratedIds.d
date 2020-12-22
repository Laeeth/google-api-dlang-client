module gdrive.models.generatedIds;

import gdrive.drive;
import std.json;
import std.typecons : Nullable, nullable;
import std.conv : to;
import std.datetime : SysTime;

public final struct GeneratedIds {
    JSONValue container;
    alias container this;
    /**
    * The IDs generated for the requesting user in the specified space.
    * The value may be {@code null}.
    */
    private static const string IDS = "ids";

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#generatedIds".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";

    /**
    * The type of file that can be created with these IDs.
    * The value may be {@code null}.
    */
    private static const string SPACE = "space";

    /**
    * The IDs generated for the requesting user in the specified space.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string[], "GeneratedIds")(IDS));

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#generatedIds".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "GeneratedIds")(KIND));

    /**
    * The type of file that can be created with these IDs.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "GeneratedIds")(SPACE));
}