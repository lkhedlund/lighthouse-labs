# Creates a post with comments

class Post

  def initialize(title, url, points, item_id)
    @title = title
    @url = url
    @points = points
    @item_id = format_id(item_id)
    @comments_list = []
  end

  # returns the post's details as an array
  def details
    ["Post title: #{@title}".colorize(:yellow),
      "URL:  #{@url}".colorize(:red),
      "Points: #{@points}".colorize(:blue),
      "ID: #{@item_id}".colorize(:green)]
  end

  # adds a comment object to the comment list
  def add_comment(comment)
    @comments_list << comment
  end

  # returns all the comments associated with a post
  def comments
    @comments_list
  end

  # Captures just the number from the ID
  def format_id(id)
    /(\d+)/.match(id)
  end

end
