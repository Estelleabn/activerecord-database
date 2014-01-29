class Recipe < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :difficulty, inclusion: { in: (0..5), message: "Humf, your difficulty scale doesn't seem valid." }

  def to_s
  	"--- #{name} --- \nDescription: #{description} \nCooking length: #{length} min \nDifficulty: #{difficulty} / 5"
  end
end