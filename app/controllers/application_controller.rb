class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  
  private
    #sign in後のredirect先変更
    def after_sign_in_path_for(resource)
      user_path(resource)
    end

    #sign out後のredirect先変更
    def after_sign_out_path_for(resource)
      root_path
    end

    #sin up時の登録情報追加
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end


    def correct_user?(user)
      if current_user.nil?
        return false
      else
        user.id.equal?(current_user.id)
      end
    end

  
    def accepted_user?(user)
      if user.locked
        if current_user.id == user.id || !Relationship.find_by(follower_id: current_user.id,followed_id:user.id,accepted: true).blank?
          @accepted = true
        else
          @accepted = false
        end
      else
        @accepted = true
      end
      # binding.pry
    end

end
