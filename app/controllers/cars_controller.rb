class CarsController < ApplicationController
	def index 
		if user_signed_in?
			@user = current_user
			@cars = @user.cars
		else
			@errors = 'sign in first'
		end
	end

	def show
		@car = Car.find(params[:id])
	end

	def new
		@car = Car.new
	end 

	def edit
		@car = Car.find(params[:id])
	end

	def create
		@car = Car.new(car_params)
		@user = current_user
		@car.user_id = @user.id
		if @car.save
			redirect_to cars_path
		else
			render 'new'
		end
	end

	def update
		@car = Car.find(params[:id])

		if @car.update(car_params)
			redirect_to @car 
		else
			render 'edit'
		end
	end

	def destroy
		@car = Car.find(params[:id])
		@car.destroy

		redirect_to cars_path
	end

	private
	def car_params
		params.require(:car).permit(:user_id, :mileage, :vin, :year, :make, :model, :color, :transmission, :engine)
	end
end