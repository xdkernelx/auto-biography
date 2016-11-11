class CarsController < ApplicationController
	include SpecialsHelper

	before_action :find_car, only: [:show, :edit, :update, :destroy]

	def index
		if user_signed_in?
			@user = current_user
			@cars = @user.cars
		else
			@errors = 'sign in first'
		end
	end

	def show
	end

	def new
		@car = Car.new
	end

	def edit
		@flag = true
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
		if @car.update(car_params)
			redirect_to @car
		else
			render 'edit'
		end
	end

	def destroy
		@car.repairs.each { |repair| repair.destroy }
		@car.issues.each { |issue| issue.destroy }
		@car.maintenances.each { |maintenance| maintenance.destroy }
		@car.destroy

		redirect_to cars_path
	end

	private
	def car_params
		params.require(:car).permit(:user_id, :mileage, :vin, :year, :make, :model, :color, :transmission, :engine, :image)
	end

	def find_car
		@car = Car.find(params[:id])
		# @car.service_range ? @service_range = @car.service_range : @service_range = 60000
		# @car.oil_range ? @oil_range = @car.oil_range : @oil_range = 5000
		@service_range = 60000
		@oil_range = 5000
		service_check = @car.maintenance_check(@service_range, "service")
		oil_check = @car.maintenance_check(@oil_range, "oil change")
		service_check ? @service_change = service_check : @service_change = (@car.mileage < @service_range ? @car.mileage : @service_range )
		oil_check ? @oil_change = oil_check : @oil_change = (@car.mileage < @oil_range ? @car.mileage : @oil_range )
	end
end
