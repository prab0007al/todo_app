class Todo < ApplicationRecord
  belongs_to :category

  enum priority: { low: 0, medium: 1, high: 2 }
  
  validates :title, presence: true
end
