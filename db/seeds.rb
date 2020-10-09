# https://swapi.dev/documentation#ruby
require "swapi"

PlanetaryTerrain.delete_all
Terrain.delete_all
Planets.delete_all

planets = Swapi.get_all("planets")["results"]

planets.each do |planet|
  # Create the planets

  new_planet = Planet.create(
    name:    planet["name"],
    climate: planet["climate"]
  )

  unless new_planet&.valid?
    puts "Invalid planet #{planet['name']}!"
    next
  end

  # Create the terrains
  terrains = planet["terrain"].split(",").map(&:strip)

  terrains.each do |terrain|
    new_terrain = Terrain.find_or_create_by(name: terrain)
    PlanetaryTerrain.create(planet: new_planet, terrain: new_terrain)
  end
end
