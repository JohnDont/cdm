# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = ['Alternative Music', 'Asian Pop (J-Pop, K-pop)', 'Chill Wave', 'Dancehall',
  'Dance Music', 'Deep House', 'Drum and Bass', 'Dubstep', 'Electronic Music',
  'European Music', 'Folk', 'Garage', 'Hip Hop', 'Indie Dance & Pop', 'Jazz',
  'Latin Music', 'New Age', 'Nu-Disco', 'Pop (Popular music)', 'R&B / Soul',
  'Rap', 'Reggae', 'Rock', 'Soca', 'Tech House', 'Techno', 'Trance', 'Trap',
  'Urban', 'World Music / Beats']

categories.each do |name|
  Category.create(name: name)
end
