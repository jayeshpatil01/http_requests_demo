require 'httparty'
require 'nokogiri'

base_url = 'https://books.toscrape.com/'

def fetch_html(base_url)
  response = HTTParty.get(base_url)
  Nokogiri::HTML(response.body)
end

def fetch_title(html)
  html.css('title').text
end

def get_number_of_categories(html)
  html.css('.side_categories .nav.nav-list ul li').count
end

def first_page_books_count(html)
  html.css('section ol li').count
end

def list_book_names_on_page(html)
  list_items = html.css('section ol li h3')
  names = list_items.map(&:text)
end

def get_next_page_link(html)
  html.at_css('section ul.pager li a')['href']
end

def extract_books_on_five_pages(html, base_url)

  pages = 5
  books = []
  url = ''

  1.upto(5) do |i|
    html = fetch_html(url) if i > 1
    html.css('.product_pod').each do |book|
      books << book.at_css('h3 a')['title'] 
    end
    next_link = html.at_css('.pager .next a')['href'];
    next_link = 'catalogue/' + next_link unless next_link.match? (/catalogue/)
    url = URI.join(base_url, next_link).to_s
  end
  books
end


html = fetch_html(base_url)
# puts fetch_title(html)
# puts get_number_of_categories(html)
# puts first_page_books_count(html)
# puts list_book_names_on_page(html)
# puts get_next_page_link(html)

puts extract_books_on_five_pages(html, base_url)
