require_relative "Task.rb"
require 'pry'

class TodoList
  attr_accessor :tasks, :user
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

  def save
    File.open("public/tasks.txt", 'w') {|file| file.truncate(0) }
    File.open("public/tasks.txt", 'a+') do |f|
      f.write("#{@user}\n")
      @tasks.each do |i|
        task_array = "#{i.id}, #{i.content}, #{i.complete}, #{i.created_at}, #{i.updated_at}\n"
        f.write(task_array)
      end
    end
  end

  def load_from_file
    text = File.open("public/tasks.txt").read
    text_array = text.split("\n")
    first_line = true
    text_array.each do |t|
      if first_line
        @user = t
        first_line = false
      else
        line_array = t.split(", ")
        task=Task.new(line_array[1])
        task.id = line_array[0].to_i
        task.re_set_current_id
        if line_array[2] == "true"
          task.complete = true
        else
          task.complete = false
        end
        task.created_at = line_array[3]
        if line_array[4] != ""
          task.updated_at = line_array[4]
        end
        self.add_task(task)
      end
    end
  end
end

#list1 = TodoList.new("Josh")
#list1.load_from_file
