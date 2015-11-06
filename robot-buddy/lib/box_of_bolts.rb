class BoxOfBolts < HealthItem

  def initialize
    super("Box of bolts", 25, 20)
  end

  def feed(robot)
    robot.heal(@heal_amount)
  end
end
