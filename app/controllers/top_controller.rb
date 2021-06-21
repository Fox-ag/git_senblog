class TopController < ApplicationController
    before_action :move_to_index, except: :index
    
    def index
        # @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
        #↓Blogの複数ワード検索フォームの作成を試みたが無理↓
    #   if params[:q]!=nil
    #     params[:q]['text_or_title_cont_all']=params[:q]['text_or_title_cont_all'].split(/[\p{blank}\s]+/)
    #     @q = Blog.ransack(params[:q])  #params[:q]には検索パラメータが渡される。そして@qという検索オブジェクトが作成される。
    #     @emotions = Emotion.all
    #     @themes = Theme.all
    #     # @user=User.all #userテーブルの情報を拾うときに必要かと思われたが、いらないみたい。
    #     @bloges = @q.result.includes(:emotions, :themes)  #検索結果が得られる。
    #     # @blogs = Blog.all
    #   else
    #     @q = Blog.ransack(params[:q])  #params[:q]には検索パラメータが渡される。そして@qという検索オブジェクトが作成される。
    #     @emotions = Emotion.all
    #     @themes = Theme.all
    #     # @user=User.all #userテーブルの情報を拾うときに必要かと思われたが、いらないみたい。
    #     @bloges = @q.result.includes(:emotions, :themes)  #検索結果が得られる。
    #     # @blogs = Blog.all
    #   end
    
    #Blogの検索フォームの作成
      @q = Blog.ransack(params[:q])  #params[:q]には検索パラメータが渡される。そして@qという検索オブジェクトが作成される。
      @emotions = Emotion.all
      @themes = Theme.all
        # @user=User.all #userテーブルの情報を拾うときに必要かと思われたが、いらないみたい。
      @bloges = @q.result.includes(:emotions, :themes)  #検索結果が得られる。
      @blogs = Blog.published.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    end
    
    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
    
end
