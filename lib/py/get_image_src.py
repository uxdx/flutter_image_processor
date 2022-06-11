from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
sample_url = 'https://www.coupang.com/vp/products/2040637002?itemId=3469208914&vendorItemId=71455552336&isAddedCart='
headers = {
    'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
    'accept-encoding': 'gzip, deflate, br',
    'accept-language': 'ko-KR,ko;q=0.9,ja-JP;q=0.8,ja;q=0.7,en-US;q=0.6,en;q=0.5',
    'cache-control': 'max-age=0',
    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36',
    'referer' : 'https://www.coupang.com/np/products/brand-shop?brandName=%EC%93%B0%EC%9E%84',
    }

def get_image_srcs(url:str):
    options = Options()
    options.add_experimental_option("excludeSwitches", ["enable-logging"])
    driver = webdriver.Chrome(options=options)
    driver.get(url)
    elements = driver.find_elements(by=By.XPATH, value='//img')
    for e in elements:
        print(e.get_attribute('src'))
    driver.close()

import sys

url = sys.argv[1]
xpath = sys.argv[2]
print('url', url, 'xpath', xpath)
get_image_srcs(url)
# scrapper = ImageScrapper(url)
# scrapper.scrap(xpath=xpath)
