class PagesController < ApplicationController
    def index
    end

    def projects
    end

    def contact
        @contact_message = ContactMessage.new
    end

    def about
    end
end
