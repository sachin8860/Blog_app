class Blog < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    validates :image, presence: true
    has_one_attached :image
    belongs_to :category

    has_many :blog_tags,dependent: :destroy
    has_many :tags, through: :blog_tags
    # accepts_nested_attributes_for :tags
    accepts_nested_attributes_for :blog_tags, allow_destroy: true

    # added custom attribute for tag

    def tags_attributes=(tags_attributes)
        tags_attributes.values.each do |tag|
            if !tag[:name].blank?
                self.tags << Tag.find_or_create_by(name: tag[:name])
            end
        end
    end
end
