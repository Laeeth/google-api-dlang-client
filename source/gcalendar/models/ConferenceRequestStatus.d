module gcalendar.models.ConferenceRequestStatus;

public struct ConferenceRequestStatus {
    JSONValue container;
    alias container this;

    /**
    * The current status of the conference create request. Read-only. The possible values are:   -
    * "pending": the conference create request is still being processed. - "success": the conference
    * create request succeeded, the entry points are populated. - "failure": the conference create
    * request failed, there are no entry points.
    * The value may be {@code null}.
    */
    private static const string STATUS_CODE = "statusCode";

    /**
    * The current status of the conference create request. Read-only. The possible values are:   -
    * "pending": the conference create request is still being processed. - "success": the conference
    * create request succeeded, the entry points are populated. - "failure": the conference create
    * request failed, there are no entry points.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "ConferenceRequestStatus")(STATUS_CODE));
}