module.exports = function(filePath, ext, callback) {
  var fs = require('fs');
  var path = require('path');

  fs.readdir(String(filePath), function (err, dirContents) {
    if (err){
      return callback(err);
    };
    var filteredFiles = [];
    for (i = 0; i < dirContents.length; i++) {
      if (path.extname(dirContents[i]) === "." + ext){
        filteredFiles.push(dirContents[i]);
      };
    };
    callback(null, filteredFiles);
  });
};

// provided solution
var fs = require('fs')
   var path = require('path')
   module.exports = function (dir, filterStr, callback) {
     fs.readdir(dir, function (err, list) {
       if (err)
         return callback(err)

       list = list.filter(function (file) {
         return path.extname(file) === '.' + filterStr
       })

       callback(null, list)
     })
   }
