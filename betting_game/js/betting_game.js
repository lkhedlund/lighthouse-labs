// JS Betting game
RANDOM_CAP = 10;
bankroll = 40

var BettingGame = BettingGame || {};

// BettingGame.init = function() {};

BettingGame.run = function() {
  BettingGame.refresh();

  // var $display_bankroll = $('#question');
  // $display_bankroll.append("BANKROLL " + bankroll);
  var start_screen = $('<img src="images/title.png" style="width: 100%;">');
  $("#cartridge").append(start_screen);
  var button = $('<div id="start">START</div>');
  $(".navigate-panel").append(button);
};

BettingGame.start_game = function() {
  var computer = $('<div class="top-l"></div>'),
    actions = $('<div class="top-r"></div>'),
    betting = $('<div class="bottom-r"></div>'),
    options = $('<div class="bottom-l"></div>'),
    new_screen = $("<div id='cartridge'></div>");
  $('#cartridge').fadeOut('slow', function() {
    $(this).replaceWith(new_screen);
    $('#cartridge').fadeIn("slow");
  });
};

BettingGame.refresh = function() {
  $('#question').html('');
};

BettingGame.place_bet = function(id_val) {
  var $submit = $('#submit');

  if (id_val == 'submit') {
    do {
      var bet = parseInt(prompt('Bet $5 or $10? '), 10);
    } while ((bet != 5) && (bet != 10));

    var rand_num = Math.floor(Math.random() * (RANDOM_CAP + 1));
    console.log("DEBUG:" + rand_num);
    var guess = prompt("Please choose a number between 1 and 10");
    if (guess == rand_num) {
      bankroll += bet;
    } else {
      bankroll -= bet;
    };
    BettingGame.run();
  };

};
