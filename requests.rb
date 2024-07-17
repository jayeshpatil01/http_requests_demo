require 'httparty'
require 'json'

# Try fetching simple response with get request
response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/1')
puts response.body

# Try manipulating the response received from get request
response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/1')
parsed_response = JSON.parse(response.body)
puts parsed_response['title']

#  example post syntax
# options = {
#   body: {
#     key: 'value'
#   }
# }
# response = HTTParty.post('URL', options)
 options = {
  body: {
    title: 'foo',
    body: 'bar',
    userId: 1
  }.to_json,
  headers: { 'Content-Type' => 'application/json' }
 }

 response = HTTParty.post('https://jsonplaceholder.typicode.com/posts', options)
 puts response.body
 