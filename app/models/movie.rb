class Movie < ActiveRecord::Base

  has_many :user_movies
  has_many :users, through: :user_movies

  def self.not_seen(user)
    user = User.find_by(username: user)
    self.all.select do |movie|
      user.movies.include?(movie) == false
    end
  end

end
