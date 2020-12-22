module gcalendar.models.calendar;

public struct Calendar {
    JSONValue container;
    alias container this;

    /**
    * Conferencing properties for this calendar, for example what types of conferences are allowed.
    * The value may be {@code null}.
    */
    private static const string CONFERENCE_PROPERTIES = "conferenceProperties";

    /**
    * Description of the calendar. Optional.
    * The value may be {@code null}.
    */
    private static const string DESCRIPTION = "description";

    /**
    * ETag of the resource.
    * The value may be {@code null}.
    */
    private static const string ETAG = "etag";    

    /**
    * Identifier of the calendar. To retrieve IDs call the calendarList.list() method.
    * The value may be {@code null}.
    */
    private static const string ID = "id";    

    /**
    * Type of the resource ("calendar#calendar").
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";    

    /**
    * Geographic location of the calendar as free-form text. Optional.
    * The value may be {@code null}.
    */
    private static const string LOCATION = "location";  

    /**
    * Title of the calendar.
    * The value may be {@code null}.
    */
    private static const string SUMMARY = "summary";    

    /**
    * The time zone of the calendar. (Formatted as an IANA Time Zone Database name, e.g.
    * "Europe/Zurich".) Optional.
    * The value may be {@code null}.
    */
    private static const string TIMEZONE = "timeZone";    

    /**
    * Conferencing properties for this calendar, for example what types of conferences are allowed.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAgregateType!("ConferenceProperties", "Calendar")(CONFERENCE_PROPERTIES));

    /**
    * Description of the calendar. Optional.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "Calendar")(DESCRIPTION));

    /**
    * ETag of the resource.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "Calendar")(ETAG));

    /**
    * Identifier of the calendar. To retrieve IDs call the calendarList.list() method.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "Calendar")(ID));

    /**
    * Type of the resource ("calendar#calendar").
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "Calendar")(KIND));

    /**
    * Geographic location of the calendar as free-form text. Optional.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "Calendar")(LOCATION));

    /**
    * Title of the calendar.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "Calendar")(SUMMARY));

    /**
    * The time zone of the calendar. (Formatted as an IANA Time Zone Database name, e.g.
    * "Europe/Zurich".) Optional.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "Calendar")(TIMEZONE));
}