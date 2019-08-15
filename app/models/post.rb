# frozen_string_literal: true

# The Post model.
class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  scope :recent, -> { order('created_at desc') }

  def draft?
    draft
  end

  def updated?
    updated_at - created_at > 0
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
