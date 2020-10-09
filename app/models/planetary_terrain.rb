class PlanetaryTerrain < ApplicationRecord
  belongs_to :planet
  belongs_to :terrain
end
