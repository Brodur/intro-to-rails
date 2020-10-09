class RemoveClimateFromPlanet < ActiveRecord::Migration[6.0]
  def change
    remove_column :planets, :climate, :string
  end
end
