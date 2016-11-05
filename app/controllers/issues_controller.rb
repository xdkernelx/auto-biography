class IssuesController < ApplicationController

	def index
		@car = Car.find(params[:car_id])
		@issues = @car.issues
	end

	def new
		@car = Car.find(params[:car_id])
		@issue = Issue.new
	end 

	def create
		@car = Car.find(params[:car_id])
		@issue = Issue.new(issue_params)
		if @issue.save
			redirect_to car_issues_path(@car)
		else
			@errors = @issue.errors.full_messages
			render 'new'
		end
	end

	private

	def issue_params
		params.require(:issue).permit(:title, :description, :urgency, :car_id)
	end

end