require 'nokogiri'
require 'open-uri'
require 'colorize'
require_relative 'post'
require_relative 'comment'
require_relative 'scrape'

class ScraperApp

  def initialize
    @site_url = get_url
  end

  def run
    @scrape = Scrape.new(@site_url)
    @post = Post.new(@scrape.title, @scrape.url, @scrape.points, @scrape.item_id)
    print_post
    print_comments
  end

  def print_post
    @post.details.each do |detail|
      puts detail
    end
  end

  def print_comments
    get_comments
    puts "Number of comments: #{@post.comments.length}"
    puts "==============Comments==============".colorize(:light_yellow)
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

  def get_url
    begin
      raise ArgumentError, "No URL given" unless ARGV.length == 1
      @site_url = ARGV[0]
    rescue ArgumentError => e
      puts e
      help
      exit
    end
  end

  def help
    puts "Please call the app while passing the url as an argument, like so:"
    puts "ruby scraper_app.rb https://website.com".colorize(:cyan)
  end

end

new_app = ScraperApp.new
new_app.run
