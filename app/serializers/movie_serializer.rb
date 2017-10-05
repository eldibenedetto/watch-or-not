class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :youtube_key, :raw_JSON

  has_many :user_movies
  has_many :users, through: :user_movies
end
