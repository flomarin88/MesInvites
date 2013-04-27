class GuestsController < ApplicationController

	def index
		@guests = Guest.all

		respond_to do |format|
			format.json { render :json => @guests }
		end
	end

end