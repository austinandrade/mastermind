require 'pry'
# PUT OUT WINNING CODE
class Mastermind
  attr_reader :guess_count
  def initialize
    @guess_count = 0
    @winning_code
  end

  def print_winning_code
    @winning_code
  end

  def welcome_to_mastermind
    welcome_message = "Welcome to MASTERMIND

Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

  #puts got rid of /n
     puts welcome_message
     # printer.welcome_message
  end

  def beginning_user_input
    player_input = gets.chomp
    if player_input == "p" || player_input == "play"
        start_game
    elsif player_input == "i" || player_input == "instructions"
        instructions_message
    else player_input == "q" || player_input == "quit"
        return
    end
    # handling_beginning_input
  end

  # def handling_beginning_input
  #   if player_input == "p" || player_input == "play"
  #       start_game
  #   elsif player_input == "i" || player_input == "instructions"
  #       instructions_message
  #   else player_input == "q" || player_input == "quit"
  #       return
  #   end
  # end

  def start_game
    start_game_message = "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"

    puts start_game_message
    # printer.start_game_message
    # puts secret_code

    player_guess = gets.chomp

    # until player_guess == @winning_code
      if player_guess == @winning_code
          win_message = "Congratulations! You guessed the sequence '#{winning_code}' in #{guess_count} guesses over 4 minutes,
          22 seconds.

          Do you want to (p)lay again or (q)uit?"

          puts win_message
        # printer.win_message

          play_or_quit_input = gets.chomp

        if play_or_quit_input ==  "p" || play_or_quit_input == "play"
          start_game
        else play_or_quit_input == "q" || play_or_quit_input == "quit"
          return
        end

      elsif player_guess == "c" || player_guess == "cheat"
        puts @winning_code
      elsif player_guess.length < 4
        puts "ANSWER IS TOO SHORT!"
      elsif player_guess.length > 4
        puts "ANSWER IS TOO LONG!"

      else player_guess != @winning_code
        guess_feedback = "'#{player_guess}' has 3 of the correct elements with 2 in the correct positions
        You've taken #{guess_count} guess"

        @guess_count += 1

        puts guess_feedback

        # something to loop - guess again
        start_game


      end
  end













  def instructions_message
    instructions = "You must successfully guess the secret code. On each guess, you will learn the number of correct colors guessed as well as the number placed in the correct slots"

     puts instructions
     # printer.instructions_message
  end

  def create_winning_code
    colors = ['r', 'r', 'g', 'g', 'b', 'b', 'y', 'y']
    shuffled_colors = colors.shuffle
    color_collector = []
    @winning_code = ""

    shuffled_colors.each do |color|
      if color_collector.length < 4
        color_collector << color
      end
    end
    @winning_code = color_collector.join("")
  end
end

mastermind = Mastermind.new

mastermind.create_winning_code
mastermind.print_winning_code
mastermind.welcome_to_mastermind
mastermind.beginning_user_input
