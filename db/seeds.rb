# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Supplier.create(
  name: 'Coffee Supplies "R"us',
  email: "enquiries@coffeesuppliesrus.com",
  phone_number: "+1 416 555 1212"
)

Supplier.create(
  name: "Glasswares and stuff",
  email: "enquiries@glasswaresandstuff.com",
  phone_number: "+1 416 556 1312"
)