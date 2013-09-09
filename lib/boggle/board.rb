require 'boggle/cell'

module Boggle
  Coordinates = Struct.new(:x, :y)

  class Board
    attr_reader :cells
    # Construct a square board out of a 2-D array.
    def initialize(matrix)
      length = matrix.size
      i = 0
      @coords_to_cells = {}
      while i < length
        j = 0
        while j < length
          cell = Cell.new(matrix[i][j])
          coordinates = Coordinates.new(i, j)
          @coords_to_cells[coordinates] = cell
           j += 1
        end
        i += 1
      end

      @coords_to_cells.each do |coord, cell1|
        x = coord.x
        y = coord.y
        neighbor_coordinates = [
          Coordinates.new(x - 1, y - 1),
          Coordinates.new(x - 1, y),
          Coordinates.new(x - 1, y + 1),
          Coordinates.new(x, y - 1),
          Coordinates.new(x, y + 1),
          Coordinates.new(x + 1, y - 1),
          Coordinates.new(x + 1, y),
          Coordinates.new(x + 1, y + 1),
        ]
        neighbor_coordinates.select! do |coord2|
          coord2.x >= 0 && coord2.x < length && coord2.y >= 0 && coord2.y < length
        end
        neighbors = neighbor_coordinates.map do |coord3|
          @coords_to_cells[coord3]
        end

        cell1.neighbors = neighbors
      end

      @cells = @coords_to_cells.values
    end
  end
end
