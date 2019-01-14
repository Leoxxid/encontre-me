class UsersController < ApplicationController
  def update_user_informations
    respond_to do |format|
      if current_user.update(user_params)
        current_user.update(flag: true)
        format.html { redirect_to dashboard_index_path,
                      notice: 'Informações atualizadas.' }
      else
        format.html { edit_user_registration_path }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :description, :age,
      :avatar, :tag_list, :tag, { tag_ids: [] }, :tag_ids,
      user_information_types_attributes: [
        :user_id, :information_type_id, :description, :_destroy
      ]
    )
  end
end
