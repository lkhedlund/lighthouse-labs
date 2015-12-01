require_relative "math_mania"
include MathMania #want to be included before main gets run

def main
  # Class Instances
  game = Game.new
  player1 = Player.new(1)
  player2 = Player.new(2)
  # Start of main engine
  #player1.name = prompt_UI.name.....
  player1.get_name
  player2.get_name
  game.display_welcome(player1, player2)
  # Sets the current turn order
  current_player = player1
  # Start of main game loop
  continue = true
  while continue
    # go to game to get, go to UI to present
    game.display_question(current_player)
    current_player.display_score
    if current_player.game_over?
      game.final_score(player1, player2)
      continue = false
    end
    if current_player == player1
      current_player = player2
    else
      current_player = player1
    end
  end
end


# Start the game
main
