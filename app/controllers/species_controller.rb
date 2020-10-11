class SpeciesController < ApplicationController
  def index
    @species = Species.order("name DESC")
  end

  def show
    @s_species = Species.find(params[:id])
  end
end
