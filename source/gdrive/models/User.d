module gdrive.models.user;

import gdrive.drive;
import std.json;
import std.datetime : SysTime;
import std.typecons : Nullable, nullable;
import std.conv : to;

public final struct User {
    JSONValue container;
    alias container this;

    /**
    * A plain text displayable name for this user.
    * The value may be {@code null}.
    */
    private static const string DISPLAY_NAME = "displayName";

    /**
    * The email address of the user. This may not be present in certain contexts if the user has not
    * made their email address visible to the requester.
    * The value may be {@code null}.
    */
    private static const string EMAIL_ADDRESS = "emailAddress";    

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#user".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";    

    /**
    * Whether this user is the requesting user.
    * The value may be {@code null}.
    */
    private static const string ME = "me";    

    /**
    * The user's ID as visible in Permission resources.
    * The value may be {@code null}.
    */
    private static const string PERMISSION_ID = "permissionId";

    /**
    * A link to the user's profile photo, if available.
    * The value may be {@code null}.
    */
    private static const string PHOTO_LINK = "photoLink";    

    /**
    * A plain text displayable name for this user.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "User")(DISPLAY_NAME));

    /**
    * The email address of the user. This may not be present in certain contexts if the user has not
    * made their email address visible to the requester.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "User")(EMAIL_ADDRESS));

    /**
    * Identifies what kind of resource this is. Value: the fixed string "drive#user".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "User")(KIND));

    /**
    * Whether this user is the requesting user.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "User")(ME));

    /**
    * The user's ID as visible in Permission resources.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "User")(PERMISSION_ID));

    /**
    * A link to the user's profile photo, if available.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "User")(PHOTO_LINK));
}