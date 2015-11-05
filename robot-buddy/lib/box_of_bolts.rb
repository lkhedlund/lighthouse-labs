class BoxOfBolts < Item
  def initialize
    super("Box of bolts", 25)
    @heal_amount = 20
  end

  def feed(robot)
    robot.heal(@heal_amount)
  end
end
