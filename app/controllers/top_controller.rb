class TopController < ApplicationController
    def index
        @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
    end
end
