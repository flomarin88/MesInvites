class Meal < ActiveRecord::Base
	attr_accessible :meal_date, :diner, :aperitif, :starter, :course, :dessert, :notes
	
	belongs_to :guest
end
