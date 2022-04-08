class Blog < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    validates :image, presence: true
    has_one_attached :image
    belongs_to :category
end
