var sum = 0
process.argv.forEach(function(val, index, array) {
  if (index > 1) {
    sum += Number(val);
  };
  return sum;
});

console.log(sum);

// provided solution

var result = 0
for (var i = 2; i < process.argv.length; i++)
  result += Number(process.argv[i])
console.log(result)
