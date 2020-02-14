require 'rails_helper'

RSpec.describe "Actors" do
  it "has a name, age and list of movies" do
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

    visit "actors/#{actor1.id}"

    expect(page).to have_content("Melissa McCurry")
    expect(page).to have_content("45")
    expect(page).to have_content("Cartoon Movie")
    expect(page).to have_content("Average Action Thriller")
    expect(page).to have_content("Teenagers Go On Campout")
  end

  it "shows all actors an actor has worked with" do

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
    actor2 = Actor.create!(name: 'John Doe', age: 28)
    actor3 = Actor.create!(name: 'Sara Johnson', age: 14)
    actor3 = Actor.create!(name: 'AJ Hal', age: 56)

    movie1.actors << actor1
    movie3.actors << actor1
    movie5.actors << actor1

    movie1.actors << actor2

    movie5.actors << actor3

    visit "actors/#{actor1.id}"

    expect(page).to have_content("John Doe")
    expect(page).to have_content("Sara Johnson")
    expect(page).to_no have_content("AJ Hal")
  end
end
