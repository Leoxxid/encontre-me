class CombinationsController < ApplicationController
  def index
    @users = User.all
  end
end
