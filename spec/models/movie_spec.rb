require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :creation_year}
      it {should validate_presence_of :genre}
      it {should validate_presence_of :studio_id}
    end

    describe "relationships" do
      it {should belong_to :studio}
      it {should have_many :movie_actors}
      it {should have_many(:actors).through(:movie_actors)}
    end

    describe "#actors_by_age" do
      it "orders actors from youngest to oldest" do
        studio1 = Studio.create!(name: 'Rocket Power Studio')

        movie1 = Movie.create!(name: "Cartoon Movie", creation_year: "2014", genre: "Dumb Kids Movies", studio: studio1)

        actor1 = Actor.create!(name: 'Melissa McCurry', age: 45)
        actor2 = Actor.create!(name: 'Harry Smith', age: 14)
        actor3 = Actor.create!(name: 'John Doe', age: 34)

        movie1.actors << actor1
        movie1.actors << actor2
        movie1.actors << actor3

        expect(movie1.actors_by_age).to eq([actor2, actor3, actor1])
      end
    end

    describe "#average_age_of_actors" do
      it "Returns the average age of all actors in a movie" do
        studio1 = Studio.create!(name: 'Rocket Power Studio')

        movie1 = Movie.create!(name: "Cartoon Movie", creation_year: "2014", genre: "Dumb Kids Movies", studio: studio1)

        actor1 = Actor.create!(name: 'Melissa McCurry', age: 45)
        actor2 = Actor.create!(name: 'Harry Smith', age: 14)
        actor3 = Actor.create!(name: 'John Doe', age: 34)

        movie1.actors << actor1
        movie1.actors << actor2
        movie1.actors << actor3

        expect(movie1.average_age_of_actors).to eq(31)
      end
    end
  end
