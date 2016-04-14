#spec/server_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe 'Sinatra Blog' do

  describe "index" do
    it "index loads OK" do
      get('/')
      expect(last_response).to be_ok
    end
    it "creates a blog instance OK" do
      expect(@@blog).to be_instance_of(Blog)
    end
    it "creates a post instance OK" do
      expect(@@post1).to be_instance_of(Post)
    end
  end

  describe "Post" do
    it "loads OK" do
      get("/post/#{@@post1.id}")
      expect(last_response).to be_ok
    end
    it "loads the correct post" do
      get("/post/#{@@post1.id}")
      expect(last_response.body).to include("Post1")
    end
  end
end
