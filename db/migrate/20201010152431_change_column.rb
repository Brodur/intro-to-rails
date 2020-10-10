class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :species, :average_lifespan, :string
  end
end
