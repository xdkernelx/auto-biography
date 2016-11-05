class CarsController < ApplicationController
	def index 
		@user = current_user
		@cars = @user.cars
	end

	def show
		@car = Car.find(params[:id])
	end

end