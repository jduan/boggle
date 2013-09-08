require "spec_helper"

module Boggle
  describe Word do
    it "is_word? should return true for 'hello'" do
      Word.is_word?("hello").should be_true
    end

    it "is_word? should return false for 'hello2'" do
      Word.is_word?("hello2").should be_false
    end
  end
end
