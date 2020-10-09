class Climate < ApplicationRecord
  has_many :planetary_climates
  has_many :planets, through: :planetary_climates
end
