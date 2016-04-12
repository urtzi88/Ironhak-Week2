require_relative "task.rb"

class TodoList
  attr_accessor :tasks
  def initialize(user)
    @user = user
    @tasks = []
  end

  def add_task (input_task)
    if input_task.class == Task
      @tasks << input_task
    end
  end

  def delete_task (input_id)
    if input_id.is_a?(Integer)
      @tasks.delete_if{|x| x.id == input_id}
    else
      false
    end
  end
  def find_task_by_id (input_id)
    @tasks.find {|x| x.id == input_id}
  end

  def sort_by_created(ord)
    if ord == "ASC"
      @tasks.sort! { | task1, task2 | task1.created_at <=> task2.created_at }
    elsif ord == "DESC"
      @tasks.sort! { | task1, task2 | task2.created_at <=> task1.created_at }
    else
      false
    end
  end
end
