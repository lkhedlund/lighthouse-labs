require_relative 'spec_helper'

describe Robot do

  before :each do
    @robot = Robot.new
    @item1 = Item.new("item1", 10)
    @item2 = Item.new("item2", 30)
    @light_item = Item.new("light item", 1)
    @max_weight_item = Item.new("max weight item", 250)
    @robot2 = Robot.new
    @weapon = PlasmaCannon.new
    @weapon = PlasmaCannon.new
    @non_weapon = BoxOfBolts.new
  end

  # The pound symbol is a convention to imply that position is a callable method
  # This test is basically saying that it expects @robot.position == [0, 0]
  describe "#position" do
    it "starts off at the center of the board, which is 0,0" do
      expect(@robot.position).to be == [0,0]
    end
  end

  # Now let's describe some of the movement methods on the Robot
  describe "movement in 2D space" do

    it "has ability to #move_left one tile at a time" do
      @robot.move_left
      expect(@robot.position).to eq([-1, 0])

      @robot.move_left
      expect(@robot.position).to eq([-2, 0])
    end

    it "has ability to #move_right one tile at a time" do
      @robot.move_right
      expect(@robot.position).to eq([1, 0])

      @robot.move_right
      expect(@robot.position).to eq([2, 0])
    end

    it "has ability to #move_up one tile at a time" do
      @robot.move_up
      expect(@robot.position).to eq([0, 1])

      @robot.move_up
      expect(@robot.position).to eq([0, 2])
    end

    it "has ability to #move_down one tile at a time" do
      @robot.move_down
      expect(@robot.position).to eq([0, -1])

      @robot.move_down
      expect(@robot.position).to eq([0, -2])
    end
  end

  describe "#items" do
    it "should return empty array" do
      expect(@robot.items).to eq([])
    end
  end

  # Recall that since it is using a "#" in the description,
  # we are describing/expecting a pick_up instance method
  describe "#pick_up" do
    it "adds item to items" do
      @robot.pick_up(@item1)
      expect(@robot.items).to include(@item1)

      # add item2 to collection of items, and make sure it's there when we call #items
      @robot.pick_up(@item2)
      expect(@robot.items).to include(@item2)
    end
  end

  describe "#items_weight" do
    it "should be zero" do
      expect(@robot.items_weight).to eq(0)
    end

    it "should report back total weight of items that have been picked up" do
      @robot.pick_up(@item1)
      @robot.pick_up(@item2)
      expect(@robot.items_weight).to eq(40)
    end
  end

  describe "capacity" do
    it "can only carry a maximum of 250 lbs" do
      expect(@robot.pick_up(@max_weight_item)).to be_truthy
      expect(@robot.pick_up(@light_item)).to be_falsey
      expect(@robot.items_weight).to eq(250)
    end
  end

  describe "#health" do
    it "should be 100" do
      expect(@robot.health).to eq(100)
    end
  end

  describe "#wound" do
    it "decreases health" do
      @robot.wound(20)
      expect(@robot.health).to eq(80)
    end

    it "doesn't decrease health below 0" do
      @robot.wound(150)
      expect(@robot.health).to eq(0)
    end
  end

  describe "#heal" do
    it "increases health" do
      @robot.wound(40)
      @robot.heal(20)
      expect(@robot.health).to eq(80)
    end

    it "doesn't increase health over 100" do
      @robot.heal(10)
      expect(@robot.health).to eq(100)
    end
  end

  describe "#attack" do
    it "wounds other robot with weak default attack (5 hitpoints)" do
      robot2 = Robot.new

      # Create an expectation that by the end of this test,
      # the second robot will have had #wound method called on it
      # and 5 (the default attack hitpoints) will be passed into that method call
      expect(robot2).to receive(:wound).with(5)

      # This is what will trigger the wound to happen on robot2
      @robot.attack(robot2)
    end
    it "uses the equipped weapon in attack" do
      @robot.equipped_weapon = @weapon

      expect(@weapon).to receive(:hit).with(@robot2)
      @robot.attack(@robot2)
    end
  end
  
  describe "#equipped_weapon" do
    it "should have no equipped_weapon" do
      expect(@robot.equipped_weapon).to be_nil
    end

    it "sets equipped weapon" do
      weapon = Laser.new

      @robot.equipped_weapon = weapon
      expect(@robot.equipped_weapon).to eq(weapon)
    end
  end

  # Recall that since it is using a "#" in the description,
  # we are describing/expecting a pick_up instance method
  describe "#pick_up" do
    it "should automatically equip item if it's a weapon of any kind" do
      @robot.pick_up(@weapon)
      expect(@robot.equipped_weapon).to equal(@weapon)
    end

    it "should not equip the item as a weapon if it's not a weapon (duh!)" do
      @robot.pick_up(@non_weapon)
      expect(@robot.equipped_weapon).to be_nil
    end
  end
end
