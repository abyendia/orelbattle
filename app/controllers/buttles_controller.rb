class ButtlesController < ApplicationController
  # GET /buttles
  # GET /buttles.json
  def index
    @buttles = Buttle.all

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
    @description1 = @buttle.opponent_first.description.to_s.squish
    @description2 =  @buttle.opponent_second.description.to_s.squish
  
    @count_voite_left = @buttle.votes_first_opponent.size
    @count_voite_right = @buttle.votes_second_opponent.size

    @shares_url = "http://qwertytestytrewq.ru/"#request.url#
    @title = @buttle.name 
    @image_path_vk = "http://localhost:3000/assets/decor/logo.jpg"
 
    @image_voice_left = "http://#{request.host}:#{request.port}#{@buttle.opponent_first.image.url(:small)}"
    @image_voice_right = "http://#{request.host}:#{request.port}#{@buttle.opponent_second.image.url(:small)}"
    
    
    @guest_ip = '127.0.0.4'#request.remote_ip 
 
    @vote_access_left =  @buttle.access_vote_first_opponent(@guest_ip)
    @vote_access_right = @buttle.access_vote_second_opponent(@guest_ip)
 
    @vote_access = @buttle.access_vote(@guest_ip)

    @desc = "this is test message this is test message this is test message"


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
