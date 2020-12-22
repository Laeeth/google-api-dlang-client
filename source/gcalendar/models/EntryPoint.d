module gcalendar.models.EntryPoint;

public struct EntryPoint {
    JSONValue container;
    alias container this;

    /**
    * The access code to access the conference. The maximum length is 128 characters. When creating
    * new conference data, populate only the subset of {meetingCode, accessCode, passcode, password,
    * pin} fields that match the terminology that the conference provider uses. Only the populated
    * fields should be displayed. Optional.
    * The value may be {@code null}.
    */
    private static const string ACCESS_CODE = "accessCode";

    /**
    * Features of the entry point, such as being toll or toll-free. One entry point can have multiple
    * features. However, toll and toll-free cannot be both set on the same entry point.
    * The value may be {@code null}.
    */
    private static const string ENTRY_POINT_FEATURES = "entryPointFeatures";    

    /**
    * The type of the conference entry point. Possible values are:   - "video" - joining a conference
    * over HTTP. A conference can have zero or one video entry point. - "phone" - joining a
    * conference by dialing a phone number. A conference can have zero or more phone entry points. -
    * "sip" - joining a conference over SIP. A conference can have zero or one sip entry point. -
    * "more" - further conference joining instructions, for example additional phone numbers. A
    * conference can have zero or one more entry point. A conference with only a more entry point is
    * not a valid conference.
    * The value may be {@code null}.
    */
    private static const string ENTRY_POINT_TYPE = "entryPointType";    

    /**
    * The label for the URI. Visible to end users. Not localized. The maximum length is 512
    * characters. Examples:   - for video: meet.google.com/aaa-bbbb-ccc - for phone: +1 123 268 2601
    * - for sip: 12345678@altostrat.com - for more: should not be filled   Optional.
    * The value may be {@code null}.
    */
    private static const string LABEL = "label";    

    /**
    * The meeting code to access the conference. The maximum length is 128 characters. When creating
    * new conference data, populate only the subset of {meetingCode, accessCode, passcode, password,
    * pin} fields that match the terminology that the conference provider uses. Only the populated
    * fields should be displayed. Optional.
    * The value may be {@code null}.
    */
    private static const string MEETING_CODE = "meetingCode";    

    /**
    * The passcode to access the conference. The maximum length is 128 characters. When creating new
    * conference data, populate only the subset of {meetingCode, accessCode, passcode, password, pin}
    * fields that match the terminology that the conference provider uses. Only the populated fields
    * should be displayed.
    * The value may be {@code null}.
    */
    private static const string PASSCODE = "passcode";    

    /**
    * The password to access the conference. The maximum length is 128 characters. When creating new
    * conference data, populate only the subset of {meetingCode, accessCode, passcode, password, pin}
    * fields that match the terminology that the conference provider uses. Only the populated fields
    * should be displayed. Optional.
    * The value may be {@code null}.
    */
    private static const string PASSWORD = "password";    

    /**
    * The PIN to access the conference. The maximum length is 128 characters. When creating new
    * conference data, populate only the subset of {meetingCode, accessCode, passcode, password, pin}
    * fields that match the terminology that the conference provider uses. Only the populated fields
    * should be displayed. Optional.
    * The value may be {@code null}.
    */
    private static const string PIN = "pin";    

    /**
    * The CLDR/ISO 3166 region code for the country associated with this phone access. Example: "SE"
    * for Sweden. Calendar backend will populate this field only for EntryPointType.PHONE.
    * The value may be {@code null}.
    */
    private static const string REGION_CODE = "regionCode";    

    /**
    * The URI of the entry point. The maximum length is 1300 characters. Format:   - for video, http:
    * or https: schema is required. - for phone, tel: schema is required. The URI should include the
    * entire dial sequence (e.g., tel:+12345678900,,,123456789;1234). - for sip, sip: schema is
    * required, e.g., sip:12345678@myprovider.com. - for more, http: or https: schema is required.
    * The value may be {@code null}.
    */
    private static const string URI = "uri";    

    /**
    * The access code to access the conference. The maximum length is 128 characters. When creating
    * new conference data, populate only the subset of {meetingCode, accessCode, passcode, password,
    * pin} fields that match the terminology that the conference provider uses. Only the populated
    * fields should be displayed. Optional.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "EntryPoint")(ACCESS_CODE));

    /**
    * Features of the entry point, such as being toll or toll-free. One entry point can have multiple
    * features. However, toll and toll-free cannot be both set on the same entry point.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string[], "EntryPoint")(ENTRY_POINT_FEATURES));

    /**
    * The type of the conference entry point. Possible values are:   - "video" - joining a conference
    * over HTTP. A conference can have zero or one video entry point. - "phone" - joining a
    * conference by dialing a phone number. A conference can have zero or more phone entry points. -
    * "sip" - joining a conference over SIP. A conference can have zero or one sip entry point. -
    * "more" - further conference joining instructions, for example additional phone numbers. A
    * conference can have zero or one more entry point. A conference with only a more entry point is
    * not a valid conference.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "EntryPoint")(ENTRY_POINT_TYPE));

    /**
    * The label for the URI. Visible to end users. Not localized. The maximum length is 512
    * characters. Examples:   - for video: meet.google.com/aaa-bbbb-ccc - for phone: +1 123 268 2601
    * - for sip: 12345678@altostrat.com - for more: should not be filled   Optional.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "EntryPoint")(LABEL));

    /**
    * The meeting code to access the conference. The maximum length is 128 characters. When creating
    * new conference data, populate only the subset of {meetingCode, accessCode, passcode, password,
    * pin} fields that match the terminology that the conference provider uses. Only the populated
    * fields should be displayed. Optional.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "EntryPoint")(MEETING_CODE));

    /**
    * The passcode to access the conference. The maximum length is 128 characters. When creating new
    * conference data, populate only the subset of {meetingCode, accessCode, passcode, password, pin}
    * fields that match the terminology that the conference provider uses. Only the populated fields
    * should be displayed.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "EntryPoint")(PASSCODE));

    /**
    * The password to access the conference. The maximum length is 128 characters. When creating new
    * conference data, populate only the subset of {meetingCode, accessCode, passcode, password, pin}
    * fields that match the terminology that the conference provider uses. Only the populated fields
    * should be displayed. Optional.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "EntryPoint")(PASSWORD));

    /**
    * The PIN to access the conference. The maximum length is 128 characters. When creating new
    * conference data, populate only the subset of {meetingCode, accessCode, passcode, password, pin}
    * fields that match the terminology that the conference provider uses. Only the populated fields
    * should be displayed. Optional.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "EntryPoint")(PIN));

    /**
    * The CLDR/ISO 3166 region code for the country associated with this phone access. Example: "SE"
    * for Sweden. Calendar backend will populate this field only for EntryPointType.PHONE.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "EntryPoint")(REGION_CODE));

    /**
    * The URI of the entry point. The maximum length is 1300 characters. Format:   - for video, http:
    * or https: schema is required. - for phone, tel: schema is required. The URI should include the
    * entire dial sequence (e.g., tel:+12345678900,,,123456789;1234). - for sip, sip: schema is
    * required, e.g., sip:12345678@myprovider.com. - for more, http: or https: schema is required.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "EntryPoint")(URI));
}