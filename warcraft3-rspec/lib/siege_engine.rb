class SiegeEngine < Unit

  def initialize
    super(400,50)
  end

  def attack!(enemy)
    if enemy.instance_of? Barracks
      enemy.damage(@attack_power * 2)
    end
  end

end
