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

movie1 = Movie.create!(name: "Cartoon Movie", studio: studio1)
movie1 = Movie.create!(name: "Kids Move", studio: studio1)
movie1 = Movie.create!(name: "Average Action Thriller", studio: studio2)
movie1 = Movie.create!(name: "B Movie", studio: studio2)
movie1 = Movie.create!(name: "Teenagers Go On Campout", studio: studio3)
movie1 = Movie.create!(name: "Home Alone 2", studio: studio3)
