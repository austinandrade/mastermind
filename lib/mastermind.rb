require 'pry'
require './lib/printer'
require './lib/player_guess_matcher'
class Mastermind
  attr_reader :winning_code, :instance_of_matcher
  attr_accessor :guess_count, :new_guess_count
  def initialize (guess_count = nil, winning_code = nil)
    @guess_count = 0 #guess_count.zero? ? increment_guess_count : guess_count
    @winning_code = create_winning_code
    #ternary - if/els
    # @player_guess = player_guess
    @instance_of_printer = Printer.new(@winning_code, @guess_count, @player_guess)
    @game_over = false
    # binding.pry
    @instance_of_matcher = PlayerGuessMatcher.new(@winning_code, @player_guess)
  end
  def welcome_to_mastermind
    @instance_of_printer.welcome_message
  end
  def beginning_user_input
    player_input = gets.chomp
    if player_input == "p" || player_input == "play"
        start_game
    elsif player_input == "i" || player_input == "instructions"
        @instance_of_printer.instructions_message
    else player_input == "q" || player_input == "quit"
      @instance_of_printer.quit_message
        exit
    end
  end
  def game_logic(player_guess)
    until @game_over == true
    # until @guess_count == 1000000
      if @player_guess == "c" || @player_guess == "cheat"
        @instance_of_printer.cheat_message
        # Mastermind.new(@guess_count, @winning_code).start_game
      elsif @player_guess == "q" || player_guess == "quit"
        @instance_of_printer.quit_message
        exit #return was exit start_game method but not the file/class
      elsif @player_guess.length < 4
        @instance_of_printer.answer_is_too_short_message
        # Mastermind.new(@guess_count, @winning_code).start_game
      elsif @player_guess.length > 4
        @instance_of_printer.answer_is_too_long_message
        # Mastermind.new(@guess_count, @winning_code).start_game
      elsif @player_guess != @winning_code
        @guess_count += 1
        @instance_of_matcher.check_number_of_correct_colors(@player_guess)
        @instance_of_matcher.check_number_of_correct_color_and_position(@player_guess)
        @instance_of_printer.guess_feedback(@player_guess, @guess_count)
      elsif @player_guess == @winning_code
        @game_over = true
        @instance_of_printer.win_message
          play_or_quit_input = gets.chomp
          post_win(play_or_quit_input)
          break
        # guess_feedback = "'#{player_guess}' has 3 of the correct elements with 2 in the correct positions
        # You've taken #{@guess_count} guess"
        # puts guess_feedback
        # @guess_count += 1
        # Mastermind.new(@guess_count, @winning_code).start_game
      end
      @player_guess = gets.chomp
    end
  end
  def post_win(play_or_quit_input)
    if play_or_quit_input ==  "p" || play_or_quit_input == "play"
      Mastermind.new.start_game
    else play_or_quit_input == "q" || play_or_quit_input == "quit"
      @instance_of_printer.quit_message
      exit
    end
  end
  def start_game
    @instance_of_printer.start_game_message
    @player_guess = gets.chomp
    # guess_count = 1
    # guess_count += 1
    game_logic(@player_guess)
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

  def start_time
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  def end_time
  end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  def total_time
  unrounded_time = start_time - end_time
  seconds = total_time % 60
  minutes = (seconds / 60) % 60
  seconds_rounded = seconds.round(1)
  minutes_rounded = minutes.floor(1)
  seconds_rounded
  end


end

mastermind = Mastermind.new
# mastermind.create_winning_code #don't need to call this b/c class does this to self
mastermind.welcome_to_mastermind
mastermind.beginning_user_input
