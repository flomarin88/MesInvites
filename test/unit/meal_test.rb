require 'test_helper'

class MealTest < ActiveSupport::TestCase
	
	test "meal without desciption can not be saved" do
    	# Given
    	@meal = Meal.new

    	# When
    	# Then
    	assert !@meal.save
	end

  	test "meal with desciption can be saved" do
    	# Given
    	@meal = Meal.new
    	@meal.description = "Description"
    	
    	# When
    	# Then
    	assert @meal.save
  	end
end
