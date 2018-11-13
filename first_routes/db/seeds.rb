# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = []
10.times do
  user = User.new({username: Faker::Artist.name})
  user.save!
  users << user
end

artworks = []
20.times do
  artwork = Artwork.new({title: Faker::Music.album, image_url: Faker::Internet.url, artist_id: users.sample.id})
  artwork.save!
  artworks << artwork
end

artworks.each do |artwork|
  artwork_share = ArtworkShare.new({artwork_id: artwork.id, viewer_id: users.sample.id})
  artwork_share.save!
end
