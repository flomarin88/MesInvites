class AddMealsMainDetails < ActiveRecord::Migration
	def up
		add_column :meals, :aperitif, :string
		add_column :meals, :starter, :string
		add_column :meals, :course, :string
		add_column :meals, :dessert, :string 
		add_column :meals, :notes, :string
		add_column :meals, :meal_date, :date
		remove_column :meals, :description
  	end

	def down
		remove_column :meals, :aperitif 
		remove_column :meals, :starter 
		remove_column :meals, :course 
		remove_column :meals, :dessert 
		remove_column :meals, :notes
		remove_column :meals, :meal_date
		add_column :meals, :description, :string
	end
end
