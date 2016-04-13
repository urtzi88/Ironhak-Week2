require 'sinatra'
require 'sinatra/reloader' if development?
require_relative('lib/Task.rb')
require_relative('lib/TodoList.rb')
require "pry"

@@todo_list = TodoList.new("Josh")
@@todo_list.load_from_file
@@todo_list.sort_by_created("ASC")

get '/tasks' do
  haml(:tasks)
end

post '/add' do
  task = Task.new(params[:content])
  @@todo_list.add_task(task)
  @@todo_list.save
  redirect to('/tasks')
end

post '/action' do
  keys = params.keys
  if keys[-1] == "complete"
    keys.each do |i|
      if @@todo_list.find_task_by_id(i.to_i)
        @@todo_list.find_task_by_id(i.to_i).complete!
        @@todo_list.save
      end
    end
  elsif keys[-1] == "uncomplete"
    keys.each do |i|
      if @@todo_list.find_task_by_id(i.to_i)
        @@todo_list.find_task_by_id(i.to_i).make_incomplete!
        @@todo_list.save
      end
    end
  elsif keys[-1] == "delete"
    keys.each do |i|
      if @@todo_list.delete_task(i.to_i)
        @@todo_list.save
      end
    end
  end
  redirect to('/tasks')
end
