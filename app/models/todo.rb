class Todo < ActiveRecord::Base
  def to_pleasant_string
    display_status = completed ? "[X]" : "[ ]"
    "#{id}. #{due_date.to_s(:long)} #{todo_text} #{display_status}"
  end
end
