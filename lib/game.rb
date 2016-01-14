require_relative 'random_word'
require_relative 'player'
require_relative 'hangman_io'

module Hangman

  class Game
    attr_accessor :player, :correct_letters
    attr_reader :words, :random_word

    def initialize
      @correct_letters = []
      @random_word     = Word.random
      @player          = Player.new
      @io              = HangmanIO.new
      create_correct_letters_array
      play
    end

    def create_correct_letters_array
      random_word.length.times do
        @correct_letters << String.new('_')
      end
    end

    def play
      @io.welcome_message
      loop do
        @io.enter_guess
        player.guess_letter
        check_players_guess
        @io.results_for(player, guessed_word)
        if player_is_winner
          @io.quit
          break
        end
      end
    end

    private

    def correct?(letter)
      random_word.include?(player.last_guess)
    end

    def guessed_word
      random_word.split('').map { |letter|
        player.correct_guesses.include?(letter) ? letter : "_"
      }.join("")
    end

    def player_is_winner
      return true if guessed_word == random_word
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

game = Hangman::Game.new
