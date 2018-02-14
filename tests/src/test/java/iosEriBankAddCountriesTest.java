import io.appium.java_client.remote.IOSMobileCapabilityType;
import io.appium.java_client.ios.IOSDriver;
import io.appium.java_client.remote.MobileCapabilityType;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.remote.DesiredCapabilities;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
public class iosEriBankAddCountriesTest {

    IOSDriver driver = null;
    DesiredCapabilities dc = new DesiredCapabilities();

    String testName = "Login with valid user;
    String accessKey = System.getenv("ACCESS_KEY");
    String buildID = System.getenv("TRAVIS_BUILD_NUMBER");

    @Before
    public void setUp() throws MalformedURLException {
        dc.setCapability("Build Number", buildID);
        dc.setCapability("testName", testName);
        dc.setCapability("accessKey", accessKey);
        dc.setCapability("platformName", "iOS");
        dc.setCapability("instrumented", true);
        dc.setCapability("autoDismissAlerts", true);
        dc.setCapability(MobileCapabilityType.APP, "cloud:com.experitest.ExperiBank");
        dc.setCapability(IOSMobileCapabilityType.BUNDLE_ID, "com.experitest.ExperiBank");

        driver = new IOSDriver(new URL("https://cloud.seetest.io:443/wd/hub"), dc);
    }

    @Test
    public void testLoginEribankiOS() {

        driver.findElement(By.xpath("//*[@text='Username']")).sendKeys("company");
        driver.findElement(By.xpath("//*[@text='Password']")).sendKeys("company");
        driver.findElement(By.xpath("//*[@text='loginButton']")).click();
        driver.findElement(By.xpath("//*[@text='logoutButton']")).click();
    }

    @After
    public void tearDown() {
        if (driver != null)
        {
            driver.quit();
            System.out.println("Report URL : " + driver.getCapabilities().getCapability("reportUrl"));
        }
    }

}