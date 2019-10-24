class Blog < ApplicationRecord
 
  has_many :blogs
  paginates_per 7
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 140 }
   validates :deadline, presence: true
  validates :status, presence: true
   scope :sort_deadline, -> { order(deadline: :desc) }

#   enum status: {"Off": 0, "Pending": 1, "In motion": 2}
  enum priority:{"Low": 0, "Medium": 1, "High": 2}

  scope :sort_deadline, -> { order(deadline: :desc) }
  scope :sort_create, -> { order(created_at: :desc) }
  scope :sort_deadline, -> { order(deadline: :desc) }
  scope :sort_create, -> { order(created_at: :desc) }
  scope :sort_priority, -> { order(priority: :asc) }
  scope :search_title, -> (title){where('title Like ?',"%#{title}%")}
  scope :search_status, -> (status){where('status = ?',status)}
#   scope :search_all,-> (title,status){where('title Like ? and status = ?',"%#{title}%",status)}

end


 

