class Terrain < ApplicationRecord
  has_many :planetary_terrains
  has_many :planets, through: :planetary_terrains

  validates :name, presence: true
  validates :name, uniquiness: true
end
