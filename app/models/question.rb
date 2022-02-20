class Question < ApplicationRecord
    has_many :answers
    belongs_to :user
    validates :title, presence: true, length: {minimum: 3}
    validates :body, presence: true, length: {minimum: 3}
end