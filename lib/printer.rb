require './lib/player_guess_matcher'
class Printer
  attr_reader :winning_code, :time_taken_to_win
  attr_accessor :guess_count, :player_guess
  def initialize(winning_code, guess_count, player_guess) # change nil if need be
    @winning_code = winning_code
    @guess_count = guess_count
    @player_guess = player_guess
    # @start_time = start_time
    # @end_time = end_time
    # @total_time = total_time
    # @time_taken_to_win = time_taken_to_win
    @instance_of_matcher = PlayerGuessMatcher.new(@winning_code, @player_guess)
  end
  def welcome_message
    welcome_message = "Welcome to MASTERMIND
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    puts welcome_message
  end
  def handle_guess_singular_or_plural(guess_count)
    @guesses_or_guess = guess_count > 1 ? "guesses" : "guess"
  end
  def guess_feedback(player_guess, guess_count) #had to add ability to pass in argument into method - because player_guess is user input??
    puts "------------------"
    handle_guess_singular_or_plural(guess_count)
    guess_feedback = "'#{player_guess}' has #{@instance_of_matcher.check_number_of_correct_colors(player_guess)} of the correct elements with #{@instance_of_matcher.check_number_of_correct_color_and_position(player_guess)} in the correct positions
    You've taken #{guess_count} #{@guesses_or_guess}"
    puts guess_feedback
  end
  def win_message(guess_count)
    puts "------------------"
    handle_guess_singular_or_plural(guess_count)
    win_message = "Congratulations! You guessed the sequence '#{@winning_code}' in #{@guess_count} #{@guesses_or_guess} over #{} seconds!
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
    puts "Try again..."
  end
  def answer_is_too_short_message
    puts "------------------"
    puts "ANSWER IS TOO SHORT!"
    puts "------------------"
    puts "Try again..."
  end
  def cheat_message
    puts "------------------"
    puts "Winning code: #{@winning_code}"
    puts "Nice. What's your guess cheater?"
  end
end
