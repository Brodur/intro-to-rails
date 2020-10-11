class Film < ApplicationRecord
  has_many :planet_appearances
  has_many :planets, through: :planet_appearances

  has_many :species_appearances
  has_many :species, through: :species_appearances

  validates :title, :episode, :opening_crawl, presence: true
  validates :episode, numericality: true
  validates :title, :episode, uniqueness: true

  def self.search(search_term)
    where("LOWER(title) LIKE ?", "%#{search_term.downcase}%")
  end
end
