class Species < ApplicationRecord
  belongs_to :planet, optional: true

  has_many :species_appearances
  has_many :films, through: :species_appearances

  validates :name, :classification, :designation, :average_lifespan, presence: true
  validates :name, uniqueness: true

  def self.search(search_term)
    where("LOWER(name) LIKE ?", "%#{search_term.downcase}%")
  end
end
