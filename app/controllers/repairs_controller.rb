class RepairsController < ApplicationController

  def edit
    @issue = Issue.find(params[:issue_id])
    @car = Car.find(params[:car_id])
    @repair = Repair.find(params[:id])
  end

  def new
    @car = Car.find(params[:car_id])
    @repair = Repair.new
    @issue = Issue.find(params[:issue_id])
  end 

  def create
    @repair = Repair.new(repair_params)
    @car = Car.find(params[:car_id])
    @issue = Issue.find(params[:issue_id])
    if @repair.save
      redirect_to car_issue_path(@car, @issue)
    else
      @errors = @repair.errors.full_messages
      render 'new'
    end
  end

	def update
		@issue = Issue.find(params[:issue_id])
		@car = Car.find(params[:car_id])
    @repair = Repair.find(params[:id])
		if @repair.update(repair_params)
			redirect_to car_issues_path(@car)
		else
			@errors = @issue.errors.full_messages
			render 'edit'
		end
	end

	def destroy 
		@issue = Issue.find(params[:issue_id])
		@car = Car.find(params[:car_id])
		@repair = Repair.find(params[:repair])
		@repair.destroy
		redirect_to car_issue_path(@car, @issue)
	end 

private 
  def repair_params
    params.require(:repair).permit(:title, :description, :mileage, :date_completed, :issue_id)
  end

end
