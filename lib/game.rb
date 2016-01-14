require_relative 'word_list'
require_relative 'player'
require_relative 'hangman_io'

module Hangman

  class Game
    def initialize
      @correct_word    = WordList.random
      @player          = Player.new
      @io              = HangmanIO.new
    end

    def play
      io.welcome_message
      loop do
        io.enter_guess
        player.guess_letter
        check_players_guess
        io.results_for(player, guessed_word)
        if winner?
          io.quit
          break
        end
      end
    end

    private

    attr_reader :player, :io, :correct_word

    def correct?(letter)
      correct_word.include?(player.last_guess)
    end

    def guessed_word
      correct_word.split('').map { |letter|
        player.correct_guesses.include?(letter) ? letter : "_"
      }.join("")
    end

    def winner?
      guessed_word == correct_word
    end

    def check_players_guess
      letter = player.last_guess
      if correct? letter
        player.correct_guesses << letter
      else
        player.incorrect_guesses << letter
      end
    end

  end

end

