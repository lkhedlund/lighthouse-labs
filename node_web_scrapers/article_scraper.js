var request = require("request");
var cheerio = require("cheerio");
// to pull opengraph properties look for the following tags
// <meta> tag containing og:title, og:type, og:image, og:url
// for example: <meta property="og:title" content="The Rock" />

// start with pulling title
var url = process.argv[2];
console.log(url);
request(url, function(error, response, body) {
  if (!error) {
    var $ = cheerio.load(body);
    var $html = $('html')
    var title = $html.find('title').text();
    var description = $html.find('p');
    console.log(title);
    for (var i = 0; i < description.length; i++) {
      console.log(description[i]);
      // if (description[i] > 100) {
      //   description = description[i];
      //   break;
      // }
    }
    console.log(description[2]);
  } else {
    console.log("Error: " + error);
  }
});
