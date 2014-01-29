require './models/recipe'
require './models/user'
require "nokogiri"
require "open-uri"
require 'active_record'
require 'faker'

# Seed you database with recipe data from marmiton
puts "Seeding database..."
# Here is a sample of ingredients (you are free to add some !)
ingredients = ["terrine", "choucroute", "agneau", "pomme", "orange", "cafe", "asperges", "celeri", "dorade"]

(1..13).each do |recipe|

	response = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=" + ingredients[rand(0..8)])
	doc = Nokogiri::HTML(response)
    
    user = User.create(name: Faker::Name.name, email: Faker::Internet.email)

	doc.search('.m_search_result').each do |element|
		name = element.search('.m_search_titre_recette > a').inner_text
		description = element.search('.m_search_result_part4').inner_text
		length = description.split[0...4].join(' ').match(/\d./)[0].to_i
		difficulty = rand(0..5)
		Recipe.create(name: name, description: description, length: length, difficulty: difficulty, user_id: user.id)
    end
end

