module gcalendar.models.colordefinition;

public struct ColorDefinition {

    /**
    * The background color associated with this color definition.
    * The value may be {@code null}.
    */
    private static const string BACKGROUND = "background";

    /**
    * The foreground color that can be used to write on top of a background with 'background' color.
    * The value may be {@code null}.
    */
    private static const string FOREGROUND = "foreground";

    /**
    * The background color associated with this color definition.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "ColorDefinition")(BACKGROUND));

    /**
    * The foreground color that can be used to write on top of a background with 'background' color.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "ColorDefinition")(FOREGROUND));
}