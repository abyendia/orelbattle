module Utils

	def type_of_vote_sum_to_int(psum=nil)
	  {:none => 0, :vk => 1, :twitter => 2, :facebook => 3}.each do |sum,val|
	  	return  val if sum == psum
	  end	
	  return nil

	end	

end	