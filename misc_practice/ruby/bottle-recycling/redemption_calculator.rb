class RedemptionCalculator
  attr_reader :pop_cost, :required_to_redeem, :initial_bottles, :leftover

  # Base RedemptionCalculator could be more restrictive
  # closed for modification but open for extention?
  # Move these to an extendable one: initial_bottles=0, pop_cost=2, leftover=0
  def initialize(required_to_redeem)
    @pop_cost = 2
    @leftover = 0
    @initial_bottles = 0
    @required_to_redeem = required_to_redeem
  end

  #(I/O) none / integer
  #(FUNCTION) Asks the user for an initial investment and returns it.
  def self.get_investment
    puts "Please provide the amount you want to spend on pop in whole dollars."
    puts "An investment of $0 will quit the program."
    print "> "
    gets.chomp.to_i
  end

  #(I/O) none / integer
  #(FUNCTION) Returns the number of the item to be redeemed, i.e. bottles or bottle caps.
  def initial_purchase(investment)
    @initial_bottles += investment / @pop_cost
  end

  #(I/O) integer / integer
  #(FUNCTION) Method takes a number of items to be redeem (as an integer) and returns
  # the number of free bottles of pop you will receive.
  def redeem(items_to_redeem)
    if leftover >= @required_to_redeem
      items_to_redeem += leftover
      @leftover = 0
    end
    if items_to_redeem < @required_to_redeem
      # At the end of the recursion we should count the remaining as leftover
      # and return 0 so that nothing is added to our final number of redeemed bottles.
      @leftover = items_to_redeem
      return 0
    else
      # puts "Free bottles: #{n}"
      return items_to_redeem + redeem(items_redeemed(items_to_redeem) + items_leftover(items_to_redeem))
    end
  end

  private

  # in idiomatic ruby, just have the name of what's being 'got'
  def items_redeemed(item)
    item / @required_to_redeem
  end

  def items_leftover(item)
    item % @required_to_redeem
  end

end
