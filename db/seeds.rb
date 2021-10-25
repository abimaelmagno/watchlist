# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'cleaning up database...'
Movie.destroy_all
puts 'database is clean!'


puts 'Creating movies'
response = URI.open("http://tmdb.lewagon.com/movie/top_rated")
 json = JSON.parse(response.read)
 movies = json["results"]
 movies.each do |movie|
  movie = Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: movie["poster_url"],
    rating: movie["vote_average"]
  )
  puts "movie #{movie.id} is created."
end

puts 'All Done!'