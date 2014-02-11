class Category < ActiveRecord::Base
    has_many :categorizations
    has_many :posts, through: :categorizations

    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :html_class, presence: true

    def to_param
        "#{id}-#{name.parameterize}"
    end
end
