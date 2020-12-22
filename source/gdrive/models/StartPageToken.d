module gdrive.models.StartPageToken;

import gdrive.drive;
import std.json;
import std.conv : to;
import std.datetime : SysTime;
import std.typecons : Nullable, nullable;

public final struct StartPageToken{
    JSONValue container;
    alias container this;
    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#startPageToken".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind"; 

    /**
    * The starting page token for listing changes.
    * The value may be {@code null}.
    */
    private static const string START_PAGE_TOKEN = "startPageToken";

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#startPageToken".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "StartPageToken")(KIND));

    /**
    * The starting page token for listing changes.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "StartPageToken")(START_PAGE_TOKEN));
}