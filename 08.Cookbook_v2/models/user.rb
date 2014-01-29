class User < ActiveRecord::Base
	has_many :recipes
	
  def to_s
    "User name: #{name} \nEmail: #{email}"
  end
end