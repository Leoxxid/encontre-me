class RegistrationsController  < Devise::RegistrationsController
    def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    
      def account_update_params
        params.require(:user).permit(:first_name, :last_name, :age, :email, :password, :password_confirmation, :current_password)
    end

end
