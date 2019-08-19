# frozen_string_literal: true

# Controller for users.
class UsersController < ApplicationController
  # before_action :load_user, only: :create
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = @users.page(params[:page]).per(50)
  end

  # GET /users/1
  # GET /users/1.json
  def show; end
end
