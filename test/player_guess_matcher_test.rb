require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind.rb'
require './lib/printer'
require './lib/player_guess_matcher'
require 'pry'

class PlayerGuessMatcherTest < Minitest::Test
  def test_it_exists
    guess_count = 1
    winning_code = 'gryb'

    player_guess_matcher = PlayerGuessMatcher.new(winning_code, guess_count)

    assert_instance_of PlayerGuessMatcher, player_guess_matcher
  end

  def test_readable_attributes
    player_guess_matcher = PlayerGuessMatcher.new(@winning_code, @guess_count)

    assert_equal @winning_code, player_guess_matcher.winning_code
  end

  def test_check_number_of_correct_colors
    @winning_code = 'ygry'
    @player_guess = 'bryg'

    mastermind = Mastermind.new
    player_guess_matcher = PlayerGuessMatcher.new(@winning_code, @player_guess)

    assert_equal 4, player_guess_matcher.check_number_of_correct_colors(@player_guess, @winning_code)
  end

  def test_check_number_of_correct_color_and_position
    @winning_code = 'bgry'
    @player_guess = 'brrg'

    @winning_code_array = ['b', 'g', 'r', 'y']
    @player_guess_array = ['b', 'r', 'r', 'g']

    mastermind = Mastermind.new
    player_guess_matcher = PlayerGuessMatcher.new(@winning_code_array, @player_guess_array)

    assert_equal 2, player_guess_matcher.check_number_of_correct_color_and_position(@player_guess)
  end
end
