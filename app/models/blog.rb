class Blog < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 140 }
   validates :deadline, presence: true
  validates :status, presence: true
   scope :sort_deadline, -> { order(deadline: :desc) }

  enum status: {"Off": 0, "Pending": 1, "In motion": 2}

  scope :sort_deadline, -> { order(deadline: :desc) }
  scope :sort_create, -> { order(created_at: :desc) }
  
  scope :search_title, -> (title){ where('title LIKE ?' , "%#{title}%") }
  scope :search_status, -> (params){ where(('CAST(status AS TEXT) LIKE ?'), "%#{ params }%") }
 
end
