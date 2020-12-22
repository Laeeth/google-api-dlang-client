module gcalendar.models.colors;

public struct Colors {
    JSONValue container;
    alias container this;

    /**
    * A global palette of calendar colors, mapping from the color ID to its definition. A
    * calendarListEntry resource refers to one of these color IDs in its color field. Read-only.
    * The value may be {@code null}.
    */
    private static const string CALENDAR = "calendar";

    /**
    * A global palette of event colors, mapping from the color ID to its definition. An event
    * resource may refer to one of these color IDs in its color field. Read-only.
    * The value may be {@code null}.
    */
    private static const string EVENT = "event";

    /**
    * Type of the resource ("calendar#colors").
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";

    /**
    * Last modification time of the color palette (as a RFC3339 timestamp). Read-only.
    * The value may be {@code null}.
    */
    private static const string UPDATED = "updated";

    /**
    * A global palette of calendar colors, mapping from the color ID to its definition. A
    * calendarListEntry resource refers to one of these color IDs in its color field. Read-only.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAssocArray!("ColorDefinition", "ColorDefinition[string]", "Colors")(CALENDAR));

    /**
    * A global palette of event colors, mapping from the color ID to its definition. An event
    * resource may refer to one of these color IDs in its color field. Read-only.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAssocArray!("ColorDefinition", "ColorDefinition[string]", "Colors")(EVENT));

    /**
    * Type of the resource ("calendar#colors").
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "Colors")(KIND));

    /**
    * Last modification time of the color palette (as a RFC3339 timestamp). Read-only.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(SysTime, "Colors")(UPDATED));
}