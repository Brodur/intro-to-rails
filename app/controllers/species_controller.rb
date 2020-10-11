class SpeciesController < ApplicationController
  def index
    @species = Species.includes(:planet).order("name ASC")
  end

  def show
    @s_species = Species.find(params[:id])
  end

  def self.search(search_term)
    where("LOWER(name) LIKE ?", "%#{search_term.downcase}%")
  end
end
