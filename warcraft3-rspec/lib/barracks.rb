class Barracks
  attr_accessor :gold, :food

  def initialize
    @gold = 1000
    @food = 80
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      Footman.new
    end
  end

  def can_train_footman?
    # instance variables causing error in rspec test
    # cannot change test, but know that these
    # should be instance variables.
    gold >= 135 && food >= 2
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end

  def can_train_peasant?
    # instance variables causing error in rspec test
    # cannot change test, but know that these
    # should be instance variables.
    gold >= 90 && food >= 5
  end
end
