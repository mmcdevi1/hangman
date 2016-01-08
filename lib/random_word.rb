module Hangman

  class Word
    def self.list
      File.readlines("../words.txt")
    end

    def self.random
      list.select { |word| word.length >= 5 && word.length <= 12 }.sample.strip.downcase
    end
  end

end