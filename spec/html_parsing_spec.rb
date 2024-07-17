require 'rspec'
require_relative '../html_parsing'

describe 'HTML parsing' do
  it 'fetches the HTML content and parses the title' do
    url = 'https://example.com'
    html = fetch_html(url)
    title = html.css('title').text

    expect(title).to eq('Example Domain')
  end

  it 'extracts all headings from HTML content' do
    url = 'https://example.com'
    html = fetch_html(url)
    headings = heading_extractor(html)
  
    expect(headings).to include('Example Domain')
  end
end
