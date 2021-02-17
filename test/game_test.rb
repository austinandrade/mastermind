require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'
require './lib/printer'
# require './lib/player_guess_matcher'
require 'pry'

class MastermindTest < Minitest::Test
  def test_post_win
    mastermind = Game.new
    sandwich = mastermind.post_win("p")
    assert_equal true, sandwich
  end





end
