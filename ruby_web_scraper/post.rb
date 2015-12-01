# Creates a post with comments

class Post

  def initialize(site_url)
    @scrape = Scrape.new(site_url)
    @title = @scrape.title
    @url = @scrape.url
    @points =  @scrape.points
    @item_id = format_id(@scrape.item_id)
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
    pull_comments
    @comments_list
  end

  private

  # Captures just the number from the ID
  def format_id(id)
    /(\d+)/.match(id)
  end

  # grabs a list of comments to add to the post
  def pull_comments
    @scrape.extract_comments.each do |comment_text|
      comment = Comment.new(comment_text)
      add_comment(comment)
    end
  end

end
