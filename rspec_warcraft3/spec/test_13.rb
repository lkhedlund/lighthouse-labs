require_relative 'spec_helper'

# Enhancement 3
# A dead unit cannot attack another unit. Conversely, an alive unit will also not attack another unit that is already dead.

describe Unit do

  before :each do
    @unit = Unit.new(100, 3)
  end

  describe '#attack!' do
    it "should not attack a unit that is dead" do
      enemy_unit = Unit.new(0, 3)
      @unit.attack!(enemy_unit)
      expect(enemy_unit.health_points).to_not eq(-3)
    end

    it "should not be able to attack a unit if it is dead" do
      dead_unit = Unit.new(0, 3)
      dead_unit.attack!(@unit)
      expect(@unit.health_points).to_not eq(97)
    end
  end

end
