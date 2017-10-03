class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :youtube_key
      t.text :raw_JSON
    end
  end
end
