from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service

Service(ChromeDriverManager().install())
