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

    public  ArrayList newCountries = new ArrayList<String>(Arrays.asList("Austria", "United Arab Emirates", "Croatia", "Iceland", "Netherlands"));
    public static int i = -1;
    public int countryIndex;

    String testName = "EribBank - Adding Countries to List";
    String accessKey = System.getenv("ACCESS_KEY");
    String buildID = System.getenv("TRAVIS_BUILD_NUMBER");

    public iosEriBankAddCountriesTest(){
        i += 1;
        countryIndex = i;
    }

    @Before
    public void setUp() throws MalformedURLException {
        dc.setCapability("Build ID", buildID);
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
    public void testYouriOSApp() {

        driver.findElement(By.xpath("//*[@text='Username']")).sendKeys("company");
        driver.findElement(By.xpath("//*[@text='Password']")).sendKeys("company");
        driver.findElement(By.xpath("//*[@text='loginButton']")).click();
        driver.findElement(By.xpath("//*[@text='makePaymentButton']")).click();
        driver.findElement(By.xpath("//*[@text='Phone']")).sendKeys("123456");
        driver.findElement(By.xpath("//*[@text='Name']")).sendKeys("Test");
        driver.findElement(By.xpath("//*[@text='Amount']")).sendKeys("10");
        driver.findElement(By.xpath("//*[@text='countryButton']")).click();
        driver.findElement(By.xpath("//*[@text='" + newCountries.get(countryIndex)+ "']")).click();
        driver.findElement(By.xpath("//*[@text='sendPaymentButton']")).click();
        driver.findElement(By.xpath("//*[@text='Yes']")).click();
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