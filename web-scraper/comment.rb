# Creates a comment for the post

class Comment

  def initialize(comment_text)
    # @username = username
    # @time = time
    @comment_text = comment_text
  end

  def to_s
    "#{@comment_text}"
  end

end
