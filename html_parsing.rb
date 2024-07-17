require 'httparty'
require 'Nokogiri'

url = 'https://example.com'
def fetch_html(url)
  response = HTTParty.get(url)
  Nokogiri::HTML(response.body)
end
