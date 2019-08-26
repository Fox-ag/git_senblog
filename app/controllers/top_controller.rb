class TopController < ApplicationController
    def index
        @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
        # feed_contents = current_user.feed_contents.includes(:content)
        # @feed_contents = feed_contents.map(&:content)
    end
    
end
