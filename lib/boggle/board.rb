require 'boggle/word'
require 'boggle/cell'
require "set"

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

    def find_all_words
      all_words = Set.new
      @cells.each do |cell|
        visited = Hash.new(false)
        buffer = [cell.value]
        visited[cell] = true
        words = Set.new
        find_all_words_from_cell(words, cell, visited, buffer)
        #puts "words from letter #{cell.value}:"
        #p words
        all_words.merge(words)
      end

      all_words.to_a
    end

    def find_all_words_from_cell(words, cell, visited, buffer)
      cell.neighbors.each do |c|
        return if visited[c]
        visited[c] = true
        buffer << c.value
        word = buffer.join
        words << word if Word.is_word? word
        find_all_words_from_cell(words, c, visited, buffer)
        visited[c] = false
        buffer.pop
      end
    end
  end
end
