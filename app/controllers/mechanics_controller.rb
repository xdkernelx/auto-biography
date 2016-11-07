class MechanicsController < ApplicationController
  def index
  	@mechanic = current_user
  end 
end 