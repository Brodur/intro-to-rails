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

  def climates_list
    climates.map(&:name).join(", ").humanize
  end

  def terrains_list
    terrains.map(&:name).join(", ").humanize
  end

  def self.search(search_term)
    where("LOWER(name) LIKE ?", "%#{search_term.downcase}%")
  end
end
