# frozen_string_literal: true

# Base record class for the application.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
