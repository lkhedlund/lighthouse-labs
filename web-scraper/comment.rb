# Creates a comment for the post

class Comment

  def initialize(comment_text)
    # @username = username
    # @time = time
    @comment_text = comment_text
  end

  # Converts the comment text to a string
  def to_s
    "#{@comment_text}".colorize(:light_yellow)
  end

end
