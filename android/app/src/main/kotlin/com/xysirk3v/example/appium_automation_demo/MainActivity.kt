package com.xysirk3v.example.appium_automation_demo

import io.flutter.embedding.android.FlutterActivity

@BeforeClass
@Throws(MalformedURLException::class)
fun setUp() {
    val caps: DesiredCapabilities = DesiredCapabilities()
    caps.setCapability("automationName", "UiAutomator1")
    caps.setCapability("platformName", "Android")
    caps.setCapability("platformVersion", "7.1.1")
    caps.setCapability("deviceName", "Android Emulator")
    caps.setCapability("app", System.getProperty("user.dir") + "/apps/selendroid-test-app-0.17.0.apk")
    driver = AndroidDriver(URL("http://localhost:4723/wd/hub"), caps)
}
class MainActivity: FlutterActivity()
