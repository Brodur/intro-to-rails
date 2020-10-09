class Film < ApplicationRecord
  has_many :planet_appearances
  has_many :planets, through: :planet_appearances

  validates :title, :episode, :opening_crawl, presence: true
  validates :episode, numericality: true
  validates :title, :episode, uniqueness: true
end
