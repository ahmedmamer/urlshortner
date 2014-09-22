require_relative 'url_shorter'      

puts 'please enter base url'
base_url = gets.chomp

# if base_url.nil? 
# 	return
shortener = UrlShorter.new(base_url)

puts 'please enter url that you want to short'
url = gets.chomp

new_url = shortener.create(url)

puts new_url
