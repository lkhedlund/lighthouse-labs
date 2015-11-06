class Robot
  class RobotDeadError < StandardError
  end
  class CannotAttackError < StandardError
  end

  attr_reader :position, :items, :items_weight, :capacity, :health
  attr_accessor :equipped_weapon, :shields, :robot_array

  MAX_HEALTH = 100
  MAX_SHIELDS = 50
  EMPTY = 0
  MAX_WEIGHT = 250
  X = 0
  Y = 1

  @@robot_list = []

  def initialize
    @position = [0,0]
    @items = []
    @health = MAX_HEALTH
    @equipped_weapon = BasicAttack.new
    @shields = 50
    @@robot_list << self
  end

  def self.robot_instances
    @@robot_list.length
  end

  def self.in_position(x, y)
    robots_in_positon = []
    @@robot_list.each do |robot|
      if robot.position == [x,y]
        robots_in_positon << robot
      end
    end
    robots_in_positon
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

  def scan
    scan = []
    for i in (-1..1)
      for j in (-1..1)
        scan << Robot.in_position(i, j)
      end
    end
    scan.flatten!
  end

  def pick_up(item)
    if can_pick_up?(item)
      @equipped_weapon = item if item.is_a? Weapon
      if should_feed?(item)
        item.feed(self)
      else
        @items << item
      end
    end
  end

  def items_weight
    items.reduce(0) { |sum, item| sum += item.weight }
  end

  def wound(amount)
    amount_remaining = damage_shields(amount)
    if amount_remaining > @health
      @health = EMPTY
    else
      @health -= amount_remaining
    end
  end

  # should look into ways to DRY this up
  def heal(amount)
    if @health + amount > MAX_HEALTH
      @health = MAX_HEALTH
    else
      @health += amount
    end
  end

  def power(amount)
    if @shields + amount > MAX_SHIELDS
      @shields = MAX_SHIELDS
    else
      @shields += amount
    end
  end
  # DRY_END

  def heal!(amount)
    raise RobotDeadError, "The robot is already at 0 health." if health == EMPTY
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
    elsif item.is_a? Battery
      MAX_SHIELDS - shields >= item.heal_amount
    else
      false
    end
  end

  def can_pick_up?(item)
    item.weight + items_weight <= MAX_WEIGHT
  end

  def damage_shields(damage)
    if damage >= shields
      remaining_damage = damage - shields
      self.shields = EMPTY
    else
      self.shields -= damage
      remaining_damage = 0
    end
    remaining_damage
  end

end
