class Recipe < ActiveRecord::Base
  def to_s
  	"#{name} : \nHow to cook it : #{description} \nTake #{length} min to cook \nDifficulty : #{difficulty} / 5 \nCreated at : #{created_at} \nUpdated at : #{updated_at}"
  end
end