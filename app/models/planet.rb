class Planet < ApplicationRecord
  has_many :planetary_terrains
  has_many :terrains, through: :planetary_terrains

  validates :name, :climate, presence: true
  validates :name, uniqueness: true
end
