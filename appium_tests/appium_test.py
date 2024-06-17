import unittest
from appium import webdriver
from appium.options.android import UiAutomator2Options
from appium.webdriver.common.appiumby import AppiumBy

capabilities = dict(
    platformName='Android',
    automationName='uiautomator2',
    deviceName='Android',
    appPackage='com.xysirk3v.example.appium_automation_demo',
    appActivity='.MainActivity',
    language='en',
    locale='US'
)

appium_server_url = 'http://localhost:4723'

class TestAppium(unittest.TestCase):
    def setUp(self) -> None:
        self.driver = webdriver.Remote(appium_server_url, options=UiAutomator2Options().load_capabilities(capabilities))

    def tearDown(self) -> None:
        if self.driver:
            self.driver.quit()

    def test_counter_increments(self) -> None:
        # Verify that the counter starts at 0
        counter_text = self.driver.find_element(by=AppiumBy.XPATH, value='//*[@text="0"]')
        self.assertIsNotNone(counter_text)

        counter_text = self.driver.find_elements(by=AppiumBy.XPATH, value='//*[@text="1"]')
        self.assertEqual(len(counter_text), 0)

        # Tap the '+' icon
        plus_icon = self.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='plus_icon_id')
        plus_icon.click()

        # Verify that the counter has incremented
        counter_text = self.driver.find_elements(by=AppiumBy.XPATH, value='//*[@text="0"]')
        self.assertEqual(len(counter_text), 0)

        counter_text = self.driver.find_element(by=AppiumBy.XPATH, value='//*[@text="1"]')
        self.assertIsNotNone(counter_text)

if __name__ == '__main__':
    unittest.main()
