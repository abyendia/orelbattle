class Myadmin::VotesController < Myadmin::ApplicationController

  def all

    @all_votes = Vote.all
    respond_to do |format|
      format.html
    end  

  end  

end	