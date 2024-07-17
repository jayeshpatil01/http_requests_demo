require 'httparty'
require 'Nokogiri'
require 'rspec'

RSpec.describe "HTML Parsing" do
  it 'fetches the HTML content and parses the title' do
    url = 'https://example.com'
    html = fetch_html(url)
    title = html.css('title').text

    expect(title).to eq('Example Domain')
  end
end
