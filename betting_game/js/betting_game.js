// JS Betting game
RANDOM_CAP = 10;
bankroll = 40
bet = 0

var BettingGame = BettingGame || {};

BettingGame.run = function() {
  var start_screen = $('<img src="images/title.png" style="width: 100%;">');
  $("#cartridge").append(start_screen);
  var button = $('<div id="start">START</div>');
  $(".navigate-panel").append(button);
};

BettingGame.start_game = function() {
  var computer = $('<div class="top-l">COMP:</div>'),
    actions = $('<div class="top-r">\
      <div id="increase">BET+</div>\
      <div id="decrease">BET-</div>\
      </div>'),
    betting = $('<div class="bottom-l"><p id="start">RED GOD</p></div>'),
    options = $('<div class="bottom-r">\
      <br><div id="quit">QUIT</div>\
      </div>'),
    new_screen = $("<div id='cartridge'></div>");
  $('#start').fadeOut('slow');
  $('#cartridge').fadeOut('slow', function() {
    $(this).replaceWith(new_screen);
    $('#cartridge').fadeIn("fast");
    $('#cartridge').append(computer, actions, betting, options);
    $('.bottom-l').prepend("<p>MONEY: $" + bankroll + "</p>");
    $('.bottom-r').prepend("<p>BET: $" + bet + "</p>");
  });
};

BettingGame.place_bet = function() {
};

BettingGame.check_answer = function() {
    var rand_num = Math.floor(Math.random() * (RANDOM_CAP + 1));
    console.log("DEBUG:" + rand_num);
    var guess = prompt("Please choose a number between 1 and 10");
    if (guess == rand_num) {
      bankroll += bet;
    } else {
      bankroll -= bet;
    };
    BettingGame.run();
}
