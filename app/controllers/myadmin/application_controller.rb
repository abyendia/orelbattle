class Myadmin::ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate#:check_access
  layout 'myadmin'



  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      md5_of_password = Digest::MD5.hexdigest(password)
      username == 'admin' && md5_of_password == 'a86838dae048198de7487400d109bfd3'
    end  	
  end	
  #def check_access
  #	true
  #end	
end
