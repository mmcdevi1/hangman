module Hangman

  class HangmanIO
    def initialize

    end

    def welcome_message
      puts
      puts "Welcome to Hangman!"
      puts
    end

    def enter_guess
      print 'Enter your guess: '
    end

    def results_for(player, correct_letters)
      system_clear
      puts
      puts
      puts "Correct Guess: "
      print player.correct_guesses.join(', ')
      puts
      puts
      puts "Incorrect Guess: "
      print player.incorrect_guesses.join(', ')
      puts
      puts
      puts "Hangman: "
      print correct_letters.join
      puts
      puts
    end

    def quit
      puts
      puts 'You guessed the correct word! Hooray!!'
      puts
    end

    def system_clear
      system 'clear'
    end
  end

end