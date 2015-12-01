require_relative 'math_mania/game'
# Main class for the MathMania game.
class MathGame
  include MathMania
  # Instantiates and runs a MathMania::Game.
  def self.start
    game = MathMania::Game.new
    game.run
  end
end

if $0 == __FILE__
  MathGame.start
end
