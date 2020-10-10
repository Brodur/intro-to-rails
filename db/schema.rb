# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_10_152431) do

  create_table "climates", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "films", force: :cascade do |t|
    t.string "title"
    t.integer "episode"
    t.text "opening_crawl"
    t.date "release_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "planet_appearances", force: :cascade do |t|
    t.integer "planet_id", null: false
    t.integer "film_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_planet_appearances_on_film_id"
    t.index ["planet_id"], name: "index_planet_appearances_on_planet_id"
  end

  create_table "planetary_climates", force: :cascade do |t|
    t.integer "climate_id", null: false
    t.integer "planet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["climate_id"], name: "index_planetary_climates_on_climate_id"
    t.index ["planet_id"], name: "index_planetary_climates_on_planet_id"
  end

  create_table "planetary_terrains", force: :cascade do |t|
    t.integer "planet_id", null: false
    t.integer "terrain_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["planet_id"], name: "index_planetary_terrains_on_planet_id"
    t.index ["terrain_id"], name: "index_planetary_terrains_on_terrain_id"
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.string "classification"
    t.string "designation"
    t.string "average_lifespan"
    t.integer "planet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["planet_id"], name: "index_species_on_planet_id"
  end

  create_table "species_appearances", force: :cascade do |t|
    t.integer "species_id", null: false
    t.integer "film_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_species_appearances_on_film_id"
    t.index ["species_id"], name: "index_species_appearances_on_species_id"
  end

  create_table "terrains", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "planet_appearances", "films"
  add_foreign_key "planet_appearances", "planets"
  add_foreign_key "planetary_climates", "climates"
  add_foreign_key "planetary_climates", "planets"
  add_foreign_key "planetary_terrains", "planets"
  add_foreign_key "planetary_terrains", "terrains"
  add_foreign_key "species", "planets"
  add_foreign_key "species_appearances", "films"
  add_foreign_key "species_appearances", "species"
end
