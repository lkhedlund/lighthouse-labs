class Calculator
  def add(a ,b)
    return a + b
  end

  def subtract(a,b)
    return a - b
  end
end

# class test
calc = Calculator.new
puts calc.add(4,5) # output should be 9
puts calc.subtract(4,5) # output should be -1
