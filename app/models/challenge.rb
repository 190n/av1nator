class Challenge < ApplicationRecord
    belongs_to :user
    has_many :submissions, dependent: :destroy

    validates :title, presence: true
    validates :max_size, numericality: { only_integer: true, greater_than: 0 }
    validates :start, presence: true
    validates :deadline, presence: true
    validates :voting_deadline, presence: true
    validates :user, presence: true
    validates :deadline_after_start
    validates :voting_deadline_after_deadline

    def deadline_after_start
        if start >= deadline
            errors.add(:deadline, "must be after the start of the challenge")
        end
    end

    def voting_deadline_after_deadline
        if deadline >= voting_deadline
            errors.add(:voting_deadline, "must be after the submission deadline")

    def active?
        start < DateTime.now and DateTime.now < voting_deadline
    end
end
