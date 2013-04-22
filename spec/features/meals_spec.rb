#specs/requests/meals_spec.rb
require 'spec_helper'

describe "Meals" do
	describe "Manage Meals" do
		it "Adds a new meal and displays the results" do
			visit meals_url	
			expect {
				click_link 'Ajouter un repas'
				fill_in 'Description', with: 'Ma description'
				click_button 'Enregistrer'
			}.to change(Meal, :count).by(1)
			page.should have_content "Le repas a été créé avec succès."
			page.should have_content "Description : Ma description"
		end
	end
end