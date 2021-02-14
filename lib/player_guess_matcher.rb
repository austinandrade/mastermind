require 'pry'
# require './lib/mastermind'
# require './lib/player_guess_matcher'
require './lib/printer'

class PlayerGuessMatcher
  attr_accessor :guess_count, :player_guess, :number_of_correct_colors
  attr_reader :winning_code, :seconds, :minutes
  def initialize(winning_code, guess_count)
    @winning_code = winning_code
    @guess_count = guess_count
    @player_guess = player_guess
    @number_of_correct_colors = 0
    # @new_end_time = end_time / (24 * 60 * 60.0)
    # @new_start_time = start_time / (24 * 60 * 60.0)
  end

  def check_number_of_correct_colors(player_guess)

    @winning_code_array = []
    @winning_code.chars.each do |color| # transform "winning_code"(string) into [winning_code](array)
      @winning_code_array << color
      #binding.pry #<-- this is working - @winning_code_array is good to go
    end

    @player_guess_array = []
    player_guess.chars.each do |color| # transform "player_guess"(string) into [player_guess](array)
      @player_guess_array << color
      #binding.pry <-- this is working - @player_guess_array is good to go
    end

    winning_code_array_uniq = @winning_code_array.uniq
    player_guess_array_uniq = @player_guess_array.uniq


      winning_code_array_uniq.each do |winning_code|
        if @number_of_correct_colors < 4 # just added this if statement, need to work more on this. not subtracting from number_of_correct_colors when user input guesses less correct colors
          @number_of_correct_colors += player_guess_array_uniq.count(winning_code) # switch around uniq arrays to change logic for @number_of_correct_colors
        else player_guess_array_uniq.join.include?(winning_code)
          @number_of_correct_colors -= player_guess_array_uniq.count(winning_code) # switch around uniq arrays to change logic for @number_of_correct_colors
        end
        # counter += 1
      #  binding.pry #<-- this is working!
    end
      @number_of_correct_colors
  end

  def check_number_of_correct_color_and_position(player_guess)
    number_of_correct_positions = 0

    if number_of_correct_positions < 4
      @player_guess_array.zip(@winning_code_array).map { |a, b| number_of_correct_positions += 1 if a == b }
    end
    #binding.pry # <-- this is working!
    return number_of_correct_positions
  end

  def start_time
    start = Time.now.to_f
    # start_time_seconds_array = []
    # start_time = Process.clock_gettime(Process::CLOCK_REALTIME, :second)
    # # start_time_second = start_time.sec
    # start_time_seconds_array << start_time

    # Process.clock_gettime(Process::CLOCK_REALTIME, :nanosecond)
    # return start_time_var
    # @new_start_time = start_time / (24 * 60 * 60.0)
  end

  def end_time
    finish = Time.now.to_f
    # end_time_seconds_array = []
    # end_time = Process.clock_gettime(Process::CLOCK_REALTIME, :second)
    # # end_time_second = end_time.sec
    # end_time_seconds_array << end_time

    #Process.clock_gettime(Process::CLOCK_REALTIME, :nanosecond)
    # @new_end_time = end_time / (24 * 60 * 60.0)
    # return end_time_var
  end
  #
  def game_time
    @seconds = (end_time - start_time) % 60
    @minutes = (((end_time - start_time) / 60) % 60).to_i
    # binding.pry
    # end_time[0] - start_time[0]
  end
end













# number_of_correct_positions = 0
#
# if @player_guess_array[0] == @winning_code_array[0]
#   number_of_correct_positions += 1
# elsif @player_guess_array[1] == @winning_code_array[1]
#   number_of_correct_positions += 1
# elsif @player_guess_array[2] == @winning_code_array[2]
#   number_of_correct_positions += 1
# else @player_guess_array[3] == @winning_code_array[3]
#   number_of_correct_positions += 1
#   # binding.pry
#
# end



# def grab_player_guess(player_guess)
#   @player_guess = player_guess
#   puts @player_guess
#   binding.pry
# end

#   @number_of_correct_colors = 0
#   @winning_code_array.each do |winning_color|
#     @player_guess_array.each do |player_color|
#     if player_color.include?(winning_color)
#       @number_of_correct_colors +=1
#   end













# require 'pry'
# require './lib/mastermind'
#
# class PlayerGuessMatcher
#   attr_accessor :guess_count, :player_guess
#   attr_reader :winning_code, :number_of_correct_colors
#   def initialize(winning_code, guess_count)
#     @winning_code = winning_code
#     @player_guess = player_guess
#     @guess_count = guess_count
#   end
#   def check_player_guess(player_guess)
#     # @winning_code_array = []
#     # @winning_code.chars.each do |color| # transform "winning_code"(string) into [winning_code](array)
#     #   @winning_code_array << color
#     # end
#     #
#     # @player_guess_array = []
#     # @player_guess.chars.each do |color| # transform "player_guess"(string) into [player_guess](array)
#     #   @player_guess_array << color
#     # end
#     #
#     # @number_of_correct_colors = 0
#     # @player_guess_array.each do |player_color|
#     #   @winning_code_array.each do |winning_color|
#     #     if winning_color == player_color
#     #       @number_of_correct_colors += 1
#     #     end
#     #   end
#   end
# end
