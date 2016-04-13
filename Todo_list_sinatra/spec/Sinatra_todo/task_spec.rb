require_relative 'sinatra_todo.rb'

RSpec.describe Task do

  before :each do
    @task = Task.new("Walk the dog")
  end

  describe "complete?" do
    it "checks if completed" do
      expect(@task.complete?).to eq(false)
    end
  end

  describe "complete!" do
    it "modifies changes value of @complete" do
      @task.complete!
      expect(@task.complete?).to eq(true)
    end
  end

  describe "make_complete" do
    it "changes status to incomplete" do
      @task.make_incomplete!
      expect(@task.complete?).to eq(false)
    end
  end

  describe "update_content!" do
    it "updates the content of the task" do
      @task.update_content!("New task content")
      expect(@task.content).to eq("New task content")
    end
    it "returns time when update happened" do
      @task.update_content!("test")
      expect(@task.updated_at.class).to eq(Time)
    end
    it "checks updated_at is nil by default" do
      expect(@task.updated_at).to eq(nil)
    end
  end
end
