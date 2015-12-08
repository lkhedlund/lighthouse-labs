var request = require("request");
var cheerio = require("cheerio");
var weatherStation = "IBRITISH201";
var url = "http://www.wunderground.com/personal-weather-station/dashboard?ID=" + weatherStation;

request(url, function(error, response, body) {
  if (!error) {
    var $ = cheerio.load(body);
    var temperature = $("[data-variable='temperature'] .wx-value").html();
    console.log("It's " + temperature + "*C!");
  } else {
    console.log("Error: " + error);
  }
});
