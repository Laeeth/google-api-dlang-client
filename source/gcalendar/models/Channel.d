module gdrive.models.channel;

import gdrive.drive;
import std.json;
import std.typecons : Nullable, nullable;
import std.conv : to;
import std.datetime : SysTime;

public final struct Channel {
    JSONValue container;
    alias container this;

    /**
    * The address where notifications are delivered for this channel.
    * The value may be {@code null}.
    */
    private static const string ADDRESS = "address";

    /**
    * Date and time of notification channel expiration, expressed as a Unix timestamp, in
    * milliseconds. Optional.
    * The value may be {@code null}.
    */
    private static const string EXPIRATION = "expiration";     

    /**
    * A UUID or similar unique string that identifies this channel.
    * The value may be {@code null}.
    */
    private static const string ID = "id";    

    /**
    * Identifies this as a notification channel used to watch for changes to a resource, which is
    * "api#channel".
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";    

    /**
    * Additional parameters controlling delivery channel behavior. Optional.
    * The value may be {@code null}.
    */
    private static const string PARAMS = "params";    

    /**
    * A Boolean value to indicate whether payload is wanted. Optional.
    * The value may be {@code null}.
    */
    private static const string PAYLOAD = "payload";    

    /**
    * An opaque ID that identifies the resource being watched on this channel. Stable across
    * different API versions.
    * The value may be {@code null}.
    */
    private static const string RESOURCE_ID = "resourceId";    

    /**
    * A version-specific identifier for the watched resource.
    * The value may be {@code null}.
    */
    private static const string RESOURCE_URI = "resourceUri";    

    /**
    * An arbitrary string delivered to the target address with each notification delivered over this
    * channel. Optional.
    * The value may be {@code null}.
    */
    private static const string TOKEN = "token";    

    /**
    * The type of delivery mechanism used for this channel.
    * The value may be {@code null}.
    */
    private static const string TYPE = "type";

    /**
    * The address where notifications are delivered for this channel.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Channel")(ADDRESS));

    /**
    * Date and time of notification channel expiration, expressed as a Unix timestamp, in
    * milliseconds. Optional.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(long, "Channel")(EXPIRATION));

    /**
    * A UUID or similar unique string that identifies this channel.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Channel")(ID));

    /**
    * Identifies this as a notification channel used to watch for changes to a resource, which is
    * "api#channel".
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Channel")(KIND));

    /**
    * Additional parameters controlling delivery channel behavior. Optional.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterAssocArray!("string", "string[string]", "Channel")(PARAMS));

    /**
    * A Boolean value to indicate whether payload is wanted. Optional.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(bool, "Channel")(PAYLOAD));

    /**
    * An opaque ID that identifies the resource being watched on this channel. Stable across
    * different API versions.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Channel")(RESOURCE_ID));

    /**
    * A version-specific identifier for the watched resource.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Channel")(RESOURCE_URI));

    /**
    * An arbitrary string delivered to the target address with each notification delivered over this
    * channel. Optional.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Channel")(TOKEN));

    /**
    * The type of delivery mechanism used for this channel.
    * @return value or {@code null} for none
    */
    mixin(Drive.GetterSetterBasicType!(string, "Channel")(TYPE));
}

