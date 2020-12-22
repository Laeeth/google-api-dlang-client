module gcalendar.models.conferencedata;



public struct ConferenceData {
    JSONValue container;
    alias container this;

    /**
    * The ID of the conference. Can be used by developers to keep track of conferences, should not be
    * displayed to users. Values for solution types:   - "eventHangout": unset. -
    * "eventNamedHangout": the name of the Hangout. - "hangoutsMeet": the 10-letter meeting code, for
    * example "aaa-bbbb-ccc". - "addOn": defined by 3P conference provider.  Optional.
    * The value may be {@code null}.
    */
    private static const string CONFERENCE_ID = "conferenceId";

    /**
    * The conference solution, such as Hangouts or Google Meet. Unset for a conference with a failed
    * create request. Either conferenceSolution and at least one entryPoint, or createRequest is
    * required.
    * The value may be {@code null}.
    */
    private static const string CONFERENCE_SOLUTION = "conferenceSolution";    

    /**
    * A request to generate a new conference and attach it to the event. The data is generated
    * asynchronously. To see whether the data is present check the status field. Either
    * conferenceSolution and at least one entryPoint, or createRequest is required.
    * The value may be {@code null}.
    */
    private static const string CREATE_REQUEST = "createRequest";    

    /**
    * Information about individual conference entry points, such as URLs or phone numbers. All of
    * them must belong to the same conference. Either conferenceSolution and at least one entryPoint,
    * or createRequest is required.
    * The value may be {@code null}.
    */
    public static const string ENTRY_POINTS = "entryPoints";    

    /**
    * Additional notes (such as instructions from the domain administrator, legal notices) to display
    * to the user. Can contain HTML. The maximum length is 2048 characters. Optional.
    * The value may be {@code null}.
    */
    private static const string NOTES = "notes";

    /**
    * Additional properties related to a conference. An example would be a solution-specific setting
    * for enabling video streaming.
    * The value may be {@code null}.
    */
    private static const string PARAMETERS = "parameters";    

    /**
    * The signature of the conference data. Generated on server side. Must be preserved while copying
    * the conference data between events, otherwise the conference data will not be copied. Unset for
    * a conference with a failed create request. Optional for a conference with a pending create
    * request.
    * The value may be {@code null}.
    */
    public static const string SIGNATURE = "signature"; 

    /**
    * The ID of the conference. Can be used by developers to keep track of conferences, should not be
    * displayed to users. Values for solution types:   - "eventHangout": unset. -
    * "eventNamedHangout": the name of the Hangout. - "hangoutsMeet": the 10-letter meeting code, for
    * example "aaa-bbbb-ccc". - "addOn": defined by 3P conference provider.  Optional.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "ConferenceData")(CONFERENCE_ID));
        /**
    * The conference solution, such as Hangouts or Google Meet. Unset for a conference with a failed
    * create request. Either conferenceSolution and at least one entryPoint, or createRequest is
    * required.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAgregateType!("ConferenceSolution", "ConferenceData")(CONFERENCE_SOLUTION));

    /**
    * A request to generate a new conference and attach it to the event. The data is generated
    * asynchronously. To see whether the data is present check the status field. Either
    * conferenceSolution and at least one entryPoint, or createRequest is required.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAgregateType!("CreateConferenceRequest", "ConferenceData")(CREATE_REQUEST));

    /**
    * Information about individual conference entry points, such as URLs or phone numbers. All of
    * them must belong to the same conference. Either conferenceSolution and at least one entryPoint,
    * or createRequest is required.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAgregateType!("EntryPoint[]", "ConferenceData")(ENTRY_POINTS));

    /**
    * Additional notes (such as instructions from the domain administrator, legal notices) to display
    * to the user. Can contain HTML. The maximum length is 2048 characters. Optional.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "ConferenceData")(NOTES));

    /**
    * Additional properties related to a conference. An example would be a solution-specific setting
    * for enabling video streaming.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAgregateType!("ConferenceParameters", "ConferenceData")(PARAMETERS));

    /**
    * The signature of the conference data. Generated on server side. Must be preserved while copying
    * the conference data between events, otherwise the conference data will not be copied. Unset for
    * a conference with a failed create request. Optional for a conference with a pending create
    * request.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "ConferenceData")(SIGNATURE));
}