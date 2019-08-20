class JournalsController < ApplicationController
    
    def new
    end
    
    def create
        Journal.create(user_name: journal_params[:user_name], image: journal_params[:image], text: journal_params[:text], user_id: current_user.id)
    end
    
    def destroy
       journal = Journal.find(params[:id])
       if journal.user_id == current_user.id
           journal.destroy
       end
    end
    
    private
    def journal_params
        params.permit(:user_name, :image, :text)
    end
end
