module gcalendar.models.ConferenceSolutionKey;



public struct ConferenceSolutionKey {
    JSONValue container;
    alias container this;

    /**
    * The conference solution type. If a client encounters an unfamiliar or empty type, it should
    * still be able to display the entry points. However, it should disallow modifications. The
    * possible values are:   - "eventHangout" for Hangouts for consumers (http://hangouts.google.com)
    * - "eventNamedHangout" for classic Hangouts for Google Workspace users
    * (http://hangouts.google.com) - "hangoutsMeet" for Google Meet (http://meet.google.com) -
    * "addOn" for 3P conference providers
    * The value may be {@code null}.
    */
    private static const string TYPE = "type";

    /**
    * The conference solution type. If a client encounters an unfamiliar or empty type, it should
    * still be able to display the entry points. However, it should disallow modifications. The
    * possible values are:   - "eventHangout" for Hangouts for consumers (http://hangouts.google.com)
    * - "eventNamedHangout" for classic Hangouts for Google Workspace users
    * (http://hangouts.google.com) - "hangoutsMeet" for Google Meet (http://meet.google.com) -
    * "addOn" for 3P conference providers
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "ConferenceSolutionKey")(TYPE));
}
