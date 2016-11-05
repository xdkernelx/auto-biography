class CarsController < ApplicationController
	def index 
		@user = current_user
		@cars = @user.cars
	end

end