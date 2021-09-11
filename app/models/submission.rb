class Submission < ApplicationRecord
    belongs_to :challenge
    belongs_to :user

    validates :title, presence: true
    validates :user, presence: true

    has_one_attached :file
end
