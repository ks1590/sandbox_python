import time
from selenium import webdriver
from bs4 import BeautifulSoup

url = "http://qiita.com"

driver = webdriver.Chrome(executable_path="./chromedriver")
driver.get(url)

search = driver.find_element_by_class_name("st-NewHeader_searchInput")
search.send_keys("Python")
search.submit()

time.sleep(5)

html = driver.page_source.encode('utf-8')
soup = BeautifulSoup(html, 'lxml')
results = soup.find_all("h1", class_="searchResult_itemTitle")

for result in results:
    href = result.findAll("a")[0].get("href")
    print(url + href)

driver.close()
driver.quit()
