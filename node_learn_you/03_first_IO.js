var file_system = require('fs');

FILE_PATH = process.argv[2];

var file_text = file_system.readFileSync(FILE_PATH);
var new_lines = String(file_text).split('\n');

console.log(new_lines.length - 1);

// provided solution
// var fs = require('fs')
// var contents = fs.readFileSync(process.argv[2])
// var lines = contents.toString().split('\n').length - 1
// console.log(lines)

 // note you can avoid the .toString() by passing 'utf8' as the
 // second argument to readFileSync, then you'll get a String!
 //
 // fs.readFileSync(process.argv[2], 'utf8').split('\n').length - 1
