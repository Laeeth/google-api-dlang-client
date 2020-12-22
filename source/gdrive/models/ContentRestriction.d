module gdrive.models.ContentRestriction;

import gdrive.drive;
import std.json;
import std.datetime : SysTime;
import std.typecons : Nullable, nullable;
import std.conv : to;

public final struct ContentRestriction {
    JSONValue container;
    alias container this;

    /**
    * Whether the content of the file is read-only. If a file is read-only, a new revision of the
    * file may not be added, comments may not be added or modified, and the title of the file may not
    * be modified.
    * The value may be {@code null}.
    */
    private static const string READ_ONLY = "readOnly";

    /**
    * Reason for why the content of the file is restricted. This is only mutable on requests that
    * also set readOnly=true.
    * The value may be {@code null}.
    */
    private static const string REASON = "reason";

    /**
    * The user who set the content restriction. Only populated if readOnly is true.
    * The value may be {@code null}.
    */

    //private User restrictingUser;

    /**
    * The time at which the content restriction was set (formatted RFC 3339 timestamp). Only
    * populated if readOnly is true.
    * The value may be {@code null}.
    */
    private static const string RESTRICTION_TIME = "restrictionTime";

    /**
    * The type of the content restriction. Currently the only possible value is
    * globalContentRestriction.
    * The value may be {@code null}.
    */
    private static const string TYPE = "type";    

    /**
    * Whether the content of the file is read-only. If a file is read-only, a new revision of the
    * file may not be added, comments may not be added or modified, and the title of the file may not
    * be modified.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "ContentRestriction")(READ_ONLY));

    /**
    * Reason for why the content of the file is restricted. This is only mutable on requests that
    * also set readOnly=true.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "ContentRestriction")(REASON));

    /**
    * The user who set the content restriction. Only populated if readOnly is true.
    * @return value or {@code null} for none
    */
    /*
    public User getRestrictingUser() {
    return restrictingUser;
    }

    /**
    * The user who set the content restriction. Only populated if readOnly is true.
    * @param restrictingUser restrictingUser or {@code null} for none
    */
    /*
    public ContentRestriction setRestrictingUser(User restrictingUser) {
    this.restrictingUser = restrictingUser;
    return this;
    }

    /**
    * The time at which the content restriction was set (formatted RFC 3339 timestamp). Only
    * populated if readOnly is true.
    * @return value or {@code null} for none
    */
    //mixin(Drive.GetterSetterBasicType!(SysTime, "ContentRestriction")(RESTRICTION_TIME));

    /**
    * The type of the content restriction. Currently the only possible value is
    * globalContentRestriction.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "ContentRestriction")(TYPE));
}