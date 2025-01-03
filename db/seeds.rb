# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Blogger.create!(
  email: 'blogger1@seed.com',
  password: 'bl0gg3r',
  username: 'blogger01',
  fullname: 'Blogger Fulano de Tal'
)
Blogger.create!(
  email: 'blogger2@seed.com',
  password: 'bl0gg3r',
  username: 'blogger02',
  fullname: 'Blogger Siclano Beltrano'
)
p "Created #{Blogger.count} bloggers"
