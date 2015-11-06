class HealthItem < Item
  attr_reader :heal_amount

  def initialize(name, weight, heal_amount)
    super(name, weight)
    @heal_amount = 20
  end

  def feed(robot)
    robot.heal(@heal_amount)
  end

end
