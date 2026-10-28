import com.intuit.karate.junit5.Karate;

class DemoblazeTest {

    @Karate.Test
    Karate probarRegistro() {
        return Karate.run("demoblaze").relativeTo(getClass());
    }
}
