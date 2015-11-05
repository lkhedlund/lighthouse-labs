class Weapon < Item

  def hit(robot)
    robot.wound(@damage)
  end
end
