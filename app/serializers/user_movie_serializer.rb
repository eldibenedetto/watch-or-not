class UserMovieSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :movie_id, :approved

  belongs_to :user
  belongs_to :movie

  
end
