require "nokogiri"
require_relative 'post'
require_relative 'comment'

class ScraperApp
  def initialize(site_url)
    @post = Post.new(site_url)
  end

  def print_details
    puts @post.title
    puts @post.item_id
    puts @post.post_url
    puts @post.points
  end
end

scraper = ScraperApp.new("post.html")
scraper.print_details
