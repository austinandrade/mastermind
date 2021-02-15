require 'pry'
require 'time'
require './lib/printer'
require './lib/player_guess_matcher'
class Mastermind
  attr_reader :winning_code, :instance_of_matcher
  attr_accessor :guess_count, :new_guess_count
  def initialize (guess_count = nil, winning_code = nil)
    @guess_count = 0
    @winning_code = create_winning_code
    @instance_of_printer = Printer.new(@winning_code, @guess_count, @player_guess)
    @instance_of_matcher = PlayerGuessMatcher.new(@winning_code, @player_guess)
    @game_over = false
    # @start_time = nil
    # @end_time = nil
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
    while @game_over == false
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
      else @player_guess == @winning_code
        end_time
        # time_differences
        # total_time
        @game_over = true
        @instance_of_printer.win_message(@guess_count, @end_time_minutes, @start_time_minutes, @end_time_seconds, @start_time_seconds)
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
    start_time
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
  # @start_time_minutes = Time.now.utc.strftime("%H%M%S").to_i
  @start_time_minutes = Time.now.utc.strftime("%M").to_i
  # @start_time_seconds = Time.now.utc.strftime("%H%M%S").to_i
  @start_time_seconds = Time.now.utc.strftime("%S").to_i
  end
  def end_time
  # @end_time_minutes = Time.now.utc.strftime("%H%M%S").to_i
  @end_time_minutes = Time.now.utc.strftime("%M").to_i
  # @end_time_seconds = Time.now.utc.strftime("%H%M%S").to_i
  @end_time_seconds = Time.now.utc.strftime("%S").to_i


  binding.pry
  end

  # def time_differences
  # @minute_difference = @end_time_minutes - @start_time_minutes
  # @second_difference = @end_time_seconds - @end_time_seconds
  # # binding.pry
  # end

  def total_time
  unrounded_time = @start_time - @end_time
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



































# require 'pry'
# require './lib/printer'
# require './lib/player_guess_matcher'
# # require './lib/time'
#
# class Mastermind
#   attr_reader :winning_code, :instance_of_matcher
#   attr_accessor :guess_count
#   def initialize (guess_count = nil, winning_code = nil)
#     @guess_count = 0  #guess_count.zero? ? increment_guess_count : guess_count
#     @winning_code = winning_code.nil? ? create_winning_code : winning_code
#     @instance_of_printer = Printer.new(@winning_code, @guess_count, @player_guess)
#     @instance_of_matcher = PlayerGuessMatcher.new(@winning_code, @player_guess)
#     @game_over = false
#   end
#   def welcome_to_mastermind
#     @instance_of_printer.welcome_message
#   end
#   def beginning_user_input
#     player_input = gets.chomp
#     if player_input == "p" || player_input == "play"
#         start_game #Mastermind.new(@guess_count, @winning_code).start_game
#     elsif player_input == "i" || player_input == "instructions"
#         @instance_of_printer.instructions_message
#     else player_input == "q" || player_input == "quit"
#       @instance_of_printer.quit_message
#         exit
#     end
#   end
#   def game_logic(player_guess)
#      until @game_over == true #until @guess_count == 1000000
#       if @player_guess == "c" || @player_guess == "cheat"
#         @instance_of_printer.cheat_message
#         start_game #Mastermind.new(@guess_count, @winning_code).start_game
#       elsif @player_guess == "q" || player_guess == "quit"
#         @instance_of_printer.quit_message
#         exit #return was exit start_game method but not the file/class
#       elsif @player_guess.length < 4
#         @instance_of_printer.answer_is_too_short_message
#         start_game #Mastermind.new(@guess_count, @winning_code).start_game
#       elsif @player_guess.length > 4
#         @instance_of_printer.answer_is_too_long_message
#         start_game #.new(@guess_count, @winning_code).start_game
#       elsif @player_guess != @winning_code
#         increment_guess_count
#         @instance_of_matcher.check_number_of_correct_colors(@player_guess)
#         @instance_of_matcher.check_number_of_correct_color_and_position(@player_guess)
#         @instance_of_printer.guess_feedback(@player_guess, @guess_count)
#          start_game
#        else @player_guess == @winning_code
#          @game_over = true
#          @instance_of_matcher.end_time
#          @instance_of_matcher.game_time
#          @instance_of_printer.win_message(@guess_count, @minutes, @seconds)
#           play_or_quit_input = gets.chomp
#           post_win(play_or_quit_input)
#       end
#     end
#   end
#   def increment_guess_count
#     @guess_count += 1
#   end
#   def post_win(play_or_quit_input)
#     if play_or_quit_input ==  "p" || play_or_quit_input == "play"
#       Mastermind.new.start_game
#     else play_or_quit_input == "q" || play_or_quit_input == "quit"
#       @instance_of_printer.quit_message
#       exit
#     end
#   end
#   # def game_time_start_and_end
#   #   if
#   # end
#   def start_game
#     # @starting_time = Time.now
#     @instance_of_matcher.start_time
#     @instance_of_printer.start_game_message
#     @player_guess = gets.chomp
#     # increment_guess_count(@guess_count)
#     game_logic(@player_guess)
#   end
#   def create_winning_code
#     colors = ['r', 'r', 'g', 'g', 'b', 'b', 'y', 'y']
#     shuffled_colors = colors.shuffle
#     color_collector = []
#     @winning_code = ""
#     shuffled_colors.each do |color|
#       if color_collector.length < 4
#         color_collector << color
#       end
#     end
#     @winning_code = color_collector.join("")
#   end
# end
# mastermind = Mastermind.new(@guess_count, @winning_code)
# mastermind.welcome_to_mastermind
# mastermind.beginning_user_input











# require 'pry'
# require './lib/printer'
# require './lib/player_guess_matcher'
#
# class Mastermind
#   attr_reader :guess_count
#   # attr_accessor :guess_count
#   def initialize (guess_count = nil, winning_code = nil)
#     @guess_count = 2 #guess_count.nil? ? increment_guess_count : guess_count
#     @winning_code = winning_code.nil? ? create_winning_code : winning_code
#     #ternary - if/els
#     # @player_guess = player_guess
#
#     @instance_of_printer = Printer.new(@winning_code, @guess_count, @player_guess, "25 hours")
#     @instance_of_matcher = PlayerGuessMatcher.new(@winning_code, @player_guess)
#     # binding.pry
#   end
#   def welcome_to_mastermind
#     @instance_of_printer.welcome_message
#   end
#   def beginning_user_input
#     player_input = gets.chomp
#     if player_input == "p" || player_input == "play"
#         Mastermind.new(@guess_count, @winning_code).start_game
#     elsif player_input == "i" || player_input == "instructions"
#         @instance_of_printer.instructions_message
#     else player_input == "q" || player_input == "quit"
#       @instance_of_printer.quit_message
#         exit
#     end
#     # handling_beginning_input
#   end
#   # def handling_beginning_input
#   #   if player_input == "p" || player_input == "play"
#   #       start_game
#   #   elsif player_input == "i" || player_input == "instructions"
#   #       instructions_message
#   #   else player_input == "q" || player_input == "quit"
#   #       return
#   #   end
#   # end
#   def game_logic(player_guess)
#     @guess_count += 1
#     until @guess_count == 1000000
#       if @player_guess == "c" || @player_guess == "cheat"
#         @instance_of_printer.cheat_message
#         Mastermind.new(@guess_count, @winning_code).start_game
#       elsif @player_guess == "q" || @player_guess == "quit"
#         @instance_of_printer.quit_message
#         exit #return was exit start_game method but not the file/class
#       elsif @player_guess.length < 4
#         @instance_of_printer.answer_is_too_short_message
#         Mastermind.new(@guess_count, @winning_code).start_game
#       elsif @player_guess.length > 4
#         @instance_of_printer.answer_is_too_long_message
#         Mastermind.new(@guess_count, @winning_code).start_game
#       elsif @player_guess == @winning_code
#         @instance_of_printer.win_message
#           play_or_quit_input = gets.chomp
#           post_win(play_or_quit_input)
#       else @player_guess != @winning_code
#         @instance_of_matcher.check_player_guess(@player_guess)
#         @instance_of_printer.guess_feedback(@player_guess)
#         # guess_feedback = "'#{player_guess}' has 3 of the correct elements with 2 in the correct positions
#         # You've taken #{@guess_count} guess"
#         # puts guess_feedback
#         @guess_count += 1
#         # increment_guess_count
#         Mastermind.new(@guess_count, @winning_code).start_game
#       end
#     end
#   end
#   def increment_guess_count
#     @guess_count +=1
#   end
#   def post_win(play_or_quit_input)
#     if play_or_quit_input ==  "p" || play_or_quit_input == "play"
#       Mastermind.new.start_game
#     else play_or_quit_input == "q" || play_or_quit_input == "quit"
#       @instance_of_printer.quit_message
#       exit
#     end
#   end
#   def start_game
#     @instance_of_printer.start_game_message
#     @player_guess = gets.chomp
#     @guess_count += 1
#     game_logic(@player_guess)
#   end
#   def create_winning_code
#     colors = ['r', 'r', 'g', 'g', 'b', 'b', 'y', 'y']
#     shuffled_colors = colors.shuffle
#     color_collector = []
#     @winning_code = ""
#     shuffled_colors.each do |color|
#       if color_collector.length < 4
#         color_collector << color
#       end
#     end
#     @winning_code = color_collector.join("")
#   end
# end
# mastermind = Mastermind.new
# # mastermind.create_winning_code #don't need to call this b/c class does this to self
# mastermind.welcome_to_mastermind
# mastermind.beginning_user_input
