class CreatePlanetaryClimates < ActiveRecord::Migration[6.0]
  def change
    create_table :planetary_climates do |t|
      t.references :climate, null: false, foreign_key: true
      t.references :planet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
