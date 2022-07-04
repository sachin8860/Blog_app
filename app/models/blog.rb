class Blog < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    validates :image, presence: true
    has_one_attached :image
    belongs_to :category

    has_many :blog_tags
    has_many :tags, through: :blog_tags

    accepts_nested_attributes_for :tags
end
