class Myadmin::ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_access
  layout 'myadmin'


  def check_access
  	true
  end	
end
