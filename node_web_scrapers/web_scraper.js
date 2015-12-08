var request = require("request");
var cheerio = require("cheerio");
var url = "http://substack.net/images/"

request(url, function(error, response, body) {
  if (!error) {
    var $ = cheerio.load(body);
    var rows = $('tr');
    rows.each(function(i, elem) {
      var $tds = $(this).find('td');
      var permission = $tds.eq(0).text();
      var abs_url = $tds.eq(2).find('a').attr('href');
      var file_type = $tds.eq(2).text().split('.');
      if (file_type.length > 1) {
        file_type = file_type.pop();
      } else {
        file_type = "";
      };
      csv_line = permission +','+ abs_url +','+ file_type;
      // If I was exporting to csv, I could write the line
      // above to a file.
      console.log(csv_line);
    });
  } else {
    console.log("Error: " + error);
  }
});
