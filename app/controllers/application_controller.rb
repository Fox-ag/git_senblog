class ApplicationController < ActionController::Base
    
        def after_inactive_sign_up_path_for(resource)
            new_user_session_path(resource)
        end
    
        # before_action :authenticate_user!, except: [:index]#ログインしていない場合、ログインページにリダイレクト
end
