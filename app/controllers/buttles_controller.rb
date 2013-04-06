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
