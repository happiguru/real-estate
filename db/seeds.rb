# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do 
    Apartment.create(
      apartment_name: Faker::Restaurant.name,
      city: Faker::Address.city,
      address: Faker::Address.full_address,
      description_short: Faker::Restaurant.description,
      description_long: Faker::Lorem.paragraphs(number: 1),
      price: Faker::Number.decimal(l_digits: 2)
    )
  end