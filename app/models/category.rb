class Category < ApplicationRecord
  has_many :todos, dependent: :destroy
  
  validates :title, presence: true, uniqueness: true
  
  def pending_todos
    todos.where(is_completed: false)
  end
  
  def completed_todos
    todos.where(is_completed: true)
  end
end
