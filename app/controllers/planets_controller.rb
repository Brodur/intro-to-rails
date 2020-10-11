class PlanetsController < ApplicationController
  def index
    @planets = Planet.order("name ASC")
  end

  def show
    @planet = Planet.find(params[:id])
  end
end
