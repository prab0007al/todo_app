class Todo < ApplicationRecord
  belongs_to :category
  
  validates :title, presence: true
  validates :priority, inclusion: { in: ['low', 'medium', 'high'] }, allow_nil: true
end
