class NotificationsController < ApplicationController
    def create
        
        @notifications = current_user.passive_notifications.includes(:blog)
        @notifications.where(checked: false).each do |notification|
            notification.update_attributes(checked: true)
        end
        
    end
    
    def destroy
        @notifications = current_user.passive_notifications.destroy_all
        redirect_to mypage_user_path(current_user)
    end
end
