# http://classic.battle.net/war3/human/units/footman.shtml
require_relative 'unit'

class Footman < Unit
  def initialize
    super(60, 10)
  end

  def attack!(enemy)
    if enemy.instance_of? Barracks
      reduced_damage = (@attack_power / 2).ceil
      enemy.damage(reduced_damage)
    else
      enemy.damage(@attack_power) unless self.dead? || enemy.dead?
    end
  end
end
