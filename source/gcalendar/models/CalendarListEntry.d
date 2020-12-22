module gcalendar.models.calendarlistentry;

public struct CalendarListEntry {
    JSONValue container;
    alias container this;

    /**
    * The effective access role that the authenticated user has on the calendar. Read-only. Possible
    * values are: - "freeBusyReader" - Provides read access to free/busy information.  - "reader" -
    * Provides read access to the calendar. Private events will appear to users with reader access,
    * but event details will be hidden.  - "writer" - Provides read and write access to the calendar.
    * Private events will appear to users with writer access, and event details will be visible.  -
    * "owner" - Provides ownership of the calendar. This role has all of the permissions of the
    * writer role with the additional ability to see and manipulate ACLs.
    * The value may be {@code null}.
    */
    private static const string ACCESS_ROLE = "accessRole";

    /**
    * The main color of the calendar in the hexadecimal format "#0088aa". This property supersedes
    * the index-based colorId property. To set or change this property, you need to specify
    * colorRgbFormat=true in the parameters of the insert, update and patch methods. Optional.
    * The value may be {@code null}.
    */
    private static const string BACKGROUND_COLOR = "backgroundColor";    

    /**
    * The color of the calendar. This is an ID referring to an entry in the calendar section of the
    * colors definition (see the colors endpoint). This property is superseded by the backgroundColor
    * and foregroundColor properties and can be ignored when using these properties. Optional.
    * The value may be {@code null}.
    */
    private static const string COLOR_ID = "colorId";

    /**
    * Conferencing properties for this calendar, for example what types of conferences are allowed.
    * The value may be {@code null}.
    */
    private static const string CONFERENCE_PROPERTIES = "conferenceProperties";    

    /**
    * The default reminders that the authenticated user has for this calendar.
    * The value may be {@code null}.
    */
    private static const string DEFAULT_REMINDERS = "defaultReminders";    

    /**
    * Whether this calendar list entry has been deleted from the calendar list. Read-only. Optional.
    * The default is False.
    * The value may be {@code null}.
    */
    private static const string DELETED = "deleted";    

    /**
    * Description of the calendar. Optional. Read-only.
    * The value may be {@code null}.
    */
    private static const string DESCRIPTION = "description";    

    /**
    * ETag of the resource.
    * The value may be {@code null}.
    */
    private static const string ETAG = "etag";    

    /**
    * The foreground color of the calendar in the hexadecimal format "#ffffff". This property
    * supersedes the index-based colorId property. To set or change this property, you need to
    * specify colorRgbFormat=true in the parameters of the insert, update and patch methods.
    * Optional.
    * The value may be {@code null}.
    */
    private static const string FOREGROUND_COLOR = "foregroundColor";    

    /**
    * Whether the calendar has been hidden from the list. Optional. The attribute is only returned
    * when the calendar is hidden, in which case the value is true.
    * The value may be {@code null}.
    */
    private static const string HIDDEN = "hidden";    

    /**
    * Identifier of the calendar.
    * The value may be {@code null}.
    */
    private static const string ID = "id";    

    /**
    * Type of the resource ("calendar#calendarListEntry").
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";    

    /**
    * Geographic location of the calendar as free-form text. Optional. Read-only.
    * The value may be {@code null}.
    */
    private static const string LOCATION = "location";    

    /**
    * The notifications that the authenticated user is receiving for this calendar.
    * The value may be {@code null}.
    */
    private static const string NOTIFICATION_SETTINGS = "notificationSettings";    

    /**
    * Whether the calendar is the primary calendar of the authenticated user. Read-only. Optional.
    * The default is False.
    * The value may be {@code null}.
    */
    private static const string PRIMARY = "primary";    

    /**
    * Whether the calendar content shows up in the calendar UI. Optional. The default is False.
    * The value may be {@code null}.
    */
    private static const string SELECTED = "selected";    

    /**
    * Title of the calendar. Read-only.
    * The value may be {@code null}.
    */
    private static const string SUMMARY = "summary";    

    /**
    * The summary that the authenticated user has set for this calendar. Optional.
    * The value may be {@code null}.
    */
    private static const string SUMMARY_OVERRIDE = "summaryOverride";    

    /**
    * The time zone of the calendar. Optional. Read-only.
    * The value may be {@code null}.
    */
    private static const string TIME_ZONE = "timeZone";    

    /**
    * The effective access role that the authenticated user has on the calendar. Read-only. Possible
    * values are: - "freeBusyReader" - Provides read access to free/busy information.  - "reader" -
    * Provides read access to the calendar. Private events will appear to users with reader access,
    * but event details will be hidden.  - "writer" - Provides read and write access to the calendar.
    * Private events will appear to users with writer access, and event details will be visible.  -
    * "owner" - Provides ownership of the calendar. This role has all of the permissions of the
    * writer role with the additional ability to see and manipulate ACLs.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CalendarListEntry")(ACCESS_ROLE));

    /**
    * The main color of the calendar in the hexadecimal format "#0088aa". This property supersedes
    * the index-based colorId property. To set or change this property, you need to specify
    * colorRgbFormat=true in the parameters of the insert, update and patch methods. Optional.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CalendarListEntry")(BACKGROUND_COLOR));

    /**
    * The color of the calendar. This is an ID referring to an entry in the calendar section of the
    * colors definition (see the colors endpoint). This property is superseded by the backgroundColor
    * and foregroundColor properties and can be ignored when using these properties. Optional.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CalendarListEntry")(COLOR_ID));

    /**
    * Conferencing properties for this calendar, for example what types of conferences are allowed.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAggregateType!("ConferenceProperties", "CalendarListEntry")(CONFERENCE_PROPERTIES));

    /**
    * The default reminders that the authenticated user has for this calendar.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAggregateType!("EventReminder[]", "CalendarListEntry")(DEFAULT_REMINDERS));

    /**
    * Whether this calendar list entry has been deleted from the calendar list. Read-only. Optional.
    * The default is False.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(bool, "CalendarListEntry")(DELETED));

    /**
    * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
    *
    * <p>
    * Boolean properties can have four possible values:
    * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
    * or {@link Boolean#FALSE}.
    * </p>
    *
    * <p>
    * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
    * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
    * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
    * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
    * </p>
    *
    * <p>
    * Whether this calendar list entry has been deleted from the calendar list. Read-only. Optional. The
    default is False.
    * </p>
    */
    public bool isDeleted() {
        if (deleted.isNull) {
            return false;
        }
        return deleted.get;
    }

    /**
    * Description of the calendar. Optional. Read-only.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CalendarListEntry")(DESCRIPTION));

    /**
    * ETag of the resource.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CalendarListEntry")(ETAG));

    /**
    * The foreground color of the calendar in the hexadecimal format "#ffffff". This property
    * supersedes the index-based colorId property. To set or change this property, you need to
    * specify colorRgbFormat=true in the parameters of the insert, update and patch methods.
    * Optional.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CalendarListEntry")(FOREGROUND_COLOR));

    /**
    * Whether the calendar has been hidden from the list. Optional. The attribute is only returned
    * when the calendar is hidden, in which case the value is true.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(bool, "CalendarListEntry")(HIDDEN));

    /**
    * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
    *
    * <p>
    * Boolean properties can have four possible values:
    * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
    * or {@link Boolean#FALSE}.
    * </p>
    *
    * <p>
    * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
    * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
    * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
    * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
    * </p>
    *
    * <p>
    * Whether the calendar has been hidden from the list. Optional. The attribute is only returned when
    the calendar is hidden, in which case the value is true.
    * </p>
    */
    public bool isHidden() {
        if (hidden.isNull) {
            return false;
        }
        return hidden.get;
    }

    /**
    * Identifier of the calendar.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CalendarListEntry")(ID));

    /**
    * Type of the resource ("calendar#calendarListEntry").
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CalendarListEntry")(KIND));

    /**
    * Geographic location of the calendar as free-form text. Optional. Read-only.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CalendarListEntry")(LOCATION));

    /**
    * The notifications that the authenticated user is receiving for this calendar.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAggregateType!("NotificationSettings", "CalendarListEntry")(NOTIFICATION_SETTINGS));

    /**
    * Whether the calendar is the primary calendar of the authenticated user. Read-only. Optional.
    * The default is False.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(bool, "CalendarListEntry")(PRIMARY));

    /**
    * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
    *
    * <p>
    * Boolean properties can have four possible values:
    * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
    * or {@link Boolean#FALSE}.
    * </p>
    *
    * <p>
    * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
    * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
    * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
    * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
    * </p>
    *
    * <p>
    * Whether the calendar is the primary calendar of the authenticated user. Read-only. Optional. The
    default is False.
    * </p>
    */
    public bool isPrimary() {
        primary = getPrimary();
        if (primary.isNull) {
            return false;
        }
        return primary.get;
    }

    /**
    * Whether the calendar content shows up in the calendar UI. Optional. The default is False.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(bool, "CalendarListEntry")(SELECTED));

    /**
    * Convenience method that returns only {@link Boolean#TRUE} or {@link Boolean#FALSE}.
    *
    * <p>
    * Boolean properties can have four possible values:
    * {@code null}, {@link com.google.api.client.util.Data#NULL_BOOLEAN}, {@link Boolean#TRUE}
    * or {@link Boolean#FALSE}.
    * </p>
    *
    * <p>
    * This method returns {@link Boolean#TRUE} if the default of the property is {@link Boolean#TRUE}
    * and it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
    * {@link Boolean#FALSE} is returned if the default of the property is {@link Boolean#FALSE} and
    * it is {@code null} or {@link com.google.api.client.util.Data#NULL_BOOLEAN}.
    * </p>
    *
    * <p>
    * Whether the calendar content shows up in the calendar UI. Optional. The default is False.
    * </p>
    */
    public bool isSelected() {
        Nullable!boot selected = getSelected();
        if (selected.isNull) {
            return false;
        }
        return selected.get;
    }

    /**
    * Title of the calendar. Read-only.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CalendarListEntry")(SUMMARY));

    /**
    * The summary that the authenticated user has set for this calendar. Optional.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CalendarListEntry")(SUMMARY_OVERRIDE));

    /**
    * The time zone of the calendar. Optional. Read-only.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CalendarListEntry")(TIME_ZONE));

    /**
    * The notifications that the authenticated user is receiving for this calendar.
    */
    public struct NotificationSettings {
        JSONValue container;
        alias container this;

        /**
        * The list of notifications set for this calendar.
        * The value may be {@code null}.
        */
        private static const string NOTIFICATIONS = "notifications";

        /**
        * The list of notifications set for this calendar.
        * @return value or {@code null} for none
        */
        mixin(GetterSetterAggregateType!("CalendarNotification[]", "CalendarListEntry")(NOTIFICATIONS));
    }
}