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


    visit "movies/#{movie1.id}"

    expect(page).to have_content("Cartoon Movie")
    expect(page).to have_content("2014")
    expect(page).to have_content("Dumb Kids Movies")

    #youngest to oldest
    expect(page).to have_content("Harry Smith")
    expect(page).to have_content("14")
    expect(page).to have_content("John Doe")
    expect(page).to have_content("34")
    expect(page).to have_content("Melissa McCurry")
    expect(page).to have_content("45")

    #average age
    expect(page).to have_content("31")
  end

  it "can add a new actor to the movie from the movies show page" do
    studio1 = Studio.create!(name: 'Rocket Power Studio')

    movie1 = Movie.create!(name: "Cartoon Movie", creation_year: "2014", genre: "Dumb Kids Movies", studio: studio1)

    actor1 = Actor.create!(name: 'Melissa McCurry', age: 45)
    actor2 = Actor.create!(name: 'Harry Smith', age: 14)
    actor3 = Actor.create!(name: 'John Doe', age: 34)

    movie1.actors << actor1
    movie1.actors << actor2
    movie1.actors << actor3

    visit "/movies/#{movie1.id}"

    expect(page).to have_content("See a missing actor in the list above? Please add them!")

    fill_in "Actors Name", with: "Harry Smith"

    click_button "Submit"

    expect(current_path).to eq("/movies/#{movie1.id}")

    expect(page).to have_content("Harry Smith")
    expect(page).to have_content("14")
  end
end
