class Feedback < ActiveRecord::Base
  attr_accessible :email, :message, :name, :theme

  scope :no_read, where(:read => false)
  scope :yes_read, where(:read => true)
end
