# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
blogger1 = Blogger.create!(
  email: 'blogger1@email.com',
  password: 'bl0gg3r',
  username: 'first_blogger',
  fullname: 'Blogger Fulano de Tal'
)
blogger2 = Blogger.create!(
  email: 'blogger2@email.com',
  password: 'bl0gg3r',
  username: 'second_blogger',
  fullname: 'Blogger Siclano Beltrano'
)
p "Created #{Blogger.count} bloggers"
