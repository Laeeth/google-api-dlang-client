module gcalendar.models.ConferenceSolution;

public struct ConferenceSolution {
    JSONvalue container;
    alias container this;

    /**
    * The user-visible icon for this solution.
    * The value may be {@code null}.
    */
    private static const string ICON_URI = "iconUri";

    /**
    * The key which can uniquely identify the conference solution for this event.
    * The value may be {@code null}.
    */
    private static const string KEY = "key";    

    /**
    * The user-visible name of this solution. Not localized.
    * The value may be {@code null}.
    */
    private static const string NAME = "name";    

    /**
    * The user-visible icon for this solution.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "ConferenceSolution")(ICON_URI));

    /**
    * The key which can uniquely identify the conference solution for this event.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterAgregateType!("ConferenceSolutionKey", "ConferenceSolution")(KEY));

    /**
    * The user-visible name of this solution. Not localized.
    * @return value or {@code null} for none
    */
    mixin(GetterSetterBasicType!(string, "ConferenceSolution")(NAME));
}