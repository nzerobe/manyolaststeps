class Blog < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 140 }
   validates :deadline, presence: true
   scope :sort_deadline, -> { order(deadline: :desc) }
end
