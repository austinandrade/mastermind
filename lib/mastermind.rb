class Mastermind
  attr_reader :guess_count
  def initialize
    # @guess_count = 0
  end

  def welcome_to_mastermind
    welcome_message = "Welcome to MASTERMIND

Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

  #puts got rid of /n
     puts welcome_message
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
  end

  def start_game
    start_game_message = "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"

    puts start_game_message
    # puts secret_code

    player_game_input = gets.chomp

    if player_game_input == "q" || player_game_input == "quit"
      return
    elsif player_game_input == "c" || player_game_input == "cheat"
      #print secret code
    elsif player_game_input.length < 4
      "ANSWER IS TOO SHORT!"
    elsif player_game_input.length > 4
      "ANSWER IS TOO LONG!"
    elsif player_game_input == #secret_code
      win_message = "Congratulations! You guessed the sequence 'GRRB' in #{guess_count} guesses over 4 minutes,
      22 seconds.

      Do you want to (p)lay again or (q)uit?"

      puts win_message

      player_game_input = gets.chomp
      # another if statement?

    else "'RRGB' has 3 of the correct elements with 2 in the correct positions
You've taken #{guess_count} guess"
    end
  end

  def instructions_message
    instructions = "Hey these are instructions!!!!"

     puts instructions
  end

  # def create_code
  #   colors = []
  # end

end

mastermind = Mastermind.new

mastermind.welcome_to_mastermind
mastermind.beginning_user_input
