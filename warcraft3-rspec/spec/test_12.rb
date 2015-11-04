require_relative 'spec_helper'

# Enhancement 2
# Units start off alive but they die if their HP hits 0 or lower. This is usually a result of receiving damage from combat.
#
# Implementation: Define a method dead? on the Unit class. We add it to Unit instead of Footman for example b/c all units can die, not just footman or peasants.

describe Unit do

  before :each do
    @unit = Unit.new(100, 3)
  end

  describe "#dead?" do
    it "should equal true if the unit is below 0 health points" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.dead?).to be true
    end
  end

end
