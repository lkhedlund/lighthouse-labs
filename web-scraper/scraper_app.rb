require "nokogiri"
require_relative 'post'
require_relative 'comment'
require_relative 'scrape'

class ScraperApp
  def initialize(site_url)
    @scrape = Scrape.new(site_url)
    @post = Post.new(@scrape.title, @scrape.url, @scrape.points, @scrape.item_id)
  end

  def print_post
    @post.details.each do |detail|
      puts detail
    end
  end

  def print_comments
    get_comments
    @post.comments.each do |detail|
      puts detail.to_s
    end
  end

  def get_comments
    @scrape.extract_comments.each do |comment_text|
      comment = Comment.new(comment_text)
      @post.add_comment(comment)
    end
  end
end

new_app = ScraperApp.new("post.html")
new_app.print_post
new_app.print_comments
