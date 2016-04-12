require_relative 'todo_list.rb'
require 'pry'

RSpec.describe Task do

  before :each do
    @todo = TodoList.new("user")
  end

  describe "add_task" do
    it "should add the task to Tasks" do
      @todo.add_task(task1 = Task.new("test"))
      expect(@todo.tasks).to eq([task1])
    end

    it "should not add something that's not a task to the aray" do
      @todo.add_task("a")
      expect(@todo.tasks).to eq([])
    end
  end

  context "delete_task" do
    before do
      @todo = TodoList.new("user")
      @task1 = Task.new("Walk the dog")
      @todo.add_task(@task1)
    end

    it "should delete a task by its id" do
      @todo.delete_task(@task1.id)
      #binding.pry
      expect(@todo.tasks.find_index{|i| i.id == @task1.id}).to eq(nil)
    end

    it "should return false if id is not an integer" do
      expect(@todo.delete_task("a")).to eq(false)
    end
  end

  describe "find_task_by_id" do
    before do
      @todo = TodoList.new("user")
      @task1 = Task.new("Walk the dog")
      @todo.add_task(@task1)
    end

    it "should retrieve an specific task by its ID" do
      expect(@todo.find_task_by_id(@task1.id)).to eq(@task1)
    end

    it "returns nil if id doesnt exist" do
      expect(@todo.find_task_by_id(99)).to eq(nil)
    end
  end

  describe "sort_by_created" do
    before do
      @todo = TodoList.new("user")
      @task1 = Task.new("Walk the dog")
      @task2 = Task.new("Buy milk")
      @task3 = Task.new("Fuck off")
      @todo.add_task(@task3)
      @todo.add_task(@task2)
      @todo.add_task(@task1)
    end

    it "should sort ASC elemenet in @todo.tasks by created date" do
      @todo.sort_by_created("ASC")
      expect(@todo.tasks[0].created_at < @todo.tasks[1].created_at).to eq(true)
    end

    it "Should sort DESC element in @todo.tasks by created date" do
      @todo.sort_by_created("DESC")
      expect(@todo.tasks[1].created_at < @todo.tasks[0].created_at).to eq(true)
    end

    it "should return false if wrong parameter" do
      expect(@todo.sort_by_created("LOL")).to eq(false)
    end
  end

  describe "save" do
    before do
      @todo = TodoList.new("Josh")
      @task1 = Task.new("Walk the dog")
      @task2 = Task.new("Buy milk")
      @task3 = Task.new("Fuck off")
      @todo.add_task(@task3)
      @todo.add_task(@task2)
      @todo.add_task(@task1)
    end

    it "should write on a text file" do
      @todo.save
      expect(IO.read("tasks.txt")).to_not eq(nil)
    end
  end

  describe "load_from_file" do
    before do
      @todo = TodoList.new("Josh")
      @task1 = Task.new("Walk the dog")
      @task2 = Task.new("Buy milk")
      @task3 = Task.new("Fuck off")
      @todo.add_task(@task3)
      @todo.add_task(@task2)
      @todo.add_task(@task1)
      @todo.save
    end

    it "should read the name josh" do
      @todo.load_from_file
      expect(@todo.user).to eq("Josh")
    end
  end
end
