require 'httparty'
require 'Nokogiri'

url = 'https://example.com'
def fetch_html(url)
  response = HTTParty.get(url)
  Nokogiri::HTML(response.body)
end

def heading_extractor(html)
  html.css('h1, h2, h3, h4, h5, h6').map(&:text)
end

def extract_links(html)
  html.css('a').map { |link| link['href'] }
end
