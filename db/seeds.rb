# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
create_table "plants", force: :cascade do |t|
    t.string "common_name"
    t.string "scientific_name"
    t.string "family"
    t.string "image_url"
    t.integer "price"
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_plants_on_user_id"
  end


require 'open-uri'
require 'json'

token = '2U0o7bEHdfONF17LTVcbSRhIUc_KyCdBLBmyc2MbPQw'

response =

puts "start seeding"




puts "finish seeding"
