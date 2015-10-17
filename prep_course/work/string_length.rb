def length_finder(input_array)
  return input_array.collect {|x| x.length}
end

test_array = ["testing","the","code"] #7,3,4

puts length_finder(test_array)
