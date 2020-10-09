class PlanetAppearance < ApplicationRecord
  belongs_to :planet
  belongs_to :film

  validates :planet, :film, presence: true
end
