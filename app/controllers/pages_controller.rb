class PagesController < ApplicationController
	def home
		@title = 'Home page'
		cookies[:battle] = Time.now
		respond_to do |format|
			format.html do 
				render :layout => nil
			end	
		end	
	end	
end
