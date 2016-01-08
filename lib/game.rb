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
        player_makes_guess
        check_players_guess
        @io.results_for(player, correct_letters)
        if player_is_winner
          @io.quit
          break
        end
      end
    end

    private

    def player_is_winner
      return true if correct_letters.join == random_word
    end

    def set_correct_letters_if_correct_guess
      random_word.split('').each_with_index do |letter, index|
        correct_letters[index] = letter if letter == players_last_guess
      end
    end

    def set_correct_guesses
      player.correct_guesses << players_last_guess
    end

    def set_incorrect_guesses
      player.incorrect_guesses << players_last_guess
    end

    def check_players_guess
      if random_word.include?(players_last_guess)
        set_correct_guesses
        set_correct_letters_if_correct_guess
      else
        set_incorrect_guesses
      end
    end

    def players_last_guess
      player.last_guess
    end

    def player_makes_guess
      player.guess_letter
    end

  end

end

game = Hangman::Game.new





































