require 'minitest/autorun'
require 'minitest/pride'
require './lib/printer'
require './lib/mastermind'
require 'pry'

class PrinterTest < Minitest::Test
  def test_it_exists
    mastermind = Mastermind.new
    printer = Printer.new(@winning_code, @guess_count, @player_guess, "25 hours")

    assert_instance_of Printer, printer
  end

  def test_readable_attributes
    mastermind = Mastermind.new
    printer = Printer.new(@winning_code, @guess_count, @player_guess, "25 hours")
    welcome_message = "Welcome to MASTERMIND

    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

    assert_equal welcome_message, printer.welcome_message
  end
end
