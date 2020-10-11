class PlanetsController < ApplicationController
  def index
    @planets = Planet.includes(:climates, :terrains).order("name ASC")
  end

  def show
    @planet = Planet.find(params[:id])
  end

  def self.search(search_term)
    where("LOWER(name) LIKE ?", "%#{search_term.downcase}%")
  end
end
