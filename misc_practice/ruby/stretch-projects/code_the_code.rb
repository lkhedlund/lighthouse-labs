# Here are your rules:
# -Signs cost $15 per square foot.
# -If a sign has two colours or fewer, add $10 for each colour.
# -If a sign has more than two colours, add $15 for each colour.
# -Tax is 15%.
# -The boss insists that he just wants one function that he can put the dimensions and colour count in, and get the total back.

# Additional Features: Get user input for feet and number of colours, check for empty/illogical values

def calc_sqft_cost(height,width)
  cost = 15 # dollars
  (height * width) * cost
end

def calc_colour_cost(num)
  if num <= 2
    num * 10 # dollars
  else
    num * 15 # dollars
  end
end

def calc_tax(total)
  tax = 1.15 # percentage
  total * tax
end

def get_ft_and_colours
  height, width, num_colours = 0, 0, 0
  while height <= 0 || width <= 0 || num_colours <= 0
    puts "Please provide the height and width of the sign in feet."
    puts "Note: Your input must be greater than 0."
    puts "Height: "
    height = gets.chomp.to_i
    puts "Width: "
    width = gets.chomp.to_i
    puts "Now provide the number of colours you would like to use."
    num_colours = gets.chomp.to_i
  end
  # return integers or float for height, width, and colours
  return height, width, num_colours
end

def display_total
  height, width, num_colours = get_ft_and_colours
  puts "You asked for a sign wtih a height of #{height}ft, a width of #{width}ft, and with #{num_colours} colours."
  total = calc_sqft_cost(height, width)
  puts "The cost of the sign per square feet is #{total}."
  total += calc_colour_cost(num_colours)
  puts "With the colours you chose, the cost is now #{total}."
  total = calc_tax(total)
  puts "The final cost (with tax) is #{total}."
end

puts display_total
