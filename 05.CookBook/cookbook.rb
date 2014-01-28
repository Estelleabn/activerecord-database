require_relative 'config/application'
require './models/recipe'

# your program here

puts "Salut Robuchon, what do you want to do today?"
puts "1. create a recipe"
puts "2. delete all recipes"
puts "3. read your recipes"

choice = gets.chomp.to_i

if choice == 1
  puts "Which recipe do you wanna create ?"
  name = gets.chomp
  puts "How do you cook it ?"
  description = gets.chomp
  puts "How long does it take to cook it ?"
  length = gets.chomp.to_i
  puts "Is it difficult to cook ? Select a number between 1 and 5."
  difficulty = gets.chomp.to_i
  new_recipe = Recipe.create(name: name, description: description, length: length, difficulty: difficulty)

elsif choice == 2
  puts "Which recipe do you wanna delete ?"
  id = gets.chomp
  recipe_to_destroy = Recipe.find_by(name: id)
  recipe_to_destroy.destroy
  
elsif choice == 3
  recipes = Recipe.all
  puts recipes

else
  puts "i did not understand"
  
end