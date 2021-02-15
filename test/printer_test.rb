require 'minitest/autorun'
require 'minitest/pride'
require './lib/printer'
require './lib/mastermind'
require 'pry'

class PrinterTest < Minitest::Test
  def test_it_exists
    mastermind = Mastermind.new
    printer = Printer.new(@winning_code, @guess_count, @player_guess)

    assert_instance_of Printer, printer
  end

  def test_handle_guess_singular_or_plural
    guess_count = 2
    printer = Printer.new(@winning_code, @guess_count, @player_guess)

    assert_equal "guesses", printer.handle_guess_singular_or_plural(guess_count)
  end
  #
  # def test_guess_feedback
  #   player_guess = 'rgyb'
  #   guess_count = 3
  #   printer = Printer.new(@winning_code, @guess_count, @player_guess)
  #
  #
  #   expected = "'#{player_guess}' has #{@instance_of_matcher.check_number_of_correct_colors(player_guess)} of the correct elements with #{@instance_of_matcher.check_number_of_correct_color_and_position(player_guess)} in the correct positions
  #   You've taken #{guess_count} #{@guesses_or_guess}"
  #
  #   assert_equal expected, printer.guess_feedback(player_guess, guess_count)


  end



  def test_readable_attributes
    mastermind = Mastermind.new
    printer = Printer.new(@winning_code, @guess_count, @player_guess)
    welcome_message = "Welcome to MASTERMIND

    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

    assert_equal welcome_message, printer.welcome_message
  end
end
