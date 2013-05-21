class Myadmin::FeedbacksController < Myadmin::ApplicationController
  # GET /feedbacks
  # GET /feedbacks.json
  def index
    #@feedbacks = Feedback.all
    @feedbacks = Feedback.no_read

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feedbacks }
    end
  end

  def thank_you
    #@feedbacks = Feedback.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feedbacks }
    end
  end  

  def to_read_message
    feedback_item = Feedback.find(params[:id])
    feedback_item.update_attribute(:read, true)
    render :json => {:result => "ok"}
  end

  def massmove
    Feedback.all.map{|item|item.update_attribute(:read, true)} if params[:move] == "read"
    Feedback.all.map{|item|item.update_attribute(:read, false)} if params[:move] == "not_read"

    respond_to do |format|
      format.html { redirect_to myadmin_feedbacks_url}
    end  

  end  

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
    @feedback = Feedback.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feedback }
    end
  end

  # GET /feedbacks/new
  # GET /feedbacks/new.json
  def new
    @feedback = Feedback.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feedback }
    end
  end

  # GET /feedbacks/1/edit
  def edit
    @feedback = Feedback.find(params[:id])
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(params[:feedback])

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to myadmin_thank_you_feedbacks_path, notice: 'Feedback was successfully created.' }
        format.json { render json: @feedback, status: :created, location: @feedback }
      else
        format.html { render action: "new" }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feedbacks/1
  # PUT /feedbacks/1.json
  def update
    @feedback = Feedback.find(params[:id])

    respond_to do |format|
      if @feedback.update_attributes(params[:feedback])
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to myadmin_feedbacks_url }
      format.json { head :no_content }
    end
  end
end
