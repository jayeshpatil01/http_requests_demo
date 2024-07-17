require 'httparty'
require 'json'
require 'nokogiri'

# # Try fetching simple response with get request
# response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/1')
# puts response.body

# # Try manipulating the response received from get request
# response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/1')
# parsed_response = JSON.parse(response.body)
# puts parsed_response['title']

# #  example post syntax
# # options = {
# #   body: {
# #     key: 'value'
# #   }
# # }
# # response = HTTParty.post('URL', options)
#  options = {
#   body: {
#     title: 'foo',
#     body: 'bar',
#     userId: 1
#   }.to_json,
#   headers: { 'Content-Type' => 'application/json' }
#  }

#  response = HTTParty.post('https://jsonplaceholder.typicode.com/posts', options)
#  puts response.body

#  # checking the response status code and handle errors
#  options = {
#   body: {
#     title: 'foo',
#     body: 'bar',
#     userId: 1
#   }.to_json,
#   headers: { 'Content-Type' => 'application/json' }
#  }

#  response = HTTParty.post('https://jsonplaceholder.typicode.com/posts', options)

#  if response.code == 201
#   puts "Post created successfull"
#   puts response.body
#  else
#   puts "Failed to create a post. Error: #{response.message}"
#  end


#  ### Accessing multiple endpoints
# urls = ["https://jsonplaceholder.typicode.com/posts/1", "https://jsonplaceholder.typicode.com/posts/2"]

# responses = urls.map { |url| HTTParty.get(url) }

# responses.each do |response|
#   parsed_response = JSON.parse(response.body)
#   puts parsed_response['title']
# end

response = HTTParty.get('https://www.w3schools.com/xml/node.xml')
xml_doc = Nokogiri::XML(response.body)
puts xml_doc
puts xml_doc.xpath('//note//to').text
