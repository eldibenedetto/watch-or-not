class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :age, :gender, :user_movies, :watched_movies, :nah_movies

  has_many :user_movies
  has_many :movies, through: :user_movies

  def watched_movies
    object.user_movies.select {|movie| movie.approved == "watch"}.map {|user_movie| user_movie.movie}
  end

  def nah_movies
    object.user_movies.select {|movie| movie.approved == "nah"}.map {|user_movie| user_movie.movie}
  end

end
