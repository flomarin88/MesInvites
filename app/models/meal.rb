class Meal < ActiveRecord::Base
	attr_accessible :meal_date, :diner, :aperitif, :starter, :course, :cheese, :salad, :dessert, :notes
	
	belongs_to :guest
end
