class JournalsController < ApplicationController
    
    def new
    end
    
    def create
        Journal.create(journal_params)
    end
    
    private
    def journal_params
        params.permit(:user_name, :image, :text)
    end
end
