require './lib/mastermind'
require './lib/printer'

class MastermindTest < Minitest::Test
  def test_it_exists
    # skip
    mastermind = Mastermind.new(@guess_count, @winning_code)
    assert_instance_of Mastermind, mastermind
  end

  def test_welcome_to_mastermind
    mastermind = Mastermind.new
    assert_output(/MASTERMIND/) { mastermind.welcome_to_mastermind }
  end

  def test_play_game
    mastermind = Mastermind.new
    assert_equal Game.new, mastermind.play_game
  end
end
