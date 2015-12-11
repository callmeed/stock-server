# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create sample image
file = File.open(File.join(Rails.root, 'public/sample.jpg'))
desc = "This is a sample image created when you ran the rake db:seed command"
image = Image.create([{ title: "Sample Image", description: desc, image_data: file }])
