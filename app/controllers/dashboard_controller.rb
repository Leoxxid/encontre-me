class DashboardController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @users = User.all
    params[:tag] ? @users = User.tagged_with(params[:tag]) : @users = User.all
    # @user_information_types_description = UserInformationType.where(user_id: current_user.id) 
    users = User.find(current_user.id)
    @users_informations = users.information_types
    @user_information_types = UserInformationType.where(user_id: current_user.id)

    @array_descricao = Array.new
    @user_information_types.each do |user_information|
      @array_descricao[user_information.information_type_id] = user_information.description
    end

  end

  def show

  end

end
