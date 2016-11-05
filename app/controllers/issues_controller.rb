class IssuesController < ApplicationController

	def index
		@car = Car.find(params[:car_id])
		@issues = @car.issues
	end

	def new
		@car = Car.find(params[:car_id])
		@issue = Issue.new
	end 

	def edit
		@issue = Issue.find(params[:id])
		@car = Car.find(params[:car_id])
	end

	def create
		@issue = Issue.new(issue_params)
		if @issue.save
			redirect_to car_issues_path(@car)
		else
			@errors = @issue.errors.full_messages
			render 'new'
		end
	end

	def update
		@issue = Issue.find(params[:id])
		@car = Car.find(params[:car_id])
		if @issue.update(issue_params)
			redirect_to car_issues_path(@car)
		else
			@errors = @issue.errors.full_messages
			render 'edit'
		end
	end
	private

	def issue_params
		params.require(:issue).permit(:title, :description, :urgency, :car_id)
	end

end