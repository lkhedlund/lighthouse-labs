class Battery < HealthItem

  def initialize
    super("Battery", 25, 25)
  end

  def feed(robot)
    robot.power(@heal_amount)
  end
end
