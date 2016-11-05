class MaintenanceController < ApplicationController
	def index
		@car = Car.find(params[:car_id])
	end

	def new
		@car = Car.find(params[:car_id])
		@maintenance = Maintenance.new
	end

	def create
	end
end