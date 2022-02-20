class Picture < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: {minimum: 3}
    validates :description, presence: true, length: {minimum: 3}
    has_one_attached :image
end
