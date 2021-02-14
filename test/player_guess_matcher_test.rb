require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind.rb'
require './lib/printer'
require './lib/player_guess_matcher'
require 'pry'

class PlayerGuessMatcherTest < Minitest::Test
  # def test_it_exists
  #   # guess_count = 1
  #   # winning_code = 'gryb'
  #   # player_guess = 'rryg'
  #   # mastermind = Mastermind.new(guess_count, winning_code)
  #   player_guess_matcher = PlayerGuessMatcher.new(winning_code, player_guess)
  #   binding.pry
  #   assert_instance_of PlayerGuessMatcher, player_guess_matcher
  # end

  def test_readable_attributes
    # mastermind = Mastermind.new
    player_guess_matcher = PlayerGuessMatcher.new(@winning_code, @player_guess)

    assert_equal @winning_code, player_guess_matcher.winning_code
  end

  def test_check_number_of_correct_colors

    winning_code = 'ygry'
    player_guess = 'bryg'

    mastermind = Mastermind.new(@guess_count, winning_code)
    player_guess_matcher = PlayerGuessMatcher.new(winning_code, player_guess)

    assert_equal 3, player_guess_matcher.check_player_guess(player_guess)
  end

  def test_check_number_of_correct_color_and_position

  end
end
