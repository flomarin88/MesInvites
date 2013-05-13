class SearchController < ApplicationController
	
	def search
		@meals = Meal.search(params['query'])
		respond_to do |format|
	      format.html
	      format.json { render :json => @meals }
	    end
  	end

  	def index
  		redirect_to :action => "search", :query => params['query']
  	end

end