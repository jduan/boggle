require "spec_helper"

module Boggle
  describe Cell do
    it "== should work" do
      cell1 = Cell.new("A", [])
      cell2 = Cell.new("A", [])
      cell1.should == cell2
    end
  end
end
