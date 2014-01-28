class Recipe < ActiveRecord::Base	
	def to_s
		"#{name} : \nA cuisiner avec : #{description} \nTake #{length} min to cook \nDifficulty : #{difficulty} / 5"
	end
end