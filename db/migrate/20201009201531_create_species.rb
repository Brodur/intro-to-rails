class CreateSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :species do |t|
      t.string :name
      t.string :classification
      t.string :designation
      t.integer :average_lifespan
      t.references :planet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
