class TopController < ApplicationController
    def index
        # @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
        
        @q = Blog.ransack(params[:q])
        @emotions = Emotion.all
        @themes = Theme.all
        @bloges = @q.result.includes(:emotions, :themes)
        
        # @blogs = Blog.all
        @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
    end
    
   
end
