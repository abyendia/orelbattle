#require 'paperclipped'
class Lot < ActiveRecord::Base
  #include Paperclip::Glue
  
# attr_accessible :image

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
 
  attr_protected :url_message#:name, :image, :description
  has_many :buttles
end
