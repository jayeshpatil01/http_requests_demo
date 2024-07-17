require 'httparty'
require 'json'

# Try fetching simple response with get request
response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/1')
puts response.body

