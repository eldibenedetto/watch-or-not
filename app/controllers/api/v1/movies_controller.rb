class Api::V1::MoviesController < ApplicationController

  def index
    @movies = Movie.all
    render json: @movies, status: 200
  end

  def create
    @movie = Movie.create(movie_params)
    render json: @movie, status: 201
  end

  private
  def movie_params
    params.permit(:title, :youtube_key, :raw_JSON)
  end

end
