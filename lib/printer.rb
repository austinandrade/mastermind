# require './lib/mastermind_2.rb'

class Printer
  def initialize(winning_code, guess_count, player_guess, time_taken_to_win = nil) # change nil if need be
    @winning_code = winning_code
    @guess_count = guess_count
    @time_taken_to_win = time_taken_to_win
    @player_guess = player_guess
  end

  def welcome_message
    welcome_message = "Welcome to MASTERMIND

    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

    puts welcome_message
  end

  def win_message
    win_message = "Congratulations! You guessed the sequence '#{@winning_code}' in #{@guess_count} guesses over #{@time_taken_to_win}.
    Do you want to (p)lay again or (q)uit?"

    puts win_message
  end

  def guess_feedback
    guess_feedback = "'#{@player_guess}' has 3 of the correct elements with 2 in the correct positions
    You've taken #{@guess_count} guess"

    puts guess_feedback
  end
end
