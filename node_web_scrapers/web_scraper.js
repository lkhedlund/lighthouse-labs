

var request = require("request");
var cheerio = require("cheerio");
var url = "http://substack.net/images/"

request(url, function(error, response, body) {
  if (!error) {
    var $ = cheerio.load(body);
    var rows = $('tr').text();
    rows.split("\n").forEach(function(row) {
      console.log(row);
    });
    // console.log(rows);
  } else {
    console.log("Error: " + error);
  }
});
