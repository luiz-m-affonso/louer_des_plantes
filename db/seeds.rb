# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#create_table "plants", force: :cascade do |t|
#    t.string "common_name"
#    t.string "scientific_name"
#    t.string "family"
#    t.string "image_url"
#    t.integer "price"
#    t.string "address"
#    t.bigint "user_id", null: false
#    t.datetime "created_at", precision: 6, null: false
#    t.datetime "updated_at", precision: 6, null: false
#    t.index ["user_id"], name: "index_plants_on_user_id"
#  end


require 'open-uri'
require 'json'
require 'faker'

token = '2U0o7bEHdfONF17LTVcbSRhIUc_KyCdBLBmyc2MbPQw'
plant_web = "https://trefle.io/api/v1/plants?token=#{token}"

response = open(plant_web).read

json_response = JSON.parse(response)

data_json = json_response["data"]

# puts data_json.first["common_name"]
# puts data_json.first["scientific_name"]
# puts data_json.first["family"]
# puts data_json.first["image_url"]
# puts Faker::Address.street_address
# puts rand(1..100)
# puts rand(1..5)

puts "start deleting"

Plant.destroy_all
User.destroy_all

puts "data deleted"


puts "start seeding"

User.create!([
  {first_name: "Julia", last_name: "Mathias", email: "testadmin@lewagon.com", password: "testadminuser", password_confirmation: "testadminuser"},
  {first_name: "Daniel", last_name: "Azevedo", email: "testuser@lewagon.com", password: "testuseraccount", password_confirmation: "testuseraccount"},
  {first_name: "Luiz", last_name: "Souza", email: "testcustomer@lewagon.com", password: "testcustomeruser", password_confirmation: "testcustomeruser"}
])

users_arr = []
users = User.all
users.each do |user|
  users_arr.push(user.id)
end

address = ["Ladeira da Glória, 26", "Floresta da Tijuca", "Rua Jardim Botânico, 1008"]

data_json.each do |plant|
  image = URI.open(plant["image_url"])
  plant = Plant.create({
    common_name: plant["common_name"],
    scientific_name: plant["scientific_name"],
    family: plant["family"],
    price: rand(1..100),
    address: address.sample,
    user_id: users_arr.sample
    })
  plant.photo.attach(io: image  , filename: "#{plant.common_name}-#{plant.id}.jpg")
  puts "plant #{plant.id} created"
end

# image_url: plant["image_url"],
puts "finish seeding"
