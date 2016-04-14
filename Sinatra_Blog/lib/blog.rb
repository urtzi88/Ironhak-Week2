class Blog
  attr_reader :posts
  def initialize
    @posts = []
  end

  def add_post(post)
    @posts << post
  end

  def latest_posts
    @posts = @posts.sort {|a,b| b.date <=> a.date}
  end
end
