#Ruby Warrior Level 5 Code
class Player
  def play_turn(warrior)
    if warrior.feel.captive?
        warrior.rescue!
    elsif warrior.feel.enemy?
       warrior.attack!
    else
      if (warrior.health < 20) && !(warrior.health < @health)
        warrior.rest!
      else
        warrior.walk!
      end
    end
    @health = warrior.health
  end
end
