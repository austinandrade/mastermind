# require './lib/mastermind.rb'
# require './lib/player_guess_matcher'
class Printer
  attr_reader :winning_code, :time_taken_to_win
  attr_accessor :guess_count, :player_guess
  def initialize(winning_code, guess_count, player_guess, time_taken_to_win) # change nil if need be
    @winning_code = winning_code
    @guess_count = guess_count
    @player_guess = player_guess
    @time_taken_to_win = time_taken_to_win
  end
  def welcome_message
    welcome_message = "Welcome to MASTERMIND
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    puts welcome_message
  end
  def handle_guess_single_or_plural
    @guesses_or_guess = @guess_count > 1 ? "guesses" : "guess"
  end
  def guess_feedback(player_guess) #had to add ability to pass in argument into method - because player_guess is user input??
    puts "------------------"
    handle_guess_single_or_plural
    # line 28 - @player_guess isn't reading, not in string when printed to terminal
    # @number_of_correct_letters
    # @number_of_correct_positions
    guess_feedback = "'#{player_guess}' has 3 of the correct elements with 2 in the correct positions
    You've taken #{@guess_count} #{@guesses_or_guess}"
    puts guess_feedback
  end
  def win_message
    puts "------------------"
    handle_guess_single_or_plural
    win_message = "Congratulations! You guessed the sequence '#{@winning_code}' in #{@guess_count} #{@guesses_or_guess} over #{@time_taken_to_win}.
    Do you want to (p)lay again or (q)uit?"
    puts win_message
  end
  def start_game_message
    puts "------------------"
    start_game_message = "I have generated a beginner sequence with four elements made up of:
(r)ed, (g)reen, (b)lue, and (y)ellow.
Use (q)uit at any time to end the game.
What's your guess?"
    puts start_game_message
    puts "------------------"
  end
  def instructions_message
    puts "------------------"
    instructions = "You must successfully guess the secret code. On each guess, you will learn the number of correct colors guessed as well as the number placed in the correct slots"
    puts instructions
    puts "------------------"
  end
  def quit_message
    puts "------------------"
    p "Exiting..."
    puts "------------------"
  end
  def answer_is_too_long_message
    puts "------------------"
    puts "ANSWER IS TOO LONG!"
    puts "------------------"
  end
  def answer_is_too_short_message
    puts "------------------"
    puts "ANSWER IS TOO SHORT!"
    puts "------------------"
  end
  def cheat_message
    puts "------------------"
    puts "Winning code: #{@winning_code}"
  end
end
