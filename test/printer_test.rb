require 'minitest/autorun'
require 'minitest/pride'
require './lib/printer'
require './lib/mastermind'
require 'pry'

class PrinterTest < Minitest::Test
  def test_it_exists
    winning_code = "rgby"
    printer = Printer.new(winning_code)

    assert_instance_of Printer, printer
  end

  def test_handle_guess_singular_or_plural
    # skip
    guess_count = 2
    winning_code = "rgby"
    printer = Printer.new(winning_code)

    assert_equal "guesses", printer.handle_guess_singular_or_plural(guess_count)
  end

  def test_guess_feedback
    winning_code = 'rgyb'
    guess_count = 3
    printer = Printer.new(winning_code)
    player_guess_matcher = PlayerGuessMatcher.new(winning_code, guess_count)
  #
    expected = "'#{player_guess}' has #{@instance_of_matcher.check_number_of_correct_colors(player_guess)} of the correct elements with #{@instance_of_matcher.check_number_of_correct_color_and_position(player_guess)} in the correct positions
    You've taken #{guess_count} #{@guesses_or_guess}"

    assert_equal expected, printer.guess_feedback(player_guess, guess_count)
  end



  def test_game_logic_messages
    game = Game.new
    printer = Printer.new

    assert_equal
  end

  def test_readable_attributes
    mastermind = Mastermind.new
    printer = Printer.new(@winning_code, @guess_count, @player_guess)
    welcome_message = "Welcome to MASTERMIND

    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

    assert_equal welcome_message, printer.welcome_message
  end

  def test_win_message
    winning_code = "rgby"
    printer = Printer.new(winning_code)
    guess_count = 2
    time_message = "4:00"

    assert_output(/Congratulations!/) { printer.win_message(guess_count, time_message) }
  end

  def test_start_game_message
    winning_code = "rgby"
    printer = Printer.new(winning_code)

    assert_output(/I have generated/) { printer.start_game_message }
  end

  def test_instructions_message
    winning_code = "rgvy"
    printer = Printer.new(winning_code)

    assert_output(/You must successfully/) { printer.instructions_message }
  end

  def test_quit_message
    winning_code = "rgby"
    printer = Printer.new(winning_code)

    assert_output(/Exiting.../) { printer.quit_message }
  end

  def test_answer_is_too_long_message
    winning_code = "rgby"
    printer = Printer.new(winning_code)

    assert_output(/ANSWER IS TOO LONG/) { printer.answer_is_too_long_message }
  end

  def test_answer_is_too_short
    winning_code = "rgby"
    printer = Printer.new(winning_code)

    assert_output(/ANSWER IS TOO SHORT!/) { printer.answer_is_too_short_message }
  end

  def test_cheat_message
    winning_code = "rgby"
    printer = Printer.new(winning_code)

    assert_output(/Winning code: #{@winning_code}/) { printer.cheat_message }
  end
end
