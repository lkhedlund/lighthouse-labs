class Scrape
  class ParsingError < StandardError
  end

  def initialize(site_url)
    @site_url = site_url
    @comments_list = []
  end

  # parses the website into a doc
  def doc
    begin
      doc = Nokogiri::HTML(open(@site_url))
    rescue Exception => e
      puts "Could not parse #{@site_url}"
      puts e
      exit
    end
  end

  # finds the item id
  def item_id
    doc.css(".subtext a:nth-child(3)")[0]['href']
  end

  # finds the post url
  def url
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

  # extracts the usernames of commenters
  def extract_usernames
    doc.search('.comhead > a:first-child').map do |element|
      element.inner_text
    end
  end

  # extracts the time of each comment
  def extract_times
    doc.search('.comhead > a:nth-child(2)').map do |element|
      element.inner_text
    end
  end

  # extract the comment text
  def extract_comments
    doc.search('span.c00').map do |element|
      element.inner_text
    end
  end
end
