class Post < ActiveRecord::Base
    scope :recent, -> { order('created_at desc') }

    belongs_to :user

    validates :title, presence: true, uniqueness: { case_sensitive: false }
    validates :content, presence: true

    def self.from_year(year)
        recent.where("created_at >= ? AND created_at <= ?", "#{year}-01-01", "#{year}-12-31")
    end

    def self.from_archive(year, month)
        recent.where("created_at >= :start_date AND created_at <= :end_date",
            { start_date: "#{year}-#{month}-01", end_date: "#{year}-#{month}-31" })
    end

    def updated
        updated_at - created_at > 0
    end

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
