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
 
   @shares_url = "http://qwertytestytrewq.ru/"#request.url#
   @title = @buttle.name 
   @image_path_vk = "http://localhost:3000/assets/decor/logo.jpg"

   @image_voice_left = "http://#{request.host}:#{request.port}#{@buttle.opponent_first.image.url(:small)}"
   @image_voice_right = "http://#{request.host}:#{request.port}#{@buttle.opponent_second.image.url(:small)}"
   
   
   @desc = "this is test message this is test message this is test message"

		respond_to do |format|
			format.html do 
				#render :layout => nil
			end	
		end	
	end	
end
