module Hangman

  class Word
    def self.list
      File.readlines(File.expand_path(__FILE__,"../../words.txt"))
    end

    def self.random
      list.select { |word| word.length >= 5 && word.length <= 12 }.sample.strip.downcase
    end
  end

end
