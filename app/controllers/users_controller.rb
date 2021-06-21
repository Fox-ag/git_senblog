class UsersController < ApplicationController
    before_action :move_to_index
    def mypage
        @blogs = Blog.where(user_id: current_user.id).page(params[:page]).per(5)
        @journals = Journal.where(user_id: current_user.id).page(params[:page]).per(5)
        # feed_contents = current_user.feed_contents.includes(:content)
        # @feed_contents = feed_contents.map(&:content)
        
        @feed_contents = current_user.feed_contents.includes(:content).page(params[:page]).per(5)
        @feed_contents_resource = @feed_contents.map(&:content)
            
        return redirect_to :root if @feed_contents.nil?
    end
    
    
    
    def show
        @user = User.find(params[:id])
    end
    
    def edit
        # 付けてテスト中。もともと空欄
        # @user = User.find(params[:id]) 
    end
    
    def update
        current_user.update(update_params)
    end
    
    def move_to_index
       redirect_to  '/' unless user_signed_in?
    end
    
    private
    def update_params
        params.require(:user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :image, :nickname, :sex, :occupation, :country, :prefecture, :city, :selfanalysis, :selfintroduction, :birth_date, :extraversion, :agreeableness, :openness, :conscientiousness, :neuroticism)
    end
end
