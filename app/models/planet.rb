class Planet < ApplicationRecord
  has_many :planetary_terrains
  has_many :terrains, through: :planetary_terrains

  has_many :planetary_climates
  has_many :climates, through: :planetary_climates

  validates :name, presence: true
  validates :name, uniqueness: true
end
