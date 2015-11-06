class Grenade < Weapon
  attr_reader :range

  def initialize
    super("Grenade", 40, 15, 2)
  end

  def dispense?
    true
  end
end
