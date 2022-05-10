class PagesController < ApplicationController
    after_action :set_status

    def home
    end

    def about
    end



    private
    

    # Set user as online on home and about page
    def set_status
        current_user.update!(status: User.statuses[:offline]) if current_user
    end
end
