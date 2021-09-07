class Submission < ApplicationRecord
    belongs_to :challenge
    belongs_to :user

    validates :title, presence: true
    validates :user, presence: true
end
