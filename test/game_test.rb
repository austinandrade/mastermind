require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'
require './lib/printer'
# require './lib/player_guess_matcher'
require 'pry'
class GameTest < Minitest::Test
  def test_post_win
    skip
    game = Game.new
    sandwich = mastermind.post_win("p")
    assert_equal true, sandwich
  end

  def test_it_has_attributes
    game = Game.new
    assert_equal 0, game.guess_count
    assert_equal false, game.game_over
    assert_nil game.start_time
    assert_nil  game.end_time
    # binding.pry
  end

  def test_winning_code_length
    game = Game.new
    assert_equal 4, game.create_winning_code.length
  end

  def test_set_start_time
    skip
    game = Game.new
    assert_equal Time.now, game.set_start_time
  end

  def test_set_end_time
    skip
    game = Game.new
    assert_equal rex, game.set_end_time
  end

  def test_time_elapsed
    game = Game.new
    game.start_time
    game.end_time
    assert_equal (@end_time - @start_time), game.time_elapsed
  end
end
