# frozen_string_literal: true

# Controller for devise registration actions.
class RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    if resource.password_required?
      resource.update_with_password params
    else
      params.delete :current_password
      resource.update_without_password params
    end
  end
end
