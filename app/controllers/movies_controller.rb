class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    actor = Actor.where(name: params[:name])[0]
    movie.actors << actor
  end
end
