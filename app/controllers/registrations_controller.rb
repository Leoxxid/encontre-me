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
        @param = params.require(:user)

        #deletando as informations antigas
        UserInformationType.where(user_id: current_user.id).destroy_all
        # user_types = UserInformationType.where(user_id: current_user.id)
        # user_types.each do |user_type|
        #   UserInformationType.destroy(user_type.id)
        # end
        
        # user_types = User.find(current_user.id)
        # user_types.information_types_id.destroy_all

        # if @param["user_information_types_attributes"].blank?
        #   puts "sem dados"
        # end

        # if @param[:current_password].blank?
        #   user_pass = User.find(current_user.id)
        #   puts user_pass.current_password
        #   params[:current_password] = user_pass.current_password
        # end

        begin
            if !@param[:first_name].blank? && !@param[:last_name].blank? && !@param[:description].blank? && !@param[:age].blank? && !@param[:email].blank?
              puts "pass"     
              @param["user_information_types_attributes"].each do |user_informations|
                  user_informations.each do |user_information|
                      # puts user_information["information_type_id"]
                      if user_information["information_type_id"] && !user_information["description"].blank?
                          # puts "pass type"
                          User.find(current_user.id).update_columns(flag: true)
                      else
                          # puts "error"                            
                          User.find(current_user.id).update_columns(flag: false) 
                      end
                  end        
              end
            else
              # puts "error"                            
              User.find(current_user.id).update_columns(flag: false) 
          end
         
          params.require(:user).permit(:first_name, :last_name, :description, :age, :email, :password, :password_confirmation, :current_password, :avatar, :tag_list, :tag, { tag_ids: [] }, :tag_ids,
            user_information_types_attributes: [:user_id, :information_type_id, :description])
        rescue
          puts "Informe os dados!"
        end
    end


    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:edit, keys: [:first_name, :last_name, :description, :age, :email, :password, :password_confirmation, :current_password, :avatar, :tag_list, :tag, { tag_ids: [] }, :tag_ids,
            user_information_types_attributes: [:user_id, :information_type_id, :description, :_destroy]])
    end

end
