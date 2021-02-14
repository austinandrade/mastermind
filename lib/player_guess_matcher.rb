require 'pry'
# require './lib/mastermind'
# require './lib/player_guess_matcher'
class PlayerGuessMatcher
  attr_accessor :guess_count, :player_guess, :number_of_correct_colors
  attr_reader :winning_code
  def initialize(winning_code, guess_count)
    @winning_code = winning_code
    @guess_count = guess_count
    @player_guess = player_guess
    @number_of_correct_colors = 0
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
      @number_of_correct_colors += player_guess_array_uniq.count(winning_code) # switch around uniq arrays to change logic for @number_of_correct_colors
        # counter += 1
      #  binding.pry #<-- this is working!
    end
      @number_of_correct_colors
  end
  def check_number_of_correct_color_and_position(player_guess)
    number_of_correct_positions = 0
    @player_guess_array.zip(@winning_code_array).map { |a, b| number_of_correct_positions += 1 if a == b }
    #binding.pry # <-- this is working!
    return number_of_correct_positions
  end
end
