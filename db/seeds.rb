# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

studio1 = Studio.create!(name: 'Rocket Power Studio')
studio2 = Studio.create!(name: "Okay Movies Studio")
studio3 = Studio.create!(name: "Bad Horror Film Studio")

movie1 = Movie.create!(name: "Cartoon Movie", creation_year: "2014", genre: "Dumb Kids Movies", studio: studio1)
movie2 = Movie.create!(name: "Kids Move", creation_year: "2011", genre: "Dumb Kids Movies", studio: studio1)
movie3 = Movie.create!(name: "Average Action Thriller", creation_year: "1992", genre: "Thriller", studio: studio2)
movie4 = Movie.create!(name: "B Movie", creation_year: "2001", genre: "Thriller", studio: studio2)
movie5 = Movie.create!(name: "Teenagers Go On Campout", creation_year: "2009", genre: "Horror", studio: studio3)
movie6 = Movie.create!(name: "Home Alone 2", creation_year: "2019", genre: "Horror", studio: studio3)

actor1 = Actor.create!(name: 'Melissa McCurry', age: 45)

movie1.actors << actor1
movie3.actors << actor1
movie5.actors << actor1
