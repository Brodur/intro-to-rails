class CreatePlanetAppearances < ActiveRecord::Migration[6.0]
  def change
    create_table :planet_appearances do |t|
      t.references :planet, null: false, foreign_key: true
      t.references :film, null: false, foreign_key: true

      t.timestamps
    end
  end
end
