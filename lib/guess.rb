module Hangman

  class Guess
    attr_reader :value

    def initialize
      @value = gets.chomp.downcase
    end

    def to_s
      value
    end

    def is_single_letter?
      value.length == 1
    end
  end

end

