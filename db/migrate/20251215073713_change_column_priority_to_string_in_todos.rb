class ChangeColumnPriorityToStringInTodos < ActiveRecord::Migration[5.1]
  def change
    change_column :todos, :priority, :string
  end
end
