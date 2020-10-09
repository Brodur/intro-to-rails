class PlanetaryTerrain < ApplicationRecord
  belongs_to :planet
  belongs_to :terrain

  validates :planet, :terrain, presence: true
end
