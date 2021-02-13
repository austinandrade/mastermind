require 'pry'
# require './lib/mastermind'
class PlayerGuessMatcher
  attr_accessor :guess_count, :player_guess
  attr_reader :winning_code, :number_of_correct_colors
  def initialize(winning_code, guess_count)
    @winning_code = winning_code
    @guess_count = guess_count
    @player_guess = player_guess

  end
  # def check_player_guess(winning_code, player_guess)
  #
  #   @winning_code_array = []
  #   @winning_code.chars.each do |color| # transform "winning_code"(string) into [winning_code](array)
  #     @winning_code_array << color
  #   end
  #
  #   @player_guess_array = []
  #   @player_guess.chars.each do |color| # transform "player_guess"(string) into [player_guess](array)
  #     @player_guess_array << color
  #   end
  #
  #   @number_of_correct_colors = 0
  #   @player_guess_array.each do |player_color|
  #     @winning_code_array.each do |winning_color|
  #       if winning_color == player_color
  #         @number_of_correct_colors += 1
  #       end
  #     end
    end
