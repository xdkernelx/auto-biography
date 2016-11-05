class MaintenancesController < ApplicationController
	def index
		@car = Car.find(params[:car_id])
	end

	def show
	end

	def new
		@car = Car.find(params[:car_id])
		@maintenance = Maintenance.new
	end

	def edit
		@car = Car.find(params[:car_id])
		@maintenance = Maintenance.find(params[:id])
	end

	def create
		@car = Car.find(params[:car_id])
		@maintenance = Maintenance.new
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
		@car = Car.find(params[:car_id])
		@maintenance = Maintenance.find(params[:id])

		if @maintenance.update(maintenance_params)
			redirect_to car_maintenances_path(@car)
		else
			@errors = @maintenance.errors.full_messages
			render 'edit'
		end
	end

	def destroy
		@car = Car.find(params[:car_id])
		@maintenance = Maintenance.find(params[:id])

		@maintenance.destroy
		redirect_to car_maintenances_path(@car)
	end

	private

	def maintenance_params
		params.require(:maintenance).permit(:title, :description, :mileage, :date_completed, :car_id)
	end
end