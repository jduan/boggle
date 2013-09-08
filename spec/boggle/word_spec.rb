require "spec_helper"

module Boggle
  describe Word do
    it "should return false for all words" do
      Word.is_word?("hello").should be_false
    end
  end
end
