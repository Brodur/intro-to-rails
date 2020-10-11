class SpeciesController < ApplicationController
  def index
    @species = Species.includes(:planet).order("name ASC")
  end

  def show
    @s_species = Species.find(params[:id])
  end
end
