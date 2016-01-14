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
      guess = ''
      until guess.length == 1
        print 'Enter your guess: '
        guess = gets.chomp.downcase
      end
      guess
    end

    def results_for(correct_letters, incorrect_letters, guessed_word)
      system_clear
      puts <<-MSG
      
      
      Correct Guess: #{correct_letters.join(', ')}"
      
      
      Incorrect Guess: #{incorrect_letters.join(', ')}
      
      
      Hangman: #{guessed_word}
      
      
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
