module gcalendar.models.CreateConferenceRequest;



public struct CreateConferenceRequest {
    JSONValue container;
    alias container this;

    /**
    * The conference solution, such as Hangouts or Google Meet.
    * The value may be {@code null}.
    */
    private static const string CONFERENCE_SOLUTION_KEY = "conferenceSolutionKey";

    /**
    * The client-generated unique ID for this request. Clients should regenerate this ID for every
    * new request. If an ID provided is the same as for the previous request, the request is ignored.
    * The value may be {@code null}.
    */
    private static const string REQUEST_ID = "requestId";

    /**
    * The status of the conference create request.
    * The value may be {@code null}.
    */
    private static const string STATUS = "status";

    /**
    * The conference solution, such as Hangouts or Google Meet.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAgregateType!("ConferenceSolutionKey", "CreateConferenceRequest")(CONFERENCE_SOLUTION_KEY));

    /**
    * The client-generated unique ID for this request. Clients should regenerate this ID for every
    * new request. If an ID provided is the same as for the previous request, the request is ignored.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "CreateConferenceRequest")(REQUEST_ID));

    /**
    * The status of the conference create request.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAgregateType!("ConferenceRequestStatus", "CreateConferenceRequest")(STATUS));
}