#spec/controllers/meals_controller_spec.rb
require 'spec_helper'

describe MealsController do
	
	describe "GET #index" do
		it "populates an array of meals" do
			meal1 = FactoryGirl.create(:meal)
			meal2 = FactoryGirl.create(:meal)
			get :index
			assigns(:meals).should eq([meal1, meal2])
		end

		it "renders the :index view" do
			get :index
    		response.should render_template :index
		end
	end

	describe "GET #show" do
		it "assigns the requested meal to @meal" do
			meal = FactoryGirl.create(:meal)
		    get :show, id: meal
		    assigns(:meal).should eq(meal)
		end
		
		it "renders the :show template" do
			get :show, id: FactoryGirl.create(:meal)
			response.should render_template :show
		end	
	end

	describe "GET #new" do
		it "assigns a new meal to @meal" do
			get :new

			assigns(:meal).attributes.each do |attr_name, attr_value|
				attr_value.should be_nil
			end
		end
		
		it "renders the :new template" do
			get :new
			response.should render_template :new
		end
	end

	describe "GET #create" do
		context "with valid attributes" do
			
			it "saves the new meal in the database" do
				expect {
					post :create, meal: FactoryGirl.attributes_for(:meal)
				}.to change(Meal, :count).by(1)
			end
			
			it "redirects to the home page" do
				post :create, meal: FactoryGirl.attributes_for(:meal)
      			response.should redirect_to Meal.last
			end
		end
	end

	describe 'PUT update' do
  		before :each do
    		@meal = FactoryGirl.create(:meal)
  		end
  
	  	context "valid attributes" do
		    it "located the requested @meal" do
		    	put :update, id: @meal, meal: FactoryGirl.attributes_for(:meal)
		      	assigns(:meal).should eq(@meal)      
	    	end
	  
		    it "changes @meal's attributes" do
		    	put :update, id: @meal, 
		        meal: FactoryGirl.attributes_for(:meal, aperitif: "NA", starter: "NE", course: "NP", dessert: "ND", notes: "NN")
			    @meal.reload
			    @meal.aperitif.should eq("NA")
			    @meal.starter.should eq("NE")
			    @meal.course.should eq("NP")
			    @meal.dessert.should eq("ND")
			    @meal.notes.should eq("NN")
		    end
	  
	    	it "redirects to the updated meal" do
	      		put :update, id: @meal, meal: FactoryGirl.attributes_for(:meal)
	      		response.should redirect_to @meal
	    	end
	  	end
	end

	describe 'DELETE destroy' do
		before :each do
	    	@meal = FactoryGirl.create(:meal)
	  	end
  
		it "deletes the meal" do
			expect{
		    	delete :destroy, id: @meal        
		    }.to change(Meal,:count).by(-1)
		end
		    
		it "redirects to meals#index" do
			delete :destroy, id: @meal
		    response.should redirect_to meals_url
		end
	end
end