require_relative 'spec_helper'

# Enhancement 1
# In most strategy games, like Warcraft III, buildings can also be attacked by units. Since a barracks is a building, it has substantial more HP (500) To make matters worse, a Footman does only HALF of its AP as damage to a Barracks. This is because they are quite ineffective against buildings.
#
# Note: The damage amount should be an integer (Fixnum). Take the ceil division result.

describe Barracks do

  before :each do
    @barracks = Barracks.new
    @footman = Footman.new
  end

  it "starts off with 500 health points" do
    expect(@barracks.health_points).to eq(500)
  end

  describe "#damage" do
    it "should do half of the damage if the enemy is a barracks" do
      @footman.attack!(@barracks)
      expect(@barracks.health_points).to eq(495)
    end
  end


end
