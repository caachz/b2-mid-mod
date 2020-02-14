require 'rails_helper'

RSpec.describe "Actors" do
  it "has a name, age and list of movies" do
    studio1 = Studio.create!(name: 'Rocket Power Studio')
    studio2 = Studio.create!(name: "Okay Movies Studio")
    studio3 = Studio.create!(name: "Bad Horror Film Studio")

    movie1 = Movie.create!(name: "Cartoon Movie", studio: studio1)
    movie2 = Movie.create!(name: "Kids Move", studio: studio1)
    movie3 = Movie.create!(name: "Average Action Thriller", studio: studio2)
    movie4 = Movie.create!(name: "B Movie", studio: studio2)
    movie5 = Movie.create!(name: "Teenagers Go On Campout", studio: studio3)
    movie6 = Movie.create!(name: "Home Alone 2", studio: studio3)

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
end
