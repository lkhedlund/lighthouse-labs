class Robot
  class RobotDeadError < StandardError
  end
  class CannotAttackError < StandardError
  end

  attr_reader :position, :items, :items_weight, :capacity, :health
  attr_accessor :equipped_weapon

  MAX_HEALTH = 100
  MIN_HEALTH = 0
  MAX_WEIGHT = 250
  X = 0
  Y = 1

  def initialize
    @position = [0,0]
    @items = []
    @items_weight = 0
    @health = MAX_HEALTH
    @equipped_weapon = BasicAttack.new
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
    if can_pick_up?(item)
      @equipped_weapon = item if item.is_a? Weapon
      if should_feed?(item)
        item.feed(self)
      else
        @items << item
        @items_weight += item.weight
      end
    end
  end

  # def items_weight
  #   items.sum(0){ |sum, item| sum += item.weight }
  # end

  def wound(amount)
    # @health = amount > health ? 0 : health - amount
    # @health = [0, health - amount].max
    if amount > @health
      @health = MIN_HEALTH
    else
      @health -= amount
    end
  end

  def heal(amount)
    # @health = [MAX_HEALTH, health + amount].min
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
    equipped_weapon.hit(enemy) if in_range?(enemy.position)
    self.equipped_weapon = BasicAttack.new if equipped_weapon.dispense?
  end

  def attack!(enemy)
    raise CannotAttackError, "You cannot attack a non-robot!" unless enemy.is_a? Robot
  end

  private

  def in_range?(enemy_location)
    difference?(enemy_location, X) && difference?(enemy_location, Y)
  end

  def difference?(enemy, coor)
    (enemy[coor] - self.position[coor]).abs <= equipped_weapon.range
  end

  def should_feed?(item)
    if item.is_a? BoxOfBolts
      MAX_HEALTH - health >= item.heal_amount
    else
      false
    end
  end

  def can_pick_up?(item)
    item.weight + items_weight <= MAX_WEIGHT
  end
end
