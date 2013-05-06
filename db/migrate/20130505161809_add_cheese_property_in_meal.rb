class AddCheesePropertyInMeal < ActiveRecord::Migration
  
  def change
  	add_column :meals, :cheese, :boolean
  end

end