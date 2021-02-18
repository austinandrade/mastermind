require 'pry'
class PlayerGuessMatcher
  attr_reader :winning_code
  def initialize(player_guess, winning_code)
    @player_guess = player_guess
    @winning_code = winning_code
    @number_of_correct_colors = 0
    # @new_end_time = end_time / (24 * 60 * 60.0)
    # @new_start_time = start_time / (24 * 60 * 60.0)
  end
  # def set_player_guess_winning_code_to_arrays(winning_code, player_guess)
  # end
  def check_number_of_correct_colors(player_guess, winning_code)
    @winning_code_array = [] # tried to seperate line 16 - 27 into new method. other methods can't read the variables??
    @winning_code.chars.each do |color|
      @winning_code_array << color
    end
    @player_guess_array = []
    player_guess.chars.each do |color|
      @player_guess_array << color
    end
    winning_code_array_uniq = @winning_code_array.uniq
    player_guess_array_uniq = @player_guess_array.uniq
    winning_code_array_uniq.each do |winning_code|
      if @number_of_correct_colors < 4 # just added this if statement, need to work more on this. not subtracting from number_of_correct_colors when user input guesses less correct colors
        @number_of_correct_colors += player_guess_array_uniq.count(winning_code) # switch around uniq arrays to change logic for @number_of_correct_colors
      else @number_of_correct_colors > 4
        @number_of_correct_colors -= player_guess_array_uniq.count(winning_code) # switch around uniq arrays to change logic for @number_of_correct_colors
      end
    end
    @number_of_correct_colors
  end
  def check_number_of_correct_color_and_position(player_guess)
    number_of_correct_positions = 0
    if number_of_correct_positions < 4
      @player_guess_array.zip(@winning_code_array)
      .map { |a, b| number_of_correct_positions += 1 if a == b }
    end
    return number_of_correct_positions
  end
end
