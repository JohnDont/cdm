# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = {
  electronic_music: ["Trap", "Trance", "House", "Progressive house", "Techno",
    "Drum and bass", "Deep house", "Moombahton", "Dubstep", "Future house",
    "Tropical house", "Jungle"],
  cdm: ["Traphall", "Bass hall", "Skateck", "King step", "Trapso", "Future dancehall",
    "Tropical bass", "Zouk bass"],
  caribbean_music: ["Soca",  "Dancehall",  "Reggae",  "Zouk",  "Chutney",
    "Reggaeton",  "Salsa",  "Parang",  "Latin",  "Bouyon"],
  other: ["Alternative Music",  "Asian Pop (J-Pop, K-pop)",  "Chill Wave",  "Dance Music",
    "Electronic Music",  "European Music",  "Folk",  "Garage",  "Hip Hop",
    "Indie Dance & Pop",  "Jazz",  "Latin Music",  "New Age",  "Nu-Disco",
    "Pop (Popular music)",  "R&B / Soul",  "Rap",  "Rock",  "Trance",  "Urban",
    "World Music / Beats"]
}

categories.each do |parent, names|
  names.each do |name|
    Category.create(name: name, parent: parent)
  end
end
