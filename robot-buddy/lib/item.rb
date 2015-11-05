class Item
  attr_reader :name, :weight, :damage

  def initialize(name, weight, damage = nil)
    @name = name
    @weight = weight
    @damage = damage
  end

end
