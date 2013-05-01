include Utils
class Buttle < ActiveRecord::Base
	attr_protected :opp_voice_vk_1,	:opp_voice_vk_2
	belongs_to :opponent_first, :class_name => "Lot", :foreign_key => "opponent_1"
	belongs_to :opponent_second, :class_name => "Lot", :foreign_key => "opponent_2"
	has_many :votes

	has_many :votes_first_opponent, :class_name => "Vote", :conditions => proc {"votes.lot_id = #{opponent_first.id}"}
	has_many :votes_second_opponent, :class_name => "Vote", :conditions => proc {"votes.lot_id = #{opponent_second.id}"}	

	#scope :count_vote_type_scope, :joins => :votes, :conditions => 'votes.type = 1'
	#def count_vote_all
	#  votes.size		
	#end
#
	#def count_vote_type(ptype=:none)
    #  votes.one_kind_of_vote(ptype).size
	#end	

	def  votes_first_opponent_type(ptype=:none)
	  votes_first_opponent.where(:kind_of_vote => type_of_vote_sum_to_int(ptype))		
	end
	def  votes_second_opponent_type(ptype=:none)
	  votes_second_opponent.where(:kind_of_vote => type_of_vote_sum_to_int(ptype))		
	end			
end	