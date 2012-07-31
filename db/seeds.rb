# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


[
  'Mendoza', 'Maipu', 'Godoy Cruz', 'Lujan', 'Guaymallen', 'Las Heras', 'San Rafael',
  'La Paz', 'Lavalle', 'Malargue', 'Rivadavia', 'San Carlos', 'San Martin', 'Tupungato'
].each { |name| Department.find_or_create_by_name name }


['Futbol', 'Tenis', 'Paddle'].each { |name| Sport.find_or_create_by_name name}




