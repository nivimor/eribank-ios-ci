import org.junit.Test;
import org.junit.experimental.ParallelComputer;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

import java.util.List;

import static java.lang.System.exit;

public class TestRunner {

    @Test
    public void test() {

        Class[] cls = {
                iosEriBankAddCountriesTest.class,
                iosEriBankAddCountriesTest.class,
                iosEriBankAddCountriesTest.class,
                iosEriBankAddCountriesTest.class,
                iosEriBankAddCountriesTest.class,
        };

        //Parallel among classes
        Result result = JUnitCore.runClasses(ParallelComputer.classes(), cls);
        List<Failure> failures = result.getFailures();
        if (!failures.isEmpty()) {
            for (Failure failure : failures) {
                System.out.println(failure);

            }
            exit(1);

        }
    }
}