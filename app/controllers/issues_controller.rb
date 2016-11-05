class IssuesController < ApplicationController
	def index
		@car = Car.find(params[:car_id])
		@issues = @car.issues
		p params
	end
end