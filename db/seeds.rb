# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


##Departments

[
  'Mendoza', 'Maipu', 'Godoy Cruz', 'Lujan', 'Guaymallen', 'Las Heras', 'San Rafael',
  'La Paz', 'Lavalle', 'Malargue', 'Rivadavia', 'San Carlos', 'San Martin', 'Tupungato'
].each { |name| Department.find_or_create_by_name name }


##Sports

['Futbol', 'Tenis', 'Paddle'].each { |name| Sport.find_or_create_by_name name}



##Seeded Clubs


##Tennis

## 1 - Andino Tenis Club

Club.destroy_all

cl = Club.new;
cl.name = 'Andino Tenis Club'
cl.address = 'Avenida Boulogne Sur Mer 1230'
cl.department_id = Department.find_by_name('Mendoza').id 
cl.phone_number = 4380124
cl.tenis_quantity = 6

if File.exists?('pictures/ten-img1.jpg')
   cl.pictures.build picture: File.new('pictures/ten-img1.jpg')
   cl.pictures.build picture: File.new('pictures/ten-img2.jpg')
   cl.pictures.build picture: File.new('pictures/ten-img3.jpg')
else
   puts 'cant find club image for club ' + cl.name
end

cl.save


## 2 - Club Mendoza 

cl = Club.new;
cl.name = 'Mendoza Tenis Club'
cl.address = 'Boulogne Sur Mer 220'
cl.department_id = Department.find_by_name('Mendoza').id 
cl.phone_number = 4237125
cl.tenis_quantity = 8

if File.exists?('pictures/ten-img1.jpg')
   cl.pictures.build picture: File.new('pictures/ten-img2.jpg')
   cl.pictures.build picture: File.new('pictures/ten-img1.jpg')
   cl.pictures.build picture: File.new('pictures/ten-img3.jpg')
else
   puts 'cant find club image for club ' + cl.name
end

cl.save


## 3 - Club Maipu 

cl = Club.new;
cl.name = 'Maipu Tenis Club'
cl.address = 'J. Paso 4463'
cl.department_id = Department.find_by_name('Maipu').id 
cl.phone_number = 4394857
cl.tenis_quantity = 3

if File.exists?('pictures/ten-img3.jpg')
   cl.pictures.build picture: File.new('pictures/ten-img3.jpg')
else
   puts 'cant find club image for club ' + cl.name
end

cl.save

## 4 - Vistalba Tenis

cl = Club.new;
cl.name = 'Vistalba Club'
cl.address = 'Vieja canameda 2363'
cl.department_id = Department.find_by_name('Lujan').id 
cl.phone_number = 4395715
cl.tenis_quantity = 2

if File.exists?('pictures/ten-img4.jpg')
   cl.pictures.build picture: File.new('pictures/ten-img4.jpg')
   cl.pictures.build picture: File.new('pictures/ten-img5.jpg')
else
   puts 'cant find club image for club ' + cl.name
end

cl.save


##Futbol Clubs

## 6 - Futbol 5 las Tortugas 

cl = Club.new;
cl.name = 'Las Tortugas futbol 5'
cl.address = 'Zapiola 366'
cl.department_id = Department.find_by_name('Guaymallen').id 
cl.phone_number = 4343034
cl.futbol_quantity = 2

if File.exists?('pictures/ten-img5.jpg')
   cl.pictures.build picture: File.new('pictures/fut-img3.jpg')
   cl.pictures.build picture: File.new('pictures/fut-img1.jpg')
   cl.pictures.build picture: File.new('pictures/fut-img2.jpg')
else
   puts 'cant find club image for club ' + cl.name
end

cl.save

## 7 - Al toque futbol

cl = Club.new;
cl.name = 'Al toque futbol'
cl.address = 'San francisco del monte 1665'
cl.department_id = Department.find_by_name('Godoy Cruz').id 
cl.phone_number = 2615786983
cl.futbol_quantity = 1

if File.exists?('pictures/fut-img2.jpg')
   cl.pictures.build picture: File.new('pictures/fut-img2.jpg')
else
   puts 'cant find club image for club ' + cl.name
end

cl.save


## 8 - Independencia Futbol

cl = Club.new
cl.name = 'Independencia Futbol'
cl.address = 'Independencia 310'
cl.department_id = Department.find_by_name('Godoy Cruz').id 
cl.phone_number = 153681421
cl.futbol_quantity = 1

if File.exists?('pictures/fut-img1.jpg')
   cl.pictures.build picture: File.new('pictures/fut-img1.jpg')
else
   puts 'cant find club image for club ' + cl.name
end

cl.save



## 9 - El Pasillo Futbol 5

cl = Club.new
cl.name = 'El Pasillo Futbol 5'
cl.address = 'Bartolome Mitre 293'
cl.department_id = Department.find_by_name('Lujan').id 
cl.phone_number = 153457887
cl.futbol_quantity = 1

if File.exists?('pictures/fut-img4.jpg')
   cl.pictures.build picture: File.new('pictures/fut-img4.jpg')
else
   puts 'cant find club image for club ' + cl.name
end

cl.save


## 10 - SUN RANCH FUTBOL 5

cl = Club.new
cl.name = 'Sun Ranch Futbol 5'
cl.address = 'Roque Saenz Pena 143'
cl.department_id = Department.find_by_name('Lujan').id 
cl.phone_number = 4298934
cl.futbol_quantity = 2

if File.exists?('pictures/fut-img4.jpg')
   cl.pictures.build picture: File.new('pictures/fut-img5.jpg')
else
   puts 'cant find club image for club ' + cl.name
end

cl.save


##Paddle Clubs
 
## 11 - Tie Break


cl = Club.new
cl.name = 'Tie Break'
cl.address = 'Quintana 235'
cl.department_id = Department.find_by_name('Godoy Cruz').id 
cl.phone_number = 4243907
cl.paddle_quantity = 4

if File.exists?('pictures/pad-img1.jpg')
   cl.pictures.build picture: File.new('pictures/pad-img1.jpg')
else
   puts 'cant find club image for club ' + cl.name
end

cl.save


## 12 - Las Terrazas


cl = Club.new
cl.name = 'Las Terrazas Club Paddle'
cl.address = 'C W Lencinas 333'
cl.department_id = Department.find_by_name('Mendoza').id 
cl.phone_number = 4297141
cl.paddle_quantity = 4

if File.exists?('pictures/pad-img2.jpg')
   cl.pictures.build picture: File.new('pictures/pad-img2.jpg')
else
   puts 'cant find club image for club ' + cl.name
end

cl.save


## 13 - Cumbres Paddle


cl = Club.new
cl.name = 'Las Terrazas Club Paddle'
cl.address = 'Andrade 271'
cl.department_id = Department.find_by_name('Guaymallen').id 
cl.phone_number = 155437972
cl.paddle_quantity = 4

if File.exists?('pictures/pad-img3.jpg')
   cl.pictures.build picture: File.new('pictures/pad-img3.jpg')
else
   puts 'cant find club image for club ' + cl.name
end

cl.save 



## 14 - Padel El Cipres


cl = Club.new
cl.name = 'Padel El Cipres'
cl.address = 'Dr. Moreno 1986'
cl.department_id = Department.find_by_name('Las Heras').id 
cl.phone_number = 2614484705
cl.paddle_quantity = 4

if File.exists?('pictures/pad-img4.jpg')
   cl.pictures.build picture: File.new('pictures/pad-img4.jpg')
else
   puts 'cant find club image for club ' + cl.name
end

cl.save 


##Multi Sport Clubs

## 15 - Regatas Club

cl = Club.new;
cl.name = 'Regatas'
cl.address = 'Sarmiento 66'
cl.department_id = Department.find_by_name('Mendoza').id 
cl.phone_number = 4360384
cl.tenis_quantity = 4
cl.futbol_quantity = 2
cl.paddle_quantity = 4

if File.exists?('pictures/ten-img5.jpg')
   cl.pictures.build picture: File.new('pictures/ten-img5.jpg')
   cl.pictures.build picture: File.new('pictures/fut-img1.jpg')
   cl.pictures.build picture: File.new('pictures/fut-img2.jpg')
   cl.pictures.build picture: File.new('pictures/pad-img1.jpg')
else
   puts 'cant find club image for club ' + cl.name
end

cl.save

## 16 - Andes Talleres

cl = Club.new;
cl.name = 'Andes Talleres'
cl.address = 'Belgrano 66'
cl.department_id = Department.find_by_name('Godoy Cruz').id 
cl.phone_number = 4360384
cl.futbol_quantity = 2
cl.paddle_quantity = 4

if File.exists?('pictures/fut-img6.jpg')
   cl.pictures.build picture: File.new('pictures/fut-img6.jpg')
   cl.pictures.build picture: File.new('pictures/fut-img1.jpg')
   cl.pictures.build picture: File.new('pictures/fut-img2.jpg')
   cl.pictures.build picture: File.new('pictures/ten-img5.jpg')
else
   puts 'cant find club image for club ' + cl.name
end

cl.save




