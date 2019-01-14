class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if current_user.flag
      dashboard_index_path
    else
      edit_user_registration_path
    end
  end
end
