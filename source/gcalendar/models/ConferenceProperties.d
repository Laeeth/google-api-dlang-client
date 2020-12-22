module gcalendar.models.ConferenceProperties;



public struct ConferenceProperties {
    JSONValue container;
    alias container this;

    /**
    * The types of conference solutions that are supported for this calendar. The possible values
    * are:   - "eventHangout"  - "eventNamedHangout"  - "hangoutsMeet"  Optional.
    * The value may be {@code null}.
    */
    private static const string ALLOWED_CONFERENCE_SOLUTION_TYPES = "allowedConferenceSolutionTypes";

    /**
    * The types of conference solutions that are supported for this calendar. The possible values
    * are:   - "eventHangout"  - "eventNamedHangout"  - "hangoutsMeet"  Optional.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string[], "ConferenceProperties")(ALLOWED_CONFERENCE_SOLUTION_TYPES));
}