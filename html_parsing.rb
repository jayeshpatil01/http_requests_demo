require 'httparty'
require 'Nokogiri'
require 'rspec'

url = 'https://example.com'
def fetch_html(url)
end

RSpec.describe "HTML Parsing" do
  it 'fetches the HTML content and parses the title' do
    url = 'https://example.com'
    html = fetch_html(url)
    title = html.css('title').text

    expect(title).to eq('Example Domain')
  end
end
