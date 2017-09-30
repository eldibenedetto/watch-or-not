class CreateUserMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :user_movies do |t|
      t.integer :user_id
      t.integer :movie_id
      t.boolean :approved, :default => false
    end
  end
end
