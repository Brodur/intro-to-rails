class Terrain < ApplicationRecord
  has_many :planetary_terrains
  has_many :planets, through: :planetary_terrains
end
