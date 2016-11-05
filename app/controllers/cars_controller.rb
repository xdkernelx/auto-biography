class CarsController < ApplicationController
	def index 
		@user = current_user
		@cars = @user.cars
	end

	def show
		@car = Car.find(params[:id])
	end

	def new
		@car = Car.new
	end 

	def edit
	end

	def create
		@car = Car.new(car_params)
		p '*************************************'
		@user = current_user
		p '*************************************'
		@car.user_id = @user.id
		p '*************************************'
		@car.save
		redirect_to cars_path
	end

	private
	def car_params
		params.require(:car).permit(:user_id, :mileage, :vin, :year, :make, :model, :color, :transmission, :engine)
	end
end