class SugestionsController < ApplicationController
  before_action :set_sugestion, only: [:show]
  def show
  
  end

  private
  def set_sugestion
    @user = User.find(params[:id])
  end

end
