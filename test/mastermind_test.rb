require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'
require './lib/printer'
# require './lib/player_guess_matcher'
require 'pry'

class MastermindTest < Minitest::Test

  def test_it_exists
    # skip
    mastermind = Mastermind.new(@guess_count, @winning_code)
    assert_instance_of Mastermind, mastermind
  end

  def test_it_has_guess_count
    skip
    mastermind = Mastermind.new(@guess_count, @winning_code)
    # binding.pry
  end

  def test_it_has_a_4_letter_code
    # skip
    mastermind = Mastermind.new(@guess_count, @winning_code)
    assert_equal 4, mastermind.create_winning_code.length
<<<<<<< HEAD
=======
    # come back to this
>>>>>>> 81ea868ea2dba0407b59254f422f68cb3e3fd281
  end

  def test_it_can_print_welcome_message
    # skip
    mastermind = Mastermind.new(@guess_count, @winning_code)
<<<<<<< HEAD

    assert_output(/MASTERMIND/) { mastermind.welcome_to_mastermind }
  end

  def test_it_has_increment_guess_count
    # skip
    mastermind = Mastermind.new(@guess_count, @winning_code)
    assert_equal 0, mastermind.guess_count
  end


=======

    assert_output(/MASTERMIND/) { mastermind.welcome_to_mastermind }
  end
>>>>>>> 81ea868ea2dba0407b59254f422f68cb3e3fd281

  def test_it_has_increment_guess_count
    # skip
    mastermind = Mastermind.new(@guess_count, @winning_code)
    assert_equal 0, mastermind.guess_count
  end

  # write tests for Time methods?
end
