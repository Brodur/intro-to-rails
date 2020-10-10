class MakePlanetNullableForSpecies < ActiveRecord::Migration[6.0]
  def change
    change_column :species, :planet_id, :integer, null: true
  end
end
