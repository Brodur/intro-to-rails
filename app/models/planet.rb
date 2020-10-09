class Planet < ApplicationRecord
  has_many :planetary_terrains
  has_many :terrains, through: :planetary_terrains

  has_many :planetary_climates
  has_many :climates, through: :planetary_climates

  has_many :planet_appearances
  has_many :films, through: :planet_appearances

  has_many :species

  validates :name, presence: true
  validates :name, uniqueness: true
end
