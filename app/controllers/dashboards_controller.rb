class DashboardsController < ApplicationController 
  
  def index
    @members = User.paginate(:page => params[:page])
  end
end