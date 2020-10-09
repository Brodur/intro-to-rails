class Planet < ApplicationRecord
  has_many :planetary_terrains
  has_many :terrains, through: :planetary_terrains
end
