// JS Betting game
RANDOM_CAP = 10;
bankroll = 40

var BettingGame = BettingGame || {};

// BettingGame.init = function() {};

BettingGame.run = function() {
  do {
    BettingGame.process_bet();
    var quit = prompt("Would you like to quit? (Yn)")
  } while (bankroll >= 5 && quit != "Y");
};

BettingGame.process_bet = function() {
  alert("Your bankroll is " + bankroll);
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
};
