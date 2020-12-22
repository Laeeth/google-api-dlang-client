module gcalendar.models.acl;

public struct About {
    JSONValue container;
    alias container this;

    /**
    * ETag of the collection.
    * The value may be {@code null}.
    */
    private static const string ETAG = "etag";

    /**
    * List of rules on the access control list.
    * The value may be {@code null}.
    */
    private static const string ITEMS = "items";    

    /**
    * Type of the collection ("calendar#acl").
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
    mixin(GetterSetterBasicType!(string, "Acl")(ETAG));

    /**
    * List of rules on the access control list.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAgregateType!("AclRule[]", "Acl")(ITEMS));

    /**
    * Type of the collection ("calendar#acl").
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "Acl")(KIND));

    /**
    * Token used to access the next page of this result. Omitted if no further results are available,
    * in which case nextSyncToken is provided.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "Acl")(NEXT_PAGE_TOKEN));

    /**
    * Token used at a later point in time to retrieve only the entries that have changed since this
    * result was returned. Omitted if further results are available, in which case nextPageToken is
    * provided.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "Acl")(NEXT_SYNC_TOKEN));
}