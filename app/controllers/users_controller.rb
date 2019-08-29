class UsersController < ApplicationController
    
    def mypage
         @blogs = Blog.where(user_id: current_user.id)
          @journals = Journal.where(user_id: current_user.id).page(params[:page]).per(5)
         feed_contents = current_user.feed_contents.includes(:content)
        @feed_contents = feed_contents.map(&:content)
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def edit
        
    end
    
    def update
        current_user.update(update_params)
    end
    
    private
    def update_params
        params.require(:user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :image)
    end
end
