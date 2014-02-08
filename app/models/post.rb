class Post < ActiveRecord::Base
    scope :recent, order('created_at desc')

    belongs_to :user

    validates :title, presence: true, uniqueness: { case_sensitive: false }
    validates :content, presence: true
end
