# #!/usr/bin/env python
from selenium import webdriver
from selenium.webdriver.common.by import By
import time

# Start the browser and navigate to https://www.saucedemo.com/
driver = webdriver.Chrome()

# 1. Add print statements that tell us which site we are going to
site_url = 'https://www.google.com/'
search_item = 'Tang Phuc'
text_area = 'textarea#APjFqb'
print(f"Navigating to site: {site_url}")
driver.get(site_url)
driver.find_element(By.CSS_SELECTOR, text_area).send_keys(search_item)
time.sleep(5) 