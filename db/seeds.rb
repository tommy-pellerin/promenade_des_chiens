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

Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all
City.destroy_all

#Remarque, on doit d'abord créer les villes avant de créer des dog et dogsitter car ces 2 tables utilisent l'id de la city
20.times do
  city = City.create!(city_name: Faker::Address.city)
end

cities = City.all

100.times do
  dog = Dog.create!(name: Faker::Creature::Dog.name, city: cities.sample)
end

50.times do
  dogsitter = Dogsitter.create!(name: Faker::Name.name, city: cities.sample)
end

dogs = Dog.all
dogsitters = Dogsitter.all

100.times do
  stroll = Stroll.create!(dogsitter: dogsitters.sample, dog: dogs.sample)
end



