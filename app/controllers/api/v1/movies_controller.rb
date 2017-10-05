class Api::V1::MoviesController < ApplicationController

  def index
    if params[:username]
      @movies = Movie.not_seen(params[:username])
      render json: @movies, status: 200
    else
      @movies = Movie.all
      render json: @movies, status: 200
    end
  end

  def create
    @movie = Movie.create(movie_params)
    render json: @movie, status: 201
  end

  def show
    @movie = Movie.find_by(movie_params)
    render json: @movie, status: 201
  end

  private
  def movie_params
    params.permit(:title, :youtube_key, :raw_JSON)
  end

end
