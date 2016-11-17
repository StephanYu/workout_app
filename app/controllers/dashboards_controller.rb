class DashboardsController < ApplicationController 
  
  def index
    @members = User.paginate(page: params[:page])
  end

  def search
    @members = User.search_by_name(params[:search_name]).paginate(page: params[:page])
  end
end