# spec/models/meal_spec.rb
require 'spec_helper'

describe Meal do

	it 'has a valid factory' do
		FactoryGirl.create(:meal).should be_valid
	end
	
end