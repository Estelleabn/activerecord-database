require './models/recipe'
require './models/user'
require 'active_record'


paulo = User.create(name: "Paulo Polot", email: "paulot@gmail.com")
puts paulo 
poulet = Recipe.create(name: "Poulet", description: "Preparer le poulet", length: 50, difficulty: 2, user_id: paulo.id)
puts poulet

carmen = User.create(name: "Carmen", email: "carmen")
carmen.errors.each do |attribute, message| 
	puts attribute
	puts message
end

tarte_aux_fruits = Recipe.create(name: "Tarte aux fruits", description: "Couper des fruits et les mettre dans une tarte", length: 80, difficulty: 12, user_id: paulo.id)
tarte_aux_fruits.errors.each do |attribute, message|
	puts attribute
	puts message
end
