// JS Betting game
RANDOM_CAP = 10;
bankroll = 40

var BettingGame = BettingGame || {};

// BettingGame.init = function() {};

BettingGame.run = function() {
  BettingGame.refresh();

  var $display_bankroll = $('#question');
  $display_bankroll.append("Your current bankroll is " + bankroll);
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
