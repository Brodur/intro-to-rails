# https://swapi.dev/documentation#ruby
require "swapi"

planets = Swapi.get_all("planets")["results"]

planets.each do |planet|
  new_planet = Planet.create(
    name:    planet["name"],
    climate: planet["climate"],
    terrain: planet["terrain"]
  )
  puts "Invalid planet #{planet['name']}!" unless new_planet&.valid?
end
