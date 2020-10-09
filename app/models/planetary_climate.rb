class PlanetaryClimate < ApplicationRecord
  belongs_to :climate
  belongs_to :planet

  validates :planet, :climate, presence: true
end
