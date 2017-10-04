class UserMovie < ActiveRecord::Base

  belongs_to :user
  belongs_to :movie

  enum approved: [:watch, :nah, :notseen]
end
