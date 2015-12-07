var fs = require('fs');
var path = require('path');
FILE_PATH = process.argv[2];
var ext = ("." + process.argv[3]);

fs.readdir(FILE_PATH, function (err, dirContents) {
  for (i = 0; i < dirContents.length; i++) {
    if (path.extname(dirContents[i]) == ext){
      console.log(dirContents[i]);
    }
  }
})

//provided solution
// var fs = require('fs')
// var path = require('path')
// fs.readdir(process.argv[2], function (err, list) {
//  list.forEach(function (file) {
//    if (path.extname(file) === '.' + process.argv[3])
//      console.log(file)
//  })
// })
