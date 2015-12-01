require_relative 'spec_helper'

# Enhancement 4
# Aside from gold and food, there is also the concept of lumber. Add lumber as a resource that the barracks can handle.
#
# A Barracks can start off with 500 lumber.

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "starts off with 500 lumber" do
    expect(@barracks.lumber).to eq(500)
  end

end
