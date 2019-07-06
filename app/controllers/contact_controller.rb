# frozen_string_literal: true

# Controller for contact pages and actions.
class ContactController < ApplicationController
  before_action :load_message, only: :create

  def index
    @contact_message = ContactMessage.new
  end

  def create
    respond_to do |format|
      if @contact_message.valid?
        @contact_message.to_mail.deliver_later
        format.html { redirect_to contact_path, notice: 'Message sent!' }
        format.json { head :no_content }
      else
        format.html { render action: 'index' }
        format.json do
          render json: @contact_message.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def message_params
    params.require(:contact_message).permit(:name, :email, :body)
  end

  def load_message
    @contact_message = ContactMessage.new message_params
  end
end
