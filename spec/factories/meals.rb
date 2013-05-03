#spec/factories/meals.rb

FactoryGirl.define do

	factory :meal do
		aperitif "Apéritif"
		starter "Entrée"
		course "Plat"
		dessert "Dessert"
		notes "Notes"
		diner true
	end

end