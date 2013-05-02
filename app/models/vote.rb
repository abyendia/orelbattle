include Utils 
class Vote < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :buttle_id, :lot_id, :ip
  belongs_to :buttle
  belongs_to :lot
  #scope :one_kind_of_vote, :conditions => 'kind_of_vote = 1'

  scope :one_kind_of_vote, lambda { |param| {:conditions => "kind_of_vote =#{type_of_vote_sum_to_int(param)}"}   } 

  #field type = {:none => 0, :vk => 1, twitter => 2, :facebook => 3}
end
