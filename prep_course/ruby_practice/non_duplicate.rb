def non_duplicated_values(values)
  temp_array = []
  values.each do |value|
    if values.count(value) == 1
      temp_array.push(value)
    end
  end
  return temp_array
end

test_values = [1,2,3,3,3,4,5,5,5,6,6,7]

puts "Original Values: #{test_values}"
puts "New Values: #{non_duplicated_values(test_values)}"
