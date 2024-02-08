# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
cities = []
5.times do
    # Crée une ville
    city = City.create!(name: Faker::Address.city)
    cities << city
end
5.times do
    # Crée un Dog
    dog = Dog.create!(name: Faker::Creature::Animal.name, city_id: cities[rand(0..4)].id)
end
5.times do
    # Crée un Dogsitter
    dogsitter = Dogsitter.create!(name: Faker::Name.name, city_id: cities[rand(0..4)].id)
end
5.times do
    # Crée une Stroll associée au Dogsitter et au Dog actuels
    stroll = Stroll.create!(appointment_date: Faker::Time.forward(days: 30), dog: Dog.all.sample, dogsitter: Dogsitter.all.sample)
end

puts "Voici les prochaines balades"