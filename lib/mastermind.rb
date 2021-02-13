require 'pry'
require './lib/printer.rb'

class Mastermind
  attr_reader :guess_count
  def initialize (guess_count = nil, winning_code = nil)
    @guess_count = 2 #guess_count.nil? ? increment_guess_count : guess_count
    @winning_code = winning_code.nil? ? create_winning_code : winning_code
    #ternary - if/els
    @instance_of_printer = Printer.new(@winning_code, @guess_count, @player_guess, "25 hours")
  end
  def welcome_to_mastermind
    @instance_of_printer.welcome_message
  end
  def beginning_user_input
    player_input = gets.chomp
    if player_input == "p" || player_input == "play"
        Mastermind.new(@guess_count, @winning_code).start_game
    elsif player_input == "i" || player_input == "instructions"
        @instance_of_printer.instructions_message
    else player_input == "q" || player_input == "quit"
        p "Exiting..."
        exit
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
  def game_logic(player_guess)
    until @guess_count == 1000000
      if @player_guess == "c" || @player_guess == "cheat"
        puts @winning_code
        Mastermind.new(@guess_count, @winning_code).start_game
      elsif @player_guess == "q" || player_guess == "quit"
        exit #return was exit start_game method but not the file/class
      elsif @player_guess.length < 4
        puts "ANSWER IS TOO SHORT!"
        Mastermind.new(@guess_count, @winning_code).start_game
      elsif @player_guess.length > 4
        puts "ANSWER IS TOO LONG!"
        Mastermind.new(@guess_count, @winning_code).start_game
      elsif @player_guess == @winning_code
        @instance_of_printer.win_message
          play_or_quit_input = gets.chomp
          post_win(play_or_quit_input)
      else @player_guess != @winning_code
        guess_feedback = "'#{player_guess}' has 3 of the correct elements with 2 in the correct positions
        You've taken #{@guess_count} guess"
        puts guess_feedback
        @guess_count += 1
        Mastermind.new(@guess_count, @winning_code).start_game
      end
    end
  end
  def post_win(play_or_quit_input)
    if play_or_quit_input ==  "p" || play_or_quit_input == "play"
      Mastermind.new.start_game
    else play_or_quit_input == "q" || play_or_quit_input == "quit"
      p "Exiting..."
      exit
    end
  end
  def start_game
    start_game_message = "I have generated a beginner sequence with four elements made up of: (r)ed,
                          (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
                          What's your guess?"
    puts start_game_message
    @player_guess = gets.chomp
    @guess_count += 1
    game_logic(@player_guess)
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
mastermind = Mastermind.new()

# mastermind.create_winning_code #don't need to call this b/c class does this to self
mastermind.welcome_to_mastermind
mastermind.beginning_user_input
