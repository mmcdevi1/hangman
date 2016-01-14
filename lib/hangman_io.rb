module Hangman

  class HangmanIO
    def initialize

    end

    def welcome_message
      puts <<-MSG
      
      Welcome to Hangman!
      
      MSG
    end

    def enter_guess
      print 'Enter your guess: '
    end

    def results_for(player, correct_letters)
      system_clear
      puts <<-MSG
      
      
      Correct Guess: #{player.correct_guesses.join(', ')}"
      
      
      Incorrect Guess: #{player.incorrect_guesses.join(', ')}
      
      
      Hangman: #{correct_letters.join}
      
      
      MSG
    end

    def quit
      puts <<-MSG
      
      You guessed the correct word! Hooray!!
      
      MSG
    end

    def system_clear
      system 'clear'
    end
  end

end
