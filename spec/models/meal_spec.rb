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

	it 'returns all meals who participates the guest "Toto" when "Toto" is searched' do
		guestToto = FactoryGirl.create(:guest, name: "Toto")
		guestTata = FactoryGirl.create(:guest, name: "Tata")
		
		mealOk1 = FactoryGirl.create(:meal, guest: guestToto)
		mealKo = FactoryGirl.create(:meal, guest: guestTata)
		mealOk2 = FactoryGirl.create(:meal, guest: guestToto)
	
		Meal.search("Toto").should eq([mealOk1, mealOk2])
	end

end