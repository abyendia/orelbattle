class PagesController < ApplicationController
	def home
		@title = 'Home page'
		cookies[:battle] = Time.now
		@buttle = Buttle.first
		
  @border_div = 0
  @description1 = @buttle.opponent_first.description.to_s.squish
  @description2 =  @buttle.opponent_second.description.to_s.squish
  
  #@description2 = @description2.gsub(/\n/, " ")

  #<<HER @buttle.opponent_second.description.to_s HER
  
#@description1="ddsfcsdfs"
 
   @url_vk = request.url#"http://qwertytestytrewq.ru/"
   @title_vk = @buttle.name 
   @image_path_vk = "http://localhost:3000/assets/decor/logo.jpg" 
   @desc_vk = "this is test message, please give me to post them"

		respond_to do |format|
			format.html do 
				#render :layout => nil
			end	
		end	
	end	
end
