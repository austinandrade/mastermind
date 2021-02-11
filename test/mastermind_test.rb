require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind.rb'

class MastermindTest < Minitest::Test

  def test_it_exists
    mastermind = Mastermind.new
    assert_instance_of Mastermind, mastermind
  end

  def test_welcome_to_mastermind
    mastermind = Mastermind.new
    welcome_message = "Welcome to MASTERMIND

Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

    assert_output ("Welcome to MASTERMIND\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n") {mastermind.welcome_to_mastermind}
  end

  def test_instructions_message
    mastermind = Mastermind.new

    assert_output ("You must successfully guess the secret code. On each guess, you will learn the number of correct colors guessed as well as the number placed in the correct slots\n") {mastermind.instructions_message}
  end

  def test_create_winning_code
    mastermind = Mastermind.new

    code = "rrgy"

    assert_equal code, mastermind.create_winning_code # maybe look at this later
  end


  def test_start_game
  end


end
