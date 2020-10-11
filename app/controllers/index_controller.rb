class IndexController < ApplicationController
  def index
    @films = Film.limit(3).order("RANDOM()")
    @planets = Planet.limit(3).order("RANDOM()")
    @species = Species.limit(3).order("RANDOM()")
  end
end
