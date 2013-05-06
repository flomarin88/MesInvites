class AddSaladPropertyIntoMeal < ActiveRecord::Migration
  def change
  	add_column :meals, :salad, :boolean		
  end
end
