class SpeciesAppearance < ApplicationRecord
  belongs_to :species
  belongs_to :film
end
