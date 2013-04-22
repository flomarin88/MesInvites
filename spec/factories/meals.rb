#spec/factories/meals.rb

FactoryGirl.define do 
	factory :meal do
		description "Description"
	end

	factory :invalid_meal, parent: :meal do |f|
		f.description nil
	end
end