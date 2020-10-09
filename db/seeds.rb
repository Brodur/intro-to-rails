# https://swapi.dev/documentation#ruby
require "swapi"

PlanetaryTerrain.delete_all
Terrain.delete_all
PlanetaryClimate.delete_all
Climate.delete_all
Planet.delete_all
Film.delete_all

# Create Films

films = Swapi.get_all("films")["results"]

films.each do |film|
  new_film = Film.find_or_create_by(
    title:         film["title"],
    episode:       film["episode_id"],
    release_date:  film["release_date"],
    opening_crawl: film["opening_crawl"]
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

  # Create the climates
  climates = planet["climate"].split(",").map(&:strip)

  climates.each do |climate|
    new_climate = Climate.find_or_create_by(name: climate)
    PlanetaryClimate.create(planet: new_planet, climate: new_climate)
  end
end

puts "Created #{PlanetaryTerrain.count} PlanetaryTerrains"
puts "Created #{Terrain.count} Terrains"
puts "Created #{PlanetaryClimate.count} PlanetaryClimates"
puts "Created #{Climate.count} Climates"
puts "Created #{Planet.count} Planets"
puts "Created #{Film.count} Films"
