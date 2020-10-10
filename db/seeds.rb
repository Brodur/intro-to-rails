# https://swapi.dev/documentation#ruby
require "swapi"

PlanetaryTerrain.delete_all
Terrain.delete_all
PlanetaryClimate.delete_all
Climate.delete_all
PlanetAppearance.delete_all
Planet.delete_all
SpeciesAppearance.delete_all
Species.delete_all
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

  # Create the planets

  planet_urls = film["planets"]

  planets = []
  planet_urls.each do |url|
    planets << Swapi.get_planet(url.split("/").last)
  end

  planets.each do |planet|
    new_planet = Planet.find_or_create_by(name: planet["name"])

    unless new_planet&.valid?
      puts "Invalid planet #{planet['name']}!"
      next
    end
    # Create the association
    PlanetAppearance.find_or_create_by(planet: new_planet, film: new_film)

    # Create the terrains
    terrains = planet["terrain"].split(",").map(&:strip)

    terrains.each do |terrain|
      new_terrain = Terrain.find_or_create_by(name: terrain)
      PlanetaryTerrain.find_or_create_by(planet: new_planet, terrain: new_terrain)
    end

    # Create the climates
    climates = planet["climate"].split(",").map(&:strip)

    climates.each do |climate|
      new_climate = Climate.find_or_create_by(name: climate)
      PlanetaryClimate.find_or_create_by(planet: new_planet, climate: new_climate)
    end
  end

  # Create the species
  species_urls = film["species"]
  species = []
  species_urls.each do |url|
    species << Swapi.get_species(url.split("/").last)
    species.last["homeworld"] = Swapi.get_planet(url.split("/").last)["name"]
  end

  species.each do |s|
    new_species = Species.find_or_create_by(
      name:             s["name"],
      classification:   s["classification"],
      designation:      s["designation"],
      average_lifespan: s["average_lifespan"]
    )

    unless new_species&.valid?
      puts "Invalid species #{s['name']}!"
      next
    end

    # Associate homeworld
    unless s["homeworld"].empty?
      new_species.update(
        planet: Planet.find_or_create_by(name: s["homeworld"])
      )
    end

    # Create the association
    SpeciesAppearance.find_or_create_by(species: new_species, film: new_film)
  end
end

puts "Created #{PlanetaryTerrain.count} PlanetaryTerrains"
puts "Created #{Terrain.count} Terrains"
puts "Created #{PlanetaryClimate.count} PlanetaryClimates"
puts "Created #{Climate.count} Climates"
puts "Created #{Planet.count} Planets"
puts "Created #{Film.count} Films"
puts "Created #{PlanetAppearance.count} PlanetAppearances"
puts "Created #{Species.count} Species"
puts "Created #{SpeciesAppearance.count} SpeciesAppearances"
