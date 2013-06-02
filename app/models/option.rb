class Option < ActiveRecord::Base
   attr_accessible :param, :value

   #validates :param, :uniqueness => true
end
