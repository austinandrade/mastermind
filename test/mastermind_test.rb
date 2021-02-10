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


    # assert_equal welcome_message, mastermind.welcome_to_mastermind
    assert_output ("Welcome to MASTERMIND\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n") {mastermind.welcome_to_mastermind}
  end

  def test_instructions_message
    mastermind = Mastermind.new

    # assert_equal "Hey these are instructions can you believe it?!!!!", mastermind.instructions_message
    assert_output ("You must successfully guess the code the secret code. On each guess, you will learn the number of correct colors guessed as well as the number placed in the correct slots\n") {mastermind.instructions_message}

  end


  def test_start_game
  end

# do not need to include tests for methods involving user input
  # def test_beginning_user_input
  #   mastermind = Mastermind.new
  #
  #
  #   user_input = p

  #
  #   assert_equal mastermind.start_game
  # end

end
