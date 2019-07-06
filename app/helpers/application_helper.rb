# frozen_string_literal: true

# Contains application-level helpers.
module ApplicationHelper
  def title(text)
    content_for(:title, " - #{text}")
  end
end
