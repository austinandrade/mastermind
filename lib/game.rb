require './lib/printer'
require './lib/player_guess_matcher'

class Game
  def initialize(winning_code)
    @winning_code = create_winning_code
    @guess_count = 0
    @game_over = false
    @instance_of_printer = Printer.new(@winning_code)
    @instance_of_matcher = PlayerGuessMatcher.new(@winning_code)
  end

  def start_game
    start_time
    @instance_of_printer.start_game_message
    @player_guess = gets.chomp
    # @instance_of_printer.player_guess_error_message(@player_guess)
    game_logic(@player_guess)
  end

  def post_win(play_or_quit_input)
    if play_or_quit_input ==  "p" || play_or_quit_input == "play"
      start_game
    else play_or_quit_input == "q" || play_or_quit_input == "quit"
      @instance_of_printer.quit_message
      exit
    end
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
  end

  def game_logic(player_guess)
    while @game_over == false
      if @player_guess == "c" || @player_guess == "cheat"
        @instance_of_printer.cheat_message
      elsif @player_guess == "q" || player_guess == "quit"
        @instance_of_printer.quit_message
        exit
      elsif player_guess_too_short
      elsif @player_guess.length > 4
        @instance_of_printer.answer_is_too_long_message
      elsif @player_guess != @winning_code
        @guess_count += 1
        # @instance_of_printer.player_guess_error_message(@player_guess)
        @instance_of_matcher.check_number_of_correct_colors(@player_guess)
        @instance_of_matcher.check_number_of_correct_color_and_position(@player_guess)
        @instance_of_printer.guess_feedback(@player_guess, @guess_count)
      else @player_guess == @winning_code
        end_time
        @game_over = true
        @instance_of_printer.win_message(@guess_count, @end_time_minutes, @start_time_minutes, @end_time_seconds, @start_time_seconds)
        play_or_quit_input = gets.chomp
        post_win(play_or_quit_input)
        break
      end
      @player_guess = gets.chomp
    end
  end

  def player_guess_too_short
    if @player_guess.length < 4
      @instance_of_printer.answer_is_too_short_message
    end
  end

  def player_guess_cheat
    @player_guess == "c" || @player_guess == "cheat" ? @instance_of_printer.cheat_message : nil
  end
end
