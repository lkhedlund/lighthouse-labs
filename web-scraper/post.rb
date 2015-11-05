class Post

  def initialize(site_url)
    @site_url = site_url
    @doc = self.doc
    @comments_list = []
  end

  # returns all the comments associated with a post
  def comments
    comments_list
  end

  # adds a comment object to the comment list
  def add_comment(comment)
    comments_list << comment
  end

  # creates a parsed document from the post
  def doc
    File.open(@site_url) do
      |f| Nokogiri::HTML(f)
    end
  end

  # finds the item id
  def item_id
    doc.search('.subtext > a:nth-child(3)').map do |link|
      link['href']
    end
  end

  # finds the post url
  def post_url
    doc.css("td.title a")[0]['href']
  end

  # find the post's points
  def points
    doc.css("span.score").text
  end

  # find the post's title
  def title
    doc.css("title").text
  end
end
