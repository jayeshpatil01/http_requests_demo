require 'httparty'
require 'Nokogiri'

url = 'https://example.com'
def fetch_html(url)
  response = HTTParty.get(url)
  Nokogiri::HTML(response.body)
end

def heading_extractor(url)
  response = HTTParty.get(url)
  html_response = Nokogiri::HTML(response.body)
  html_response.css('h1, h2, h3, h4, h5, h6').map(&:text)
end
