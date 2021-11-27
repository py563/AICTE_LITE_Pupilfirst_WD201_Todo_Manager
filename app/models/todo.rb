class Todo < ActiveRecord::Base
  validates :todo_text, presence: true
  validates :todo_text, length: { minimum: 3 }
  validates :due_date, presence: true
  belongs_to :user

  def is_due_today?
    due_date == Date.today
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today).order(:due_date)
  end

  def self.overdue
    where("due_date < ? and not completed", Date.today).order(:due_date)
  end

  def self.completed
    all.where(completed: true)
  end

  def self.show_list
    puts "My Todo-list\n\n"
    puts "Overdue \n"
    overdue?.map { |todo_item| puts todo_item.to_displayable_string }

    puts "\n\n"
    puts "Due Today\n"
    due_today?.map { |todo_item| puts todo_item.to_displayable_string }

    puts "\n\n"
    puts "Due Later\n"
    due_later?.map { |todo_item| puts todo_item.to_displayable_string }
  end

  def self.mark_as_complete(completed_item_id)
    Todo.update(completed_item_id, completed: true)
  end
end
