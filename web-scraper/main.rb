require 'nokogiri'
require 'open-uri'
require 'colorize'
require_relative 'post'
require_relative 'comment'
require_relative 'scrape'

class Main

  def initialize
    @site_url = parse_argv
  end

  def run
    @post = Post.new(@site_url)
    print_post
    print_comments
  end

  private

  def print_post
    @post.details.each do |detail|
      puts detail
    end
  end

  def print_comments
    puts "Number of comments: #{@post.comments.length}"
    puts "==============Comments==============".colorize(:light_yellow)
    @post.comments.each do |detail|
      puts detail.to_s
    end
  end

  def parse_argv
    begin
      raise ArgumentError, "Incorrect Number of Arguments" unless ARGV.length == 1
      @site_url = ARGV[0]
    rescue ArgumentError => e
      puts e
      help
      exit
    end
  end

  def help
    puts "Please call the app while passing the url as an argument, like so:"
    puts "ruby main.rb https://website.com".colorize(:cyan)
  end

end

new_app = Main.new
new_app.run
