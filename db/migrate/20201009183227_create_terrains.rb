class CreateTerrains < ActiveRecord::Migration[6.0]
  def change
    create_table :terrains do |t|
      t.string :name

      t.timestamps
    end
  end
end
