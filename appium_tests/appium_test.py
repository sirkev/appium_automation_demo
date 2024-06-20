from appium import webdriver
from appium.options.common.base import AppiumOptions
from appium.webdriver.common.appiumby import AppiumBy



options = AppiumOptions()
options.load_capabilities({
    "appium:automationName": "UiAutomator2",
    "appium:platformName": "Android",
    "appium:platformVersion": "10",
    "appium:deviceName": "emulator-5554",
    "appium:app": "/home/kev/StudioProjects/appium_automation_demo/build/app/outputs/apk/debug/app-debug.apk",
    "appium:newCommandTimeout": 3600,
    "appium:connectHardwareKeyboard": True
})

driver = webdriver.Remote("http://127.0.0.1:4723", options=options)

el1 = driver.find_element(by=AppiumBy.CLASS_NAME, value="android.widget.Button")
el1.click()
el2 = driver.find_element(by=AppiumBy.CLASS_NAME, value="android.widget.Button")
el2.click()
el3 = driver.find_element(by=AppiumBy.CLASS_NAME, value="android.widget.Button")
el3.click()

driver.quit()