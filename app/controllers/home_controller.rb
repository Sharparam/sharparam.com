# frozen_string_literal: true

require 'date'

# Controller for home pages and actions.
class HomeController < ApplicationController
  def index
    birthday = Time.utc 1995, 4, 9
    now = Time.now.utc
    diff = now - birthday
    @age = (diff / 60 / 60 / 24 / 365.25).floor
    render layout: 'landing'
  end

  def about; end
end
