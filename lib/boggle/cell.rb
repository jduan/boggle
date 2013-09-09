module Boggle
  Cell = Struct.new(:value, :neighbors) do
    #def to_s
    #  "(%s, %s)" % [self.value, self.neighbors.map do |c| c.value end]
    #end
  end
end
