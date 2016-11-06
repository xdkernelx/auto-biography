class RepairsController < ApplicationController

  before_action :find_car_and_issue_and_repair, only: [:edit, :update, :destroy]
  before_action :find_car_and_issue_and_new_repair, only: [:new]


  def edit
  end

  def new
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
    if @repair.update(repair_params)
	   redirect_to car_issues_path(@car)
    else
	   @errors = @issue.errors.full_messages
	   render 'edit'
    end
  end

  def destroy 
    @repair.destroy
    redirect_to car_issue_path(@car, @issue)
  end 

private 

  def repair_params
    params.require(:repair).permit(:title, :description, :mileage, :date_completed, :issue_id)
  end

  def find_car_and_issue_and_repair
    @repair = Repair.find(params[:id])
    @car = Car.find(params[:car_id])
    @issue = Issue.find(params[:issue_id])
  end 

  def find_car_and_issue_and_new_repair
    @repair = Repair.new
    @car = Car.find(params[:car_id])
    @issue = Issue.find(params[:issue_id])
  end

end
