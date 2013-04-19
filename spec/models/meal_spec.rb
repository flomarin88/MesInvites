# spec/models/meal_spec.rb
require 'spec_helper'

describe Meal do

	it 'has a valid factory' do
		FactoryGirl.create(:meal).should be_valid
	end

	it 'is invalid without description' do
		FactoryGirl.build(:meal, description: nil).should_not be_valid
	end

end