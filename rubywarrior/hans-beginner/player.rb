class Player
  def player_stats(warrior)
    puts "Health: #{warrior.health}"
  end # player_stats end

  def play_turn(warrior)
    player_stats(warrior)
    # Warrior turn code
    if warrior.feel.captive?
      warrior.rescue!
    elsif warrior.feel.enemy?
      warrior.attack!
    else
      if (warrior.health < 20) && !(warrior.health < @health)
        warrior.rest!
      elsif
        warrior.walk!
      end
    end
    @health = warrior.health
  end # play_turn end
end # class end
