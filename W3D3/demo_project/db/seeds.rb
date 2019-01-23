# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tamir_house = House.create(address: "120 Tasset")
new_house = House.create(address: "2611 Dana")

tamir = Person.create(name: "Tamir", house_id: tamir_house.id)
bruna = Person.create(name:"Bruna",house_id: new_house.id)
jeff = Person.create(name:"Jeff", house_id: new_house.id)
alex = Person.create(name:"Alex", house_id: new_house.id)
