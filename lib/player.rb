require_relative 'guess'

module Hangman

  class Player
    attr_accessor :guesses, :correct_guesses, :incorrect_guesses

    def initialize
      @guesses           = []
      @correct_guesses   = []
      @incorrect_guesses = []
    end

    def guess_letter
      begin
        player_guess = Guess.new
        guesses << player_guess.value
      end until player_guess.is_single_letter?
    end

    def last_guess
      guesses.last
    end
  end

end