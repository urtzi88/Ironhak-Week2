class Post
  attr_reader
  @@current_id = 1
  def initialize(title, date, text, category, author)
    @title = title
    @date = date
    @text = text
    @category = category
    @author = author
    @id = @@current_id
    @@current_id += 1
  end

  def title
    @title
  end

  def date
    @date
  end

  def text
    @text
  end

  def preview
    @text.slice(0..50)
  end

  def category
    @category
  end

  def author
    @author
  end

  def id
    @id
  end
end
