class Actor < ApplicationRecord
  validates_presence_of :name, :age
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def all_actors_worked_with
    all_actors = movies.map do |movie|
      movie.actors.where.not(name: "#{name}")
    end
    all_actors.flatten.uniq
  end
end
