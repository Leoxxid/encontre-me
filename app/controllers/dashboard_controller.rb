class DashboardController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @users = User.all
    params[:tag] ? @users = User.tagged_with(params[:tag]) : @users = User.all
    @user_information_types = UserInformationType.where(user_id: current_user.id) 
  end

  def show

  end

end
