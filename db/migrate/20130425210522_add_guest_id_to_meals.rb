class AddGuestIdToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :guest_id, :integer
  end
end
