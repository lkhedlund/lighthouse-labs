class Robot
  class RobotDeadError < StandardError
  end
  class CannotAttackError < StandardError
  end

  attr_reader :position, :items, :items_weight, :capacity, :health
  attr_accessor :equipped_weapon

  MAX_HEALTH = 100
  MIN_HEALTH = 0
  X = 0
  Y = 1

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
    position[X] -= 1
  end

  def move_right
    position[X] += 1
  end

  def move_up
    position[Y] += 1
  end

  def move_down
    position[Y] -= 1
  end

  def pick_up(item)
    unless items_weight == @capacity
      @equipped_weapon = item if item.is_a? Weapon
      if should_feed?(item)
        item.feed(self)
      else
        @items << item
        @items_weight += item.weight
      end
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
    if in_reach?(enemy.position)
      if equipped_weapon == nil
        enemy.wound(@basic_attack)
      else
        equipped_weapon.hit(enemy)
      end
    end
  end

  def attack!(enemy)
    raise CannotAttackError, "You cannot attack a non-robot!" unless enemy.is_a? Robot
  end

  private

  def in_reach?(enemy_location)
    difference?(enemy_location, X) && difference?(enemy_location, Y)
  end

  def difference?(enemy, coor)
    (enemy[coor] - self.position[coor]).abs <= 1
  end

  def should_feed?(item)
    if item.is_a? BoxOfBolts
      MAX_HEALTH - health >= item.heal_amount
    else
      false
    end
  end
end
