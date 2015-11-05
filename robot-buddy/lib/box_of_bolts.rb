class BoxOfBolts < Item
  attr_reader :heal_amount

  def initialize
    super("Box of bolts", 25)
    @heal_amount = 20
  end

  def feed(robot)
    robot.heal(@heal_amount)
  end
end
