// JS Betting game

var BettingGame = BettingGame || {};

// BettingGame.init = function() {};

BettingGame.run = function() {
  var bankroll = 100;
  RANDOM_CAP = 10;
  // var bet = "";

  alert("Your bankroll is " + bankroll);

  do {
    var bet = parseInt(prompt('Bet $5 or $10? '), 10);
  } while ((bet != 5) && (bet != 10));

  console.log("DEBUG:" + bet)
  var rand_num = Math.floor(Math.random() * (RANDOM_CAP + 1));
  console.log("DEBUG:" + rand_num);
  var guess = prompt("Please choose a number between 1 and 10");
  if (guess == rand_num) {
    console.log("DEBUG: guess == rand");
    bankroll += bet;
  } else {
    console.log("DEBUG: guess != rand");
    bankroll -= bet;
  };
  console.log("DEBUG:" + bankroll);

};
