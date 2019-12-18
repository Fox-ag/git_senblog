class TopController < ApplicationController
    def index
        # @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
        @q = Blog.ransack(params[:q])
        @emotions = Emotion.all
        @bloges = @q.result.includes(:emotions)
        
        @blogs = Blog.all
    end
    
   
end
