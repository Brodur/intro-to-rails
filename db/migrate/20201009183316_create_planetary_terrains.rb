class CreatePlanetaryTerrains < ActiveRecord::Migration[6.0]
  def change
    create_table :planetary_terrains do |t|
      t.references :planet, null: false, foreign_key: true
      t.references :terrain, null: false, foreign_key: true

      t.timestamps
    end
  end
end
