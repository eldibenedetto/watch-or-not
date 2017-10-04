class User < ActiveRecord::Base

  has_many :user_movies
  has_many :movies, through: :user_movies

  enum gender: [:male, :female, :other]
end
