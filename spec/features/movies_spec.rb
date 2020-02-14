require 'rails_helper'

RSpec.describe "movies" do
  it "has a movie show page with info about the movie" do
    studio1 = Studio.create!(name: 'Rocket Power Studio')

    movie1 = Movie.create!(name: "Cartoon Movie", creation_year: "2014", genre: "Dumb Kids Movies", studio: studio1)

    actor1 = Actor.create!(name: 'Melissa McCurry', age: 45)
    actor2 = Actor.create!(name: 'Harry Smith', age: 14)
    actor3 = Actor.create!(name: 'John Doe', age: 34)

    movie1.actors << actor1
    movie1.actors << actor2
    movie1.actors << actor3


    visit "movies/"

#     As a user,
# When I visit a movie's show page.
# I see the movie's name, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
  end
end
