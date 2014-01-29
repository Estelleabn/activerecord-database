require './models/recipe'
require "nokogiri"
require "open-uri"
require 'active_record'

# Seed you database with recipe data from marmiton

puts "Seeding database..."

# Here is a sample of ingredients (you are free to add some !)
ingredients = ["curry", "crevettes", "agneau", "pomme", "orange", "cafe", "asperges", "celeri", "dorade"]

# Your code goes here 
# 1. Scrape recipes data from marmiton for these ingredients
# 2. Create associated recipe records in the DB



def seed(ingredient)
	response = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=" + ingredient)
	doc = Nokogiri::HTML(response)
	doc.search('.m_search_result').each do |element|
		name = element.search('.m_search_titre_recette > a').inner_text
		description = element.search('.m_search_result_part4').inner_text
		length = description.split[0...4].join(' ').match(/\d./)[0].to_i
		difficulty = rand(0..5)
		Recipe.create(name: name, description: description, length: length, difficulty: difficulty)
    end
end


seed(ingredients[0])
