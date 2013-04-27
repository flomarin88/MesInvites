#spec/controllers/guests_controller_spec.rb
require 'spec_helper'

describe GuestsController do

	describe "GET #index" do
		it "populates an array of guests" do
			guest1 = FactoryGirl.create(:guest)
			guest2 = FactoryGirl.create(:guest)

			get :index
			assigns(:guests).should eq([guest1, guest2])
		end
	end
	
end