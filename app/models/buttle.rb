include Utils
class Buttle < ActiveRecord::Base
	attr_protected :opp_voice_vk_1,	:opp_voice_vk_2
	belongs_to :opponent_first, :class_name => "Lot", :foreign_key => "opponent_1"
	belongs_to :opponent_second, :class_name => "Lot", :foreign_key => "opponent_2"
	has_many :votes

	has_many :votes_first_opponent, :class_name => "Vote", :conditions => proc {"votes.lot_id = #{opponent_first.id}"}
	has_many :votes_second_opponent, :class_name => "Vote", :conditions => proc {"votes.lot_id = #{opponent_second.id}"}	

	before_update :published_item_must_be_one, :if => Proc.new { published_changed? }

	#scope :in_general_page, where(:published => true).first

	#scope :count_vote_type_scope, :joins => :votes, :conditions => 'votes.type = 1'
	#def count_vote_all
	#  votes.size		
	#end
#
	#def count_vote_type(ptype=:none)
    #  votes.one_kind_of_vote(ptype).size
	#end

	def published_item_must_be_one
	  if self.published
	  	Buttle.where(:published => true).map{|item| item.update_attribute(:published, false)}
	  end
	end	

	def self.in_general_page
	   where(:published => true).first	
	end	

	def  votes_first_opponent_type(ptype=:none)
	  votes_first_opponent.where(:kind_of_vote => type_of_vote_sum_to_int(ptype))		
	end
	def  votes_second_opponent_type(ptype=:none)
	  votes_second_opponent.where(:kind_of_vote => type_of_vote_sum_to_int(ptype))		
	end

	def access_vote_first_opponent(ip)
		has_vote = Vote.where(:buttle_id => self.id, :lot_id => self.opponent_first.id, :ip => ip).first
		return true if has_vote.nil?
		return true if Time.now.to_i - has_vote.updated_at.to_i > 1.hour.to_i
		return false  
	end


	def access_vote_second_opponent(ip)
		has_vote = Vote.where(:buttle_id => self.id, :lot_id => self.opponent_second.id, :ip => ip).first
		return true if has_vote.nil?
		return true if Time.now.to_i - has_vote.updated_at.to_i > 1.hour.to_i
		return false  
	end	

	Vote.where(:buttle_id => Buttle.find(1).id, :lot_id => Buttle.find(1).opponent_first.id, :ip => "127.0.0.1").first

	def access_vote(ip)
		has_vote_1 = Vote.where(:buttle_id => self.id, :lot_id => self.opponent_first.id, :ip => ip).first
		has_vote_2 = Vote.where(:buttle_id => self.id, :lot_id => self.opponent_second.id, :ip => ip).first
		return true if has_vote_1.nil? && has_vote_2.nil? 
		if has_vote_1
		  return true if Time.now.to_i - has_vote_1.updated_at.to_i > 1.hour.to_i
		end
		if has_vote_2
		  return true if Time.now.to_i - has_vote_2.updated_at.to_i > 1.hour.to_i
		end		  
		return false  
	end								
end	