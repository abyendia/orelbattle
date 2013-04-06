class Buttle < ActiveRecord::Base
	attr_protected :opp_voice_vk_1,	:opp_voice_vk_2
	belongs_to :opponent_first, :class_name => "Lot", :foreign_key => "opponent_1"
	belongs_to :opponent_second, :class_name => "Lot", :foreign_key => "opponent_2"
end	