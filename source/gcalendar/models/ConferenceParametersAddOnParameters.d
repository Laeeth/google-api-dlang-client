module gcalendar.models.ConferenceParametersAddOnParameters;



public struct ConferenceParametersAddOnParameters {
    JSONValue container;
    alias container this;

    /**
    * The value may be {@code null}.
    */
    private static const string PARAMETERS = "parameters";

    /**
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAssocArray!("string", "string[string]", "ConferenceParametersAddOnParameters")(PARAMETERS));
}