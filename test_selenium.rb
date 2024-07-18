require 'selenium-webdriver'
require 'nokogiri'
require "awesome_print"
require 'pry'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
driver = Selenium::WebDriver.for :chrome, options: options

# URL of the site to scrape
url = 'https://scrapingclub.com/exercise/list_infinite_scroll/'

driver.get(url)

def extract_items(page_source, url, driver)
  html = Nokogiri::HTML(page_source)
  items = []
  html.css('.w-full.rounded.border.post').count
  html.css('.w-full.rounded.border.post').each do |item|
    parsed_url = URI.parse(url)
    item_link = "#{parsed_url.scheme}://#{parsed_url.host}#{item.at_css('h4 a')['href']}"
    items << { title: item.at_css('h4 a').text,  price: item.at_css('h5').text, link: item_link }
  end
  item_details = []
  items.map! do |item|
    driver.get(item[:link])
    html = Nokogiri::HTML(driver.page_source)
    item['decription'] = html.at_css('p.card-description').text
  end
  items
end

all_items = []
previous_height = 0
1.downto(1) do
  all_items << extract_items(driver.page_source, url, driver)

  driver.execute_script('window.scrollTo(0, document.body.scrollHeight);')

  sleep 2

  new_height = driver.execute_script('return document.body.scrollHeight')
  previous_height = new_height
end

puts ap all_items
