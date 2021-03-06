class VotesController < ApplicationController

  def all

    @all_votes = Vote.all
    respond_to do |format|
      format.html
    end  

  end  

  def new
    @buttle_id = params[:buttle_id]
    @lot_id = params[:lot_id]

    @buttle = Buttle.find(params[:buttle_id])
  	@lot_id_not_vote = params[:lot_id] == @buttle.opponent_first.id ? @buttle.opponent_second.id : @buttle.opponent_first.id
    #@change = +-1

    #OUT_BECAUSE_DRY
    if consider_ip_set = Option.find_by_param("consider_ip")
      @ip = consider_ip_set.value == "true" ? request.remote_ip.to_s : "127.0.0.3"  
    else
      @ip = APP_CONFIG['consider_ip'] == "true" ? request.remote_ip.to_s : "127.0.0.3"  
    end

    if vote = Vote.where(:lot_id => params[:lot_id], :buttle_id => params[:buttle_id], :ip => @ip ).first 
      vote.update_attribute(:updated_at, Time.now())
    else
      Vote.create(:lot_id => params[:lot_id], :buttle_id => params[:buttle_id], :ip => @ip )
    end 


  	@count_vote = Vote.where(:lot_id => params[:lot_id], :buttle_id => params[:buttle_id]).size
    respond_to do |format|
      format.js
    end	
  end	
end	