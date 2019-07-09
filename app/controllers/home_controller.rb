# frozen_string_literal: true

# Controller for home pages and actions.
class HomeController < ApplicationController
  def index
    render layout: 'landing'
  end

  def about; end
end
