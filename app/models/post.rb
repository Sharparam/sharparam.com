class Post < ActiveRecord::Base
    scope :recent, order('created_at desc')

    belongs_to :user

    validates :title, presence: true, uniqueness: { case_sensitive: false }
    validates :content, presence: true

    def iso_created
        created_at.to_formatted_s(:db)
    end

    def pretty_created
        created_at.to_formatted_s(:long_ordinal)
    end

    def iso_updated
        updated_at.to_formatted_s(:db)
    end

    def pretty_updated
        updated_at.to_formatted_s(:long_ordinal)
    end

    def to_param
        "#{id}-#{title.parameterize}"
    end
end
