module gcalendar.models.Error;

public struct Error {
    JSONValue container;
    alias container this;

    /**
    * Domain, or broad category, of the error.
    * The value may be {@code null}.
    */
    private static const string DOMAIN = "domain";

    /**
    * Specific reason for the error. Some of the possible values are: - "groupTooBig" - The group of
    * users requested is too large for a single query.  - "tooManyCalendarsRequested" - The number of
    * calendars requested is too large for a single query.  - "notFound" - The requested resource was
    * not found.  - "internalError" - The API service has encountered an internal error.  Additional
    * error types may be added in the future, so clients should gracefully handle additional error
    * statuses not included in this list.
    * The value may be {@code null}.
    */
    private static const string REASON = "reason";

    /**
    * Domain, or broad category, of the error.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "Error")(DOMAIN));

    /**
    * Specific reason for the error. Some of the possible values are: - "groupTooBig" - The group of
    * users requested is too large for a single query.  - "tooManyCalendarsRequested" - The number of
    * calendars requested is too large for a single query.  - "notFound" - The requested resource was
    * not found.  - "internalError" - The API service has encountered an internal error.  Additional
    * error types may be added in the future, so clients should gracefully handle additional error
    * statuses not included in this list.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "Error")(REASON));
}