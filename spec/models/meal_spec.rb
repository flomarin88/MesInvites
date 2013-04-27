# spec/models/meal_spec.rb
require 'spec_helper'

describe Meal do

	it 'has a valid factory' do
		FactoryGirl.create(:meal).should be_valid
	end
	
	it 'creates a meal with a guest' do
		meal = FactoryGirl.build(:meal)
		guest = FactoryGirl.build(:guest)
		meal.guest = guest
		meal.save.should be_true
		Meal.all.should eq([meal])
	end

end