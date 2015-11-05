class Robot
  class RobotDeadError < StandardError
  end
  class CannotAttackError < StandardError
  end

  attr_reader :position, :items, :items_weight, :capacity, :health
  attr_accessor :equipped_weapon

  MAX_HEALTH = 100
  MIN_HEALTH = 0

  def initialize
    @position = [0,0]
    @items = []
    @items_weight = 0
    @capacity = 250
    @health = MAX_HEALTH
    @basic_attack = 5
    @equipped_weapon = nil
  end

  def move_left
    position[0] -= 1
  end

  def move_right
    position[0] += 1
  end

  def move_up
    position[1] += 1
  end

  def move_down
    position[1] -= 1
  end

  def pick_up(item)
    unless items_weight == @capacity
      if item.is_a? Weapon
        @equipped_weapon = item
      end
      @items << item
      @items_weight += item.weight
    end
  end

  def wound(amount)
    if amount > @health
      @health = MIN_HEALTH
    else
      @health -= amount
    end
  end

  def heal(amount)
    if @health + amount > MAX_HEALTH
      @health = MAX_HEALTH
    else
      @health += amount
    end
  end

  def heal!(amount)
    raise RobotDeadError, "The robot is already at 0 health." if health == MIN_HEALTH
  end

  def attack(enemy)
    if equipped_weapon == nil
      enemy.wound(@basic_attack)
    else
      equipped_weapon.hit(enemy)
    end
  end

  def attack!(enemy)
    raise CannotAttackError, "You cannot attack a non-robot!" unless enemy.is_a? Robot
  end
end
