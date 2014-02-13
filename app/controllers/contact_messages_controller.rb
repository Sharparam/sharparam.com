class ContactMessagesController < ApplicationController
    before_action :load_message, only: :create
    load_and_authorize_resource

    def create
        respond_to do |format|
            if @contact_message.deliver
                format.html { redirect_to contact_path, notice: 'Message sent successfully!' }
                format.json { head :no_content }
            else
                format.html { redirect_to contact_path, flash: {
                    error: 'Message could not be sent! Make sure you included all the required information.'
                }}
                format.json { render json: @contact_message.errors, status: :unprocessable_entity }
            end
        end
    end

    private
        def message_params
            params.require(:contact_message).permit(:name, :email, :message, :nickname)
        end

        def load_message
            @contact_message = ContactMessage.new(params[:contact_message])
        end
end
