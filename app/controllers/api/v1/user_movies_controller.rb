class Api::V1::UserMoviesController < ApplicationController

  def index
    @user_movies = UserMovie.all
    render json: @user_movies, status: 200
  end

  def create
    @user_movie = UserMovie.create(user_movie_params)
    render json: @user_movie.movie, status: 201
  end

  def show
    @user_movie = UserMovie.find_by(user_movie_params)
    render json: @user_movie, status: 201
  end

  private
  def user_movie_params
    params.permit(:user_id, :movie_id, :approved)
  end

end
