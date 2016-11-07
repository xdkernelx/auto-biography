module MechanicsHelper
	def mechanic?
		current_user.mech_status == true
	end

	def customer?
		current_user.mech_status == false
	end
end