require_relative 'user_interface'
require_relative 'player'
# Encapsulates business logic of the math game.
module MathMania
  class Game

    # Initializes stuff that a Game "has"
    def initialize
      @ui = UserInterface.new
      @current_player = 0
      @players = [Player.new, Player.new]
    end

    # Begins the game.
    def run
      initialize_players
      ask_questions
      finalize_game
    end

    # Setup the players for this game
    def initialize_players

    end

    # Ask questions until game is over
    def ask_questions
      until game_over?
        ask_question
      end
    end

    # Returns whether the game is over
    def game_over?
      true
    end

    # Run the current player's turn
    def ask_question

    end

    # Any clean up before game is done.
    def finalize_game

    end
  end
end
