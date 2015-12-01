require_relative 'spec_helper'

# Enhancement 5
# Introduce a SiegeEngine Unit. The SiegeEngine is very effective against buildings such as the Barracks. It is however ineffective against other units (can't attack them, as though they were dead).
#
# So unlike with Footman (whose attacks do a fraction of the damage they normally would), the SiegeEngine does 2x the damage against the Barracks
#
# Also, Siege Engines can attack other siege engines even though they cannot attack any other units (such as Peasants or Footmen)
#
# Stats:
#
# AP: 50
# HP: 400
# Cost: 200 gold, 60 lumber, 3 food

describe SiegeEngine do

  before :each do
    @siege = SiegeEngine.new
    @barracks = Barracks.new
    @peasant = Peasant.new
    @footman = Footman.new
  end

  it "starts off with 50 attack power" do
    expect(@siege.attack_power).to eq(50)
  end

  it "starts off with 400 health points" do
    expect(@siege.health_points).to eq(400)
  end

  describe '#attack!' do
    it 'should not damage an enemy footman' do
      @siege.attack!(@footman)
      expect(@footman.health_points).to_not eq(10)
    end

    it 'should not damage an enemy peasants' do
      @siege.attack!(@peasant)
      expect(@peasant.health_points).to_not eq(-15)
    end

    it 'should do double damage to barracks' do
      @siege.attack!(@barracks)
      expect(@barracks.health_points).to eq(400)
    end

    it 'should be able to attack another Siege Engine' do
      enemy_unit = SiegeEngine.new
      @siege.attack!(enemy_unit)
      expect(enemy_unit.health_points).to eq(350)
    end

  end

end
