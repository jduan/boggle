module Boggle
  # This module defines a is_word? method that decides if a given string is word
  # or not. The file /usr/share/dict/web2 is the dictionary we use.
  module Word
    def self.is_word?(str)
      load_dictionary
      puts "dictionary size: #{@dictionary.size}"
      @dictionary.include? str
    end

    private

    def self.load_dictionary
      return if @dictionary

      @dictionary = Set.new
      File.open("/usr/share/dict/web2") do |fh|
        while line = fh.gets
          @dictionary << line.chomp
        end
      end
    end
  end
end
