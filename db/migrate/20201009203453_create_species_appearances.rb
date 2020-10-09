class CreateSpeciesAppearances < ActiveRecord::Migration[6.0]
  def change
    create_table :species_appearances do |t|
      t.references :species, null: false, foreign_key: true
      t.references :film, null: false, foreign_key: true

      t.timestamps
    end
  end
end
