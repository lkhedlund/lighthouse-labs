var fs = require('fs');

FILE_PATH = process.argv[2];

function countNewlines(callback) {
  fs.readFile(FILE_PATH, function doneReading(err, fileContents) {
    newlines = String(fileContents).split('\n').length - 1;
    callback();
  });
}

function logNewlines() {
  console.log(newlines);
}

countNewlines(logNewlines);

// provided answer
var fs = require('fs')
var file = process.argv[2]

fs.readFile(file, function (err, contents) {
  // fs.readFile(file, 'utf8', callback) can also be used
  var lines = contents.toString().split('\n').length - 1
  console.log(lines)
})
