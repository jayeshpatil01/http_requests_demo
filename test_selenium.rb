require 'selenium-webdriver'
require 'nokogiri'
require 'pry'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
driver = Selenium::WebDriver.for :chrome, options: options

# URL of the site to scrape
url = 'https://scrapingclub.com/exercise/list_infinite_scroll/'

driver.get(url)

def extract_items(page_source)
  html = Nokogiri::HTML(page_source)
  items = {}
  html.css('.w-full.rounded.border.post').count
  html.css('.w-full.rounded.border.post').each do |item|
    items[items.count + 1] = [ item.at_css('h4 a').text,  item.at_css('h5').text ]
  end
  items
end

all_items = []
previous_height = 0
5.downto(1) do
  all_items << extract_items(driver.page_source)

  driver.execute_script('window.scrollTo(0, document.body.scrollHeight);')

  sleep 2

  new_height = driver.execute_script('return document.body.scrollHeight')
  previous_height = new_height
end

puts extract_items(driver.page_source)
