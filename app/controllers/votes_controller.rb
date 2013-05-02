class VotesController < ApplicationController
  def new
    @buttle_id = params[:buttle_id]
    @lot_id = params[:lot_id]

    @buttle = Buttle.find(params[:buttle_id])
  	@lot_id_not_vote = params[:lot_id] == @buttle.opponent_first.id ? @buttle.opponent_second.id : @buttle.opponent_first.id
    #@change = +-1
  	Vote.create(:lot_id => params[:lot_id], :buttle_id => params[:buttle_id], :ip => '127.0.0.3')#request.remote_ip)
  	@count_vote = Vote.where(:lot_id => params[:lot_id], :buttle_id => params[:buttle_id]).size
    respond_to do |format|
      format.js
    end	
  end	
end	