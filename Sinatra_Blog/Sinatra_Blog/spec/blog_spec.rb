require_relative '../lib/blog.rb'
require_relative '../lib/post.rb'

RSpec.describe Blog do

  let (:blog) {Blog.new}
  let (:post1) {Post.new("Post Title", Time.gm(2016,04,10), "Post text: blahblahblah")}
  let (:post2) {Post.new("Post Title", Time.gm(2016,04,11), "Post text: blahblahblah")}

  describe ".add_post" do
    it "Has an empty array when initialize" do
      expect(blog.posts).to be_empty
    end

    it "Adds an element to the posts array" do
      blog.add_post(post1)
      expect(blog.posts).to include(post1)
    end
    it "Stores the post in an array of posts" do
      expect(blog.posts).to be_kind_of(Array)
    end
  end

  describe ".latest_posts" do
    it "Orders the posts in the array by date" do
      blog.add_post(post1)
      blog.add_post(post2)
      expect(blog.posts[1].date).to be >= (blog.posts[0].date)
    end
  end
end
