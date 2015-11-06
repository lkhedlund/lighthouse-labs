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
    @box_of_bolts = BoxOfBolts.new
    @grenade = Grenade.new
    @battery = Battery.new
  end

  describe "#position" do
    it "starts off at the center of the board, which is 0,0" do
      expect(@robot.position).to be == [0,0]
    end
  end

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
      @robot.wound(70)
      expect(@robot.health).to eq(80)
    end

    it "doesn't decrease health below 0" do
      @robot.wound(150)
      expect(@robot.health).to eq(0)
    end
  end

  describe "#heal" do
    it "increases health" do
      @robot.wound(100)
      @robot.heal(20)
      expect(@robot.health).to eq(70)
    end

    it "doesn't increase health over 100" do
      @robot.heal(10)
      expect(@robot.health).to eq(100)
    end
  end

  describe "#attack" do
    it "wounds other robot with weak default attack (5 hitpoints)" do
      robot2 = Robot.new

      expect(robot2).to receive(:wound).with(5)

      # This is what will trigger the wound to happen on robot2
      @robot.attack(robot2)
    end
    it "uses the equipped weapon in attack" do
      @robot.equipped_weapon = @weapon

      expect(@weapon).to receive(:hit).with(@robot2)
      @robot.attack(@robot2)
    end

    context "with enemy robot directly above" do
      before(:each) do
        @robot2 = Robot.new
        @robot2.move_up
      end

      it "is able to successfully wound the enemy" do
        expect(@robot2).to receive(:wound)
        @robot.attack(@robot2)
      end
    end

    context "with enemy robot two blocks above" do
      before(:each) do
        @robot2 = Robot.new
        @robot2.move_up
        @robot2.move_up # a second time
      end

      it "is unable to successfully wound the enemy" do
        expect(@robot2).not_to receive(:wound)
        @robot.attack(@robot2)
      end
    end

    context "with enemy robot one block below" do
      before(:each) do
        @robot2 = Robot.new
        @robot2.move_down
      end

      it "is able to successfully wound the enemy" do
        expect(@robot2).to receive(:wound)
        @robot.attack(@robot2)
      end
    end

    context "with enemy robot two blocks below" do
      before(:each) do
        @robot2 = Robot.new
        @robot2.move_down
        @robot2.move_down
      end

      it "is unable to successfully wound the enemy" do
        expect(@robot2).not_to receive(:wound)
        @robot.attack(@robot2)
      end
    end

    context "equipped with grenade" do
      before :each do
        @robot.equipped_weapon = @grenade
      end

      context "with enemy robot two blocks above" do
        before :each do
          @robot2 = Robot.new
          @robot2.move_up
          @robot2.move_up
        end

        it "is able to successfully wound the enemy" do
          expect(@robot2).to receive(:wound)
          @robot.attack(@robot2)
        end

        it "should dispense the weapon (can only use once)" do
          @robot.attack(@robot2)
          expect(@robot.equipped_weapon).to be_a BasicAttack
        end
      end

      context "with enemy robot three blocks above" do
        before(:each) do
          @robot2 = Robot.new
          @robot2.move_up
          @robot2.move_up
          @robot2.move_up
        end

        it "is NOT able to successfully wound the enemy" do
          expect(@robot2).not_to receive(:wound)
          @robot.attack(@robot2)
        end
      end
    end
  end

  describe "#equipped_weapon" do
    it "should have no equipped_weapon" do
      expect(@robot.equipped_weapon).to be_a BasicAttack
    end

    it "sets equipped weapon" do
      weapon = Laser.new

      @robot.equipped_weapon = weapon
      expect(@robot.equipped_weapon).to eq(weapon)
    end
  end

  describe "#pick_up" do
    it "should automatically equip item if it's a weapon of any kind" do
      @robot.pick_up(@weapon)
      expect(@robot.equipped_weapon).to equal(@weapon)
    end

    it "should not equip the item as a weapon if it's not a weapon (duh!)" do
      @robot.pick_up(@box_of_bolts)
      expect(@robot.equipped_weapon).to be_a BasicAttack
    end

    it "should automatically feed box of bolts if at or below 80hp" do
      allow(@robot).to receive(:health).and_return(80)
      expect(@box_of_bolts).to receive(:feed).and_call_original
      @robot.pick_up(@box_of_bolts)
    end

    it "should not auto feed box of bolts if above 80hp" do
      allow(@robot).to receive(:health).and_return(81)
      expect(@box_of_bolts).not_to receive(:feed)
      @robot.pick_up(@box_of_bolts)
    end

    it "should automatically feed on battery if at or below 25 shields" do
      allow(@robot).to receive(:shields).and_return(25)
      expect(@battery).to receive(:feed).and_call_original
      @robot.pick_up(@battery)
    end

    it "should not auto feed on battery if above 25 shields" do
      allow(@robot).to receive(:shields).and_return(26)
      expect(@battery).not_to receive(:power)
      @robot.pick_up(@battery)
    end

  end

  describe '#heal!' do
    it 'should raise an exception if the robot is already at 0 health' do
      @robot.wound(200)
      expect{ @robot.heal!(10) }.to raise_error(Robot::RobotDeadError)
    end
  end

  describe '#attack!' do
    it 'should raise an error if the robot is attacking anything other than another robot' do
      expect{ @robot.attack!(@item1)}.to raise_error(Robot::CannotAttackError)
    end
  end

  describe '#shields' do
    it 'should start off at 50 points' do
      expect(@robot.shields).to eq(50)
    end

    it 'when attacked should drain shields before health' do
      @robot.wound(140)
      expect(@robot.shields).to eq(0)
      expect(@robot.health).to eq(10)
    end
  end

  describe '.robot_list' do
    it 'should keep track of all instantiated robots' do
      Robot.class_variable_set :@@robot_list, []
      robot1 = Robot.new
      robot2 = Robot.new
      expect(Robot.robot_instances).to eq(2)
    end
  end

  describe '.in_position(x, y)' do
    it 'should return an array of all robots at those coordinates' do
      Robot.class_variable_set :@@robot_list, []
      robot1 = Robot.new
      expect(Robot.in_position(0,0)).to_not be_empty
    end

    it 'should return an empty array if no robots are at the position' do
      Robot.class_variable_set :@@robot_list, []
      robot1 = Robot.new
      robot1.move_up
      expect(Robot.in_position(0,0)).to be_empty
    end

    describe '#scan' do
      it 'should return the robots in positions around it' do
        Robot.class_variable_set :@@robot_list, []
        robot1 = Robot.new
        robot2 = Robot.new
        robot1.move_up
        robot2.move_left
        robot2.move_left
        expect(@robot.scan).to_not be_empty
        expect(@robot.scan).to include(robot1)
        expect(@robot.scan).to_not include(robot2)
      end
    end
  end


end
