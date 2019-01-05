class RegistrationsController  < Devise::RegistrationsController
    before_action :configure_permitted_parameters, only: [:edit]
    
    def edit
        params[:tag] ? @users = User.tagged_with(params[:tag]) : @users = User.all
        @user = User.find(current_user.id)
        @information_types = InformationType.all
    end


    def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
    end
    
    def account_update_params
        @user_id = current_user.id
        UserInformationType.where(user_id: current_user.id).destroy_all

        puts params
        params.require(:user).permit(:first_name, :last_name, :description, :age, :email, :password, :password_confirmation, :current_password, :avatar, :tag_list, :tag, { tag_ids: [] }, :tag_ids,
        user_information_types_attributes: [:user_id, :information_type_id, :description, :_destroy])
    end


    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:edit, keys: [:first_name, :last_name, :description, :age, :email, :password, :password_confirmation, :current_password, :avatar, :tag_list, :tag, { tag_ids: [] }, :tag_ids,
            user_information_types_attributes: [:user_id, :information_type_id, :description, :_destroy]])
    end

end
