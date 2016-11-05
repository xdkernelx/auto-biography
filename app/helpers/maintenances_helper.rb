module MaintenancesHelper
	def owner?(car)
		if car.user == current_user
			true
		else
			false
		end
	end
end