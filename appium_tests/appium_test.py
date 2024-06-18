import unittest
from appium import webdriver
from appium.options.android import UiAutomator2Options
from appium.webdriver.common.appiumby import AppiumBy
from time import sleep


capabilities = dict(
    platformName='Android',
    automationName='',
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

    def test_find_battery(self) -> None:
        el = self.driver.find_element(by=AppiumBy.XPATH, value='//*[@text="Battery"]')
        el.click()
        sleep(5)

        er = self.driver.find_element(by=AppiumBy.XPATH, value='//*[@text="Battery percentage"]')
        er.click()
        sleep(5)





if __name__ == '__main__':
    unittest.main()