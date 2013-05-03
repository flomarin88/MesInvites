class AddMealDinerOrLunchProperty < ActiveRecord::Migration
  
  def change
  	add_column :meals, :diner, :boolean
  end

end