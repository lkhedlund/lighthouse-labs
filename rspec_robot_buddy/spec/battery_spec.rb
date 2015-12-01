require_relative 'spec_helper'

describe Battery do
  before :each do
    @battery = Battery.new
  end

  it "should be an item" do
    expect(@battery).to be_a HealthItem
  end

  it "has name 'Battery'" do
    expect(@battery.name).to eq("Battery")
  end

  it "has 25 weight" do
    expect(@battery.weight).to eq(25)
  end

  describe "#feed" do
    before :each do
      @robot = Robot.new
    end

    it "heals the robot's shields 25pts" do
      expect(@robot).to receive(:power).with(20)
      @battery.feed(@robot)
    end
  end
end
