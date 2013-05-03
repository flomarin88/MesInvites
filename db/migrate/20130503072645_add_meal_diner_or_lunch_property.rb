class AddMealDinerOrLunchProperty < ActiveRecord::Migration
  
  def change
  	add_column :meals, :diner, :boolean, :null => true, :default => nil
  end

end