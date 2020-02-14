require "rails_helper"

RSpec.describe "Visitors can interact with studios" do
  it "has an index page" do

    studio1 = Studio.create!(name: 'Rocket Power Studio')
    studio2 = Studio.create!(name: "Okay Movies Studio")
    studio3 = Studio.create!(name: "Bad Horror Film Studio")

    movie1 = Movie.create!(name: "Cartoon Movie", creation_year: "2014", genre: "Dumb Kids Movies", studio: studio1)
    movie2 = Movie.create!(name: "Kids Move", creation_year: "2011", genre: "Dumb Kids Movies", studio: studio1)
    movie3 = Movie.create!(name: "Average Action Thriller", creation_year: "1992", genre: "Thriller", studio: studio2)
    movie4 = Movie.create!(name: "B Movie", creation_year: "2001", genre: "Thriller", studio: studio2)
    movie5 = Movie.create!(name: "Teenagers Go On Campout", creation_year: "2009", genre: "Horror", studio: studio3)
    movie6 = Movie.create!(name: "Home Alone 2", creation_year: "2019", genre: "Horror", studio: studio3)

    visit "/studios"


    within "#studio-#{studio1.id}" do
      expect(page).to have_content("Rocket Power Studio")
      expect(page).to have_content("Cartoon Movie")
      expect(page).to have_content("Kids Move")
    end

    within "#studio-#{studio2.id}" do
      expect(page).to have_content("Okay Movies Studio")
      expect(page).to have_content("Average Action Thriller")
      expect(page).to have_content("B Movie")
    end

    within "#studio-#{studio3.id}" do
      expect(page).to have_content("Bad Horror Film Studio")
      expect(page).to have_content("Teenagers Go On Campout")
      expect(page).to have_content("Home Alone 2")
    end
  end
end
