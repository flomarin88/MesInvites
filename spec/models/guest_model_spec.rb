#spec/models/guest_model_spec.rb
require 'spec_helper'

describe Guest do
	
	it 'has a valid factory' do
		FactoryGirl.create(:guest).should be_valid
	end

	it 'creates a guest if not exists when a meal is added' do
		meal = FactoryGirl.build(:meal)
		guest = FactoryGirl.build(:guest)
		meal.guest = guest
		meal.save.should be_true
		Guest.all.should eq([guest])
	end


	it 'updates a guest if exists when a meal is added' do
		guest = FactoryGirl.create(:guest)
		
		meal = FactoryGirl.build(:meal)
		meal.guest = guest
		meal.save.should be_true
		
		Guest.all.should eq([guest])
	end
end