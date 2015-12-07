var FindFiles = require('./06_filtered_module.js')

FILE_PATH = process.argv[2];
EXT = process.argv[3];

FindFiles(FILE_PATH, EXT, function(err, array) {
  for (i = 0; i < array.length; i++) {
    console.log(array[i]);
  };
});

// provided solution
var filterFn = require('./solution_filter.js')
  var dir = process.argv[2]
  var filterStr = process.argv[3]
  filterFn(dir, filterStr, function (err, list) {
    if (err)
      return console.error('There was an error:', err)
    list.forEach(function (file) {
      console.log(file)
    })
  })
