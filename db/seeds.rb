# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Studio.create!(name: 'Rocket Power Studio')
Studio.create!(name: "Okay Movies Studio")
Studio.create!(name: "Bad Horror Film Studio")

Movie.create!(name: "Cartoon Movie", studio: studio1)
Movie.create!(name: "Kids Move", studio: studio1)
Movie.create!(name: "Average Action Thriller", studio: studio2)
Movie.create!(name: "B Movie", studio: studio2)
Movie.create!(name: "Teenagers Go On Campout", studio: studio3)
Movie.create!(name: "Home Alone 2", studio: studio3)

Actor.create!(name: 'Melissa McCurry', age: 45)
