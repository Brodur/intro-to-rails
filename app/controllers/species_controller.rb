class SpeciesController < ApplicationController
  def index
    @species = Species.order("name ASC")
  end

  def show
    @s_species = Species.find(params[:id])
  end
end
