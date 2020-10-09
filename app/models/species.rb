class Species < ApplicationRecord
  belongs_to :planet

  validates :name, :classification, :designation, :average_lifespan, presence: true
  validates :name, uniqueness: true
  validates :average_lifespan, numericality: true
end
