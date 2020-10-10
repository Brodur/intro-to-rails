class Species < ApplicationRecord
  belongs_to :planet, optional: true

  validates :name, :classification, :designation, :average_lifespan, presence: true
  validates :name, uniqueness: true
end
