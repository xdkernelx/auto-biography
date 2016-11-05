class MaintenancesController < ApplicationController
	before_action :find_car_and_maintenance, only: [:edit, :update, :destroy]
	before_action :find_car_and_new_maintenance, only: [:new, :create]

	def index
		@car = Car.find(params[:car_id])
	end

	def show
	end

	def new
	end

	def edit
	end

	def create
		@maintenance.assign_attributes(maintenance_params)
		@maintenance.car_id = @car.id
		if @maintenance.save
			redirect_to car_maintenances_path(@car)
		else
			@errors = @maintenance.errors.full_messages
			render 'new'
		end
	end

	def update
		if @maintenance.update(maintenance_params)
			redirect_to car_maintenances_path(@car)
		else
			@errors = @maintenance.errors.full_messages
			render 'edit'
		end
	end

	def destroy
		@maintenance.destroy
		redirect_to car_maintenances_path(@car)
	end

	private

	def maintenance_params
		params.require(:maintenance).permit(:title, :description, :mileage, :date_completed, :car_id)
	end

	def find_car_and_maintenance
		@car = Car.find(params[:car_id])
		@maintenance = Maintenance.find(params[:id])
	end

	def find_car_and_new_maintenance
		@car = Car.find(params[:car_id])
		@maintenance = Maintenance.new
	end
end