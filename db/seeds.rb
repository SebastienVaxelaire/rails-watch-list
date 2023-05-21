# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'uri'
require 'net/http'
require 'openssl'

# puts "Delete database"
# Movie.destroy_all

puts "Creating database"

url = URI("https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=2")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'
request["Authorization"] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyOTFiNzRiMjkyNDYxYzI3MTIxZDRhYTIyMGQ1YWZjNiIsInN1YiI6IjY0NjdhOWYxZDE4NTcyMDBlNWEzODI5MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Gf82-tAlR52QhVpVqCPhUUjkQ8Xm5QroHEuCDVaIb1c'

response = http.request(request)
data = JSON.parse(response.read_body)
# puts response.read_body
data['results'].each do |result|
  Movie.create(
    title: result['title'],
    overview: result['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500/#{result['poster_path']}",
    backdrop_url: "https://image.tmdb.org/t/p/w500/#{result['backdrop_path']}",
    rating: result['vote_average']
  )
end
