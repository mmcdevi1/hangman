require_relative 'word_list'
require_relative 'hangman_io'

module Hangman

  class Game
    def initialize
      @correct_word      = WordList.random
      @correct_letters   = []
      @incorrect_letters = []
      @io                = HangmanIO.new
    end

    def play
      io.welcome_message
      until winner?
        guess = io.enter_guess
        collect_guesses(guess)
        io.results_for(correct_letters, incorrect_letters, guessed_word)
      end
      io.quit
    end

    private

    attr_reader :player, :io, :correct_word, :correct_letters, :incorrect_letters

    def correct?(letter)
      correct_word.include?(letter)
    end

    def guessed_word
      correct_word.split('').map { |letter|
        @correct_letters.include?(letter) ? letter : "_"
      }.join("")
    end

    def winner?
      guessed_word == correct_word
    end

    def collect_guesses(guess)
      if correct? guess
        @correct_letters << guess
      else
        @incorrect_letters << guess
      end
    end

  end

end

