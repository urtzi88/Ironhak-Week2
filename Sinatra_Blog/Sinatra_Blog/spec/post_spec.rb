require_relative '../lib/post.rb'

RSpec.describe Post do

  let (:post) {Post.new("Post Title", Time.gm(2016,04,10), "Lorem fistrum no puedor amatomaa llevame al sircoo ese pedazo de ese hombree pecador.", "Category", "Author")}

  it "Creates a correct instance" do
    expect(post).to be_instance_of(Post)
  end

  it "calculates the @@current_id correctly" do
    expect(Post.new("a",Time.gm(2016,04,10),"b","c","d").id).to eq(2)
  end

  it "returns the title" do
    expect(post.title).to eq("Post Title")
  end

  it "returns the text" do
    expect(post.text).to eq("Lorem fistrum no puedor amatomaa llevame al sircoo ese pedazo de ese hombree pecador.")
  end

  it "returns the first 100 chars of the text" do
    expect(post.preview).to eq("Lorem fistrum no puedor amatomaa llevame al sircoo ")
  end

  it "returns the date" do
    expect(post.date).to eq(Time.gm(2016,04,10))
  end

  it "returns the category" do
    expect(post.category).to eq("Category")
  end

  it "returns the author" do
    expect(post.author).to eq("Author")
  end
end
