#spec/models/guest_model_spec.rb
require 'spec_helper'

describe Guest do
	
	it 'has a valid factory' do
		FactoryGirl.create(:guest).should be_valid
	end
end