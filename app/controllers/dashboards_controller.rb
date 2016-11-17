class DashboardsController < ApplicationController 
  
  def index
    @members = User.all
  end
end