#specs/requests/meals_spec.rb
require 'spec_helper'

describe "Meals" do
	describe "Manage Meals" do
		it "Adds a new meal and displays the results" do
			visit meals_url	
			expect {
				click_link 'Ajouter un repas'
				click_button 'lunchButton'
				fill_in 'Apéritif', with: 'Apéro'
				fill_in 'Entrée', with: 'Tomates'
				fill_in 'Plat', with: 'Bon plat'
				fill_in 'Dessert', with: 'Excellent dessert'
				fill_in 'Notes', with: 'Mes notes'
				click_button 'Enregistrer'
			}.to change(Meal, :count).by(1)
			page.should have_content "Le repas a été créé avec succès."
			page.should have_content "Déjeuner"
			page.should have_content "Apéritif : Apéro"
			page.should have_content "Entrée : Tomate"
			page.should have_content "Plat : Bon plat"
			page.should have_content "Dessert : Excellent dessert"
			page.should have_content "Notes : Mes notes"
		end

		it "Adds a new incomplete meal and displays the results without offsets"
	end
end