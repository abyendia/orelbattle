class VotesController < ApplicationController
  def new
  	@buttle = params[:buttle_id]
  	@lot = params[:lot_id]
  	@change = +-1
  	Vote.create(:lot_id => params[:lot_id], :buttle_id => params[:buttle_id])
    respond_to do |format|
      format.js
    end	
  end	
end	