class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :title
      t.integer :episode
      t.text :opening_crawl
      t.date :release_date

      t.timestamps
    end
  end
end
