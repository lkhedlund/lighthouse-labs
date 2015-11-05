# Creates a post with comments

class Post

  def initialize(title, url, points, item_id)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @comments_list = []
  end

  # returns the post's details as an array
  def details
    [@title, @url, @points, @item_id]
  end

  # adds a comment object to the comment list
  def add_comment(comment)
    @comments_list << comment
  end

  # returns all the comments associated with a post
  def comments
    @comments_list
  end

end
