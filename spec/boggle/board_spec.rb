require "spec_helper"

module Boggle
  describe Board do
    it "cells should return an array of cells" do
      matrix = [
        %w(A H D P),
        %w(J B C M),
        %w(S K L F),
        %w(T Q W N),
      ]

      board = Board.new(matrix)
      cells = board.cells
      cells.size.should == 16
      cells[0].value.should == "A"
      cells[0].neighbors.size.should == 3
      cells[1].value.should == "H"
      cells[1].neighbors.size.should == 5
      cells[2].value.should == "D"
      cells[2].neighbors.size.should == 5
      cells[3].value.should == "P"
      cells[3].neighbors.size.should == 3
      cells[4].value.should == "J"
      cells[4].neighbors.size.should == 5
      cells[5].value.should == "B"
      cells[5].neighbors.size.should == 8
      cells[6].value.should == "C"
      cells[6].neighbors.size.should == 8
      cells[7].value.should == "M"
      cells[7].neighbors.size.should == 5
      cells[8].value.should == "S"
      cells[8].neighbors.size.should == 5
      cells[9].value.should == "K"
      cells[9].neighbors.size.should == 8
      cells[10].value.should == "L"
      cells[10].neighbors.size.should == 8
      cells[11].value.should == "F"
      cells[11].neighbors.size.should == 5
      cells[12].value.should == "T"
      cells[12].neighbors.size.should == 3
      cells[13].value.should == "Q"
      cells[13].neighbors.size.should == 5
      cells[14].value.should == "W"
      cells[14].neighbors.size.should == 5
      cells[15].value.should == "N"
      cells[15].neighbors.size.should == 3
    end

    it "find_all_words should return all valid words" do
      matrix = [
        %w(C O D A),
        %w(A R N P),
        %w(O S E L),
        %w(I R U M),
      ]

      board = Board.new(matrix)
      words = board.find_all_words
      words.size.should == 125
      words.should == ["CA", "OD", "OR", "ORC", "ON", "DO", "DOC", "DA",
                       "AD", "ADO", "AN", "ANOA", "AND", "AR", "ARC",
                       "AS", "ROC", "ROD", "RA", "RE", "NO", "NOD", "NOA",
                       "NOR", "NA", "NE", "PA", "PAD", "PAN", "PAND", "PER",
                       "PERN", "PEN", "PEND", "PENDA", "OAR", "ORA", "ORNA",
                       "OS", "SA", "SAC", "SACO", "SAO", "SAR", "SAROD",
                       "SARD", "SNOD", "SO", "SOAR", "SORDA", "SORA", "SORN",
                       "SE", "SER", "SERO", "SERA", "SEN", "SEND", "SEPAD",
                       "SI", "ER", "ERD", "ERA", "ERS", "EN", "END", "ENS",
                       "ES", "EL", "EROS", "EU", "EM", "LENO", "LEND",
                       "LENAD", "LENS", "LEPA", "LUE", "LUES", "IO", "IS",
                       "ISO", "IRE", "ROAR", "ROI", "REND", "REP", "REPAND",
                       "REL", "RIO", "RISE", "RISER", "RISEN", "RUSE", "RUE",
                       "RUER", "RUEN", "RULE", "RULER", "US", "USAR", "USE",
                       "USER", "ULNA", "ULNAD", "ULE", "UR", "URE", "UM",
                       "UME", "ME", "MERO", "MEN", "MEND", "MENSA", "MESA",
                       "MESO", "MEL", "MEROS", "MU", "MUSAR", "MUSE", "MUSER",
                       "MULE", "MURE"]
    end
  end
end
