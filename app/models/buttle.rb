class Buttle < ActiveRecord::Base
	belongs_to :opponent_1, :class_name => "Lot", :foreign_key => "opponent_1"
	belongs_to :opponent_2, :class_name => "Lot", :foreign_key => "opponent_2"
end	