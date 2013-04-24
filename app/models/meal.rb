class Meal < ActiveRecord::Base
	attr_accessible :meal_date, :aperitif, :starter, :course, :dessert, :notes
	
end
