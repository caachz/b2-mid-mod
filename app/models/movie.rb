class Movie < ApplicationRecord
  validates_presence_of :name, :creation_year, :genre, :studio_id
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def actors_by_age
    actors.order(:age)
  end

  def average_age_of_actors
    actors.average(:age)
  end
end
