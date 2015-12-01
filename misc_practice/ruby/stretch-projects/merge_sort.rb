test_array = [0, 1, 2, 3]
puts test_array.length

test_array.each_slice(1).to_a
puts test_array.length
# Outer loop checks
for i in (0..test_array.length)
  puts test_array[i]
end
