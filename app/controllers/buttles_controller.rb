#encoding: utf-8
require 'stamp'

require 'new_will_paginate'

class ButtlesController < ApplicationController
  # GET /buttles
  # GET /buttles.json
  def index

    @buttles = Buttle.paginate(:page => params[:page] || 1, :per_page => 3)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buttles }
    end
  end

  # GET /buttles/1
  # GET /buttles/1.json
  def show
    @buttle = Buttle.find(params[:id])

    @title = 'Home page'
    cookies[:battle] = Time.now
   # @buttle = Buttle.first
    
    @border_div = 0

    @description1 =  @buttle.opponent_first.description.to_s.squish
    @description2 =  @buttle.opponent_second.description.to_s.squish

    @description1_for_share =  "1"#{}"По-моему круче: #{@buttle.opponent_first.name}"
    @description2_for_share =  "2"#{}"По-моему круче: #{@buttle.opponent_second.name}"    
  
    @desc = "Simple test text"
    @desc_left = "#{@buttle.name}. Мой выбор: #{@buttle.opponent_first.name}"
    @desc_right = "#{@buttle.name}. Мой выбор: #{@buttle.opponent_second.name}"


    @count_voite_left = @buttle.votes_first_opponent.size
    @count_voite_right = @buttle.votes_second_opponent.size

    @shares_url = "http://qwertytestytrewq.ru/privet/4"#request.url#
    @title = "Битвы Орла"#@buttle.name 
    @image_path_vk = "http://localhost:3000/assets/decor/logo.jpg"
 
    @image_voice_left = "http://#{request.host}:#{request.port}#{@buttle.opponent_first.image.url(:small)}"
    @image_voice_right = "http://#{request.host}:#{request.port}#{@buttle.opponent_second.image.url(:small)}"
    
    
    #OUT_BECAUSE_DRY
    if consider_ip_set = Option.find_by_param("consider_ip")
      @guest_ip = consider_ip_set.value == "true" ? request.remote_ip.to_s : "127.0.0.2"  
    else
      @guest_ip = APP_CONFIG['consider_ip'] == "true" ? request.remote_ip.to_s : "127.0.0.2"  
    end  
 
    @vote_access_left =  @buttle.access_vote_first_opponent(@guest_ip)
    @vote_access_right = @buttle.access_vote_second_opponent(@guest_ip)
 
    @vote_access = @buttle.access_vote(@guest_ip)

    


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buttle }
    end
  end

  # GET /buttles/new
  # GET /buttles/new.json
  def new
    @buttle = Buttle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @buttle }
    end
  end

  # GET /buttles/1/edit
  def edit
    @buttle = Buttle.find(params[:id])
    @lots = Lot.all
  end

  # POST /buttles
  # POST /buttles.json
  def create
    @buttle = Buttle.new(params[:buttle])

    respond_to do |format|
      if @buttle.save
        format.html { redirect_to buttles_path, notice: 'Buttle was successfully created.' }
        format.json { render json: @buttle, status: :created, location: @buttle }
      else
        format.html { render action: "new" }
        format.json { render json: @buttle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buttles/1
  # PUT /buttles/1.json
  def update
    @buttle = Buttle.find(params[:id])

    respond_to do |format|
      if @buttle.update_attributes(params[:buttle])
        format.html { redirect_to buttles_path, notice: 'Buttle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @buttle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buttles/1
  # DELETE /buttles/1.json
  def destroy
    @buttle = Buttle.find(params[:id])
    @buttle.destroy

    respond_to do |format|
      format.html { redirect_to buttles_url }
      format.json { head :no_content }
    end
  end
end
