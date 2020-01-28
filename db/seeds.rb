# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Emotion.create(feeling:'good')
Emotion.create(feeling:'okey')
Emotion.create(feeling:'bad')
User.create(email:'e.iwatsuka@gmail.com', password:'12345qwert')