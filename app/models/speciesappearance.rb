class Speciesappearance < ApplicationRecord
  belongs_to :film
  belongs_to :species
end
