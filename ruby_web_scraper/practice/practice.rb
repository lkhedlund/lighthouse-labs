require 'rubygems'
require 'nokogiri'

PAGE_LOC = "./index.html"

page = Nokogiri::HTML(open(PAGE_LOC))

def example1(page)
  puts page.css("title")[0].name
  puts page.css("title")[0].text
end

# example1(page)

def example2(page)
  links = page.css('a')
  puts links.length
  puts links[0].text
  puts links[0]["href"]
end

# example2(page)

def example3(page)
  news_links = page.css('a').select do |link|
    link['data-category'] == "news"
  end
  news_links.each { |link| puts link['href'] }
end

# example3(page)

def example4(page)
  news_links = page.css("a[data-category=news]")
  news_links.each { |link| puts link['href'] }
end

# example4(page)

def example5(page)
  list_links = page.css("li a")
  list_links.each {|link| puts link['href']}
end

# example5(page)

def exercise1(page)
  references = page.css("div#references a")
  references.each do |link|
    puts link.text
    puts link['href']
  end
end

exercise1(page)
