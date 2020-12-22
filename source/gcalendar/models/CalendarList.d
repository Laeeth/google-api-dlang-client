module gcalendar.models.calendarlist;

public struct CalendarList {
    JSONValue container;
    alias container this;

    /**
    * ETag of the collection.
    * The value may be {@code null}.
    */
    private static const string ETAG = "etag";

    /**
    * Calendars that are present on the user's calendar list.
    * The value may be {@code null}.
    */
    public static const string ITEMS = "items";    

    /**
    * Type of the collection ("calendar#calendarList").
    * The value may be {@code null}.
    */
    private static const string KIND = "kind";    

    /**
    * Token used to access the next page of this result. Omitted if no further results are available,
    * in which case nextSyncToken is provided.
    * The value may be {@code null}.
    */
    private static const string NEXT_PAGE_TOKEN = "nextPageToken";    

    /**
    * Token used at a later point in time to retrieve only the entries that have changed since this
    * result was returned. Omitted if further results are available, in which case nextPageToken is
    * provided.
    * The value may be {@code null}.
    */
    private static const string NEXT_SYNC_TOKEN = "nextSyncToken";

    /**
    * ETag of the collection.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CalendarList")(ETAG));

    /**
    * Calendars that are present on the user's calendar list.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAgregateType!("CalendarListEntry", "CalendarList")(ITEMS));

    /**
    * Type of the collection ("calendar#calendarList").
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CalendarList")(KIND));

    /**
    * Token used to access the next page of this result. Omitted if no further results are available,
    * in which case nextSyncToken is provided.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CalendarList")(NEXT_PAGE_TOKEN));

    /**
    * Token used at a later point in time to retrieve only the entries that have changed since this
    * result was returned. Omitted if further results are available, in which case nextPageToken is
    * provided.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CalendarList")(NEXT_SYNC_TOKEN));
}