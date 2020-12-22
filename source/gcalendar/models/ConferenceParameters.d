module gcalendar.models.ConferenceParameters;



public struct ConferenceParameters {
    JSONValue container;
    alias container this;

    /**
    * Additional add-on specific data.
    * The value may be {@code null}.
    */
    private static const string ADD_ON_PARAMETERS = "addOnParameters";

    /**
    * Additional add-on specific data.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAgregateType!("ConferenceParametersAddOnParameters", "ConferenceParameters")(ADD_ON_PARAMETERS));
}