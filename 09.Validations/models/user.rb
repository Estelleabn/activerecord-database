class User < ActiveRecord::Base
  has_many :recipes
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /[\w.-]+@+[\w.-]+[\W][\w]*/, message: "This isn't a valid email, honey <3" }
	
  def to_s
    "User name: #{name} \nEmail: #{email}"
  end
end