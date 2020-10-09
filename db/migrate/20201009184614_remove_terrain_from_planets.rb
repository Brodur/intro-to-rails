class RemoveTerrainFromPlanets < ActiveRecord::Migration[6.0]
  def change
    remove_column :planets, :terrain, :string
  end
end
