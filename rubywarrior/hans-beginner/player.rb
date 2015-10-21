class Player
  # BUGS: Problems with rest method acting appropriately.
  MIN_HEALTH = 7

  def player_stats(warrior)
    puts "Health: #{warrior.health}"
    puts "Walking #{@direction}"
  end # player_stats end

  def play_turn(warrior)
    @health ||= warrior.health
    @direction ||= :forward
    player_stats(warrior)
    # Outer if is warrior feel. Determines empty, captive or attack.
    if warrior.feel(@direction).wall?
      @direction = :forward
    elsif warrior.feel(@direction).empty?
      # Inner loop is rest, flee, and walk conditions
      if should_flee?(warrior)
        @direction = :backward
        warrior.walk!(@direction)
      elsif need_rest?(warrior)
        warrior.rest!
      else
        warrior.walk!(@direction)
      end
    elsif warrior.feel(@direction).captive?
      warrior.rescue!(@direction)
    else
      warrior.attack!
    end
    @health = warrior.health
  end # play_turn end

  private

  def need_rest?(warrior)
    # Determines whether the player needs a rest, and takes one.
    low_health = warrior.health < 20
    not_taking_damage = !(warrior.health < @health)
    return low_health && not_taking_damage
  end #need_rest end

  def should_flee?(warrior)
    # Determines whether the warrior should run away.
    return warrior.health < MIN_HEALTH
  end
end # class end
