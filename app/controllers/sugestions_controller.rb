class SugestionsController < ApplicationController
  before_action :set_sugestion, only: [:show]
  def show
  
  end

  private
  def set_sugestion
    @user = User.find(params[:id])
    @users_informations = @user.information_types
    @user_information_types = UserInformationType.where(user_id: current_user.id)
    @array_descricao = Array.new
    @user_information_types.each do |user_information|
      @array_descricao[user_information.information_type_id] = user_information.description
    end
  end

end
