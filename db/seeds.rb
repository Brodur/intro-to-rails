# https://swapi.dev/documentation#ruby
require "swapi"

PlanetaryTerrain.delete_all
Terrain.delete_all
Planet.delete_all
Movie.delete_all

# Create Films

films = Swapi.get_all("films")["results"]

films.each do |film|
  new_film = Film.find_or_create_by(
    title:        film["title"],
    episode:      film["episode_id"],
    release_date: film["release_date"]
  )

  unless new_film&.valid?
    puts "Invalid film #{film['title']}!"
    next
  end
end

# Create the planets

planets = Swapi.get_all("planets")["results"]

planets.each do |planet|
  new_planet = Planet.find_or_create_by(
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
