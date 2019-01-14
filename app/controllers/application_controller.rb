class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    begin
      User.where(flag: [false, ""]).find(current_user.id).blank?
      edit_user_registration_path
    rescue ActiveRecord::RecordNotFound => e
      dashboard_index_path
    end
  end
 
end
