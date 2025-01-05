# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
b1 = Blogger.create!(
  email: 'blogger1@seed.com',
  password: 'bl0gg3r',
  username: 'blogger01',
  fullname: 'Buffy Anne Summers'
)
b2 = Blogger.create!(
  email: 'blogger2@seed.com',
  password: 'bl0gg3r',
  username: 'blogger02',
  fullname: 'Willow Rosemberg'
)
b3 = Blogger.create!(
  email: 'blogger3@seed.com',
  password: 'bl0gg3r',
  username: 'blogger03',
  fullname: 'Xander Harris'
)
p "> created #{Blogger.count} bloggers"

#p1 =
Post.create!(
  blogger: b1,
  status: :deleted,
  text: "post da Buffy Summers"
)

p2 = Post.create!(
  blogger: b1,
  status: :posted,
  text: "post da Buffy Summers, the vampire slayer"
)
p2.update!(text: "post da Buffy Summers, slayer extraordinaire")

#p3 =
Post.create!(
  blogger: b2,
  status: :posted,
  text: "post da Willow Rosemberg, be witchin"
)

p4 = Post.create!(
  blogger: b2,
  status: :posted,
  text: "b e witching"
)
p4.deleted!

#p5 =
Post.create!(
  blogger: b3,
  status: :posted,
  text: "post do Xander"
)

p "> created #{Post.count} posts"
