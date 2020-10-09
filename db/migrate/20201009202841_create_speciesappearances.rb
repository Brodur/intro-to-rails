class CreateSpeciesappearances < ActiveRecord::Migration[6.0]
  def change
    create_table :speciesappearances do |t|
      t.references :film, null: false, foreign_key: true
      t.references :species, null: false, foreign_key: true

      t.timestamps
    end
  end
end
