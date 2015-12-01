# Assignment Requirements:
# -For every two empty bottles, you can get one free (full) bottle of pop
# -For every four bottle caps, you can get one free (full) bottle of pop
# -Each bottle of pop costs $2 to purchase
# Given these parameters, write a program so that you can figure out how many
# total bottles of pop can be redeemed given a customer investment.
# Challenge: Write the redemption algorithm using recursion

require "./redemption_calculator"

class Main
  def run
    # variable bottles (array of bottle instances? no) Rename to something like
    # bottle_redemption...
    bottles = RedemptionCalculator.new(2)
    bottle_caps = RedemptionCalculator.new(4)
    loop do
      investment = RedemptionCalculator.get_investment
      break if investment == 0
      purchased_bottles = bottles.initial_purchase(investment)
      purchased_caps = bottle_caps.initial_purchase(investment)

      # Move comments to a method
      puts "You bought #{purchased_bottles} bottles of pop."
      puts "You will have #{purchased_bottles} empty bottles"
      puts "and #{purchased_caps} bottle caps after you are"
      puts "done enjoying our product!"
      puts ""

      free_from_bottles = bottles.redeem(purchased_bottles)
      free_from_caps = bottle_caps.redeem(purchased_caps)

      total = free_from_bottles + free_from_caps

      puts "But wait! You will receive #{total} bottles of pop for free:"
      puts "#{free_from_bottles} bottles can be redeemed from your empty bottles, and"
      puts "#{free_from_caps} bottles can be redeemed from your empty caps.\r\n"
      puts "Keep those caps and bottles, though! You have #{bottles.leftover} lefover bottles"
      puts "and #{bottle_caps.leftover} leftover caps to still be redeemed."
      puts ""
      puts "Enjoy Lighthouse Fresh!"
      puts "=========================================================="
      puts "If you keep investing, you'll keep getting free bottles!"
    end
  end
end

Main.new.run
