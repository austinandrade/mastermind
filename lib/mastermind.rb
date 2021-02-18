require 'pry'
require './lib/printer'
require './lib/player_guess_matcher'
require './lib/game'

class Mastermind
  def initialize
    @instance_of_game = Game.new(@winning_code)
    @instance_of_printer = Printer.new(@winning_code)
  end
  def welcome_to_mastermind
    @instance_of_printer.welcome_message
  end
  def beginning_user_input
    player_input = gets.chomp
    if player_input == "p" || player_input == "play"
    elsif player_input == "i" || player_input == "instructions"
        @instance_of_printer.instructions_message
    else player_input == "q" || player_input == "quit"
      @instance_of_printer.quit_message
        exit
    end
  end

  def start_time
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  starty_time = []
  stary_time << start_time
  starty_time
  end

  def end_time
  end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  endy_time = []
  endy_time << end_time
  endy_time
  end

  def total_time
  unrounded_time = end_time[0] - start_time[0]
  seconds = total_time % 60
  minutes = (seconds / 60) % 60
  seconds_rounded = seconds.round(1)
  minutes_rounded = minutes.floor(1)
  unrounded_time
  end


end

mastermind = Mastermind.new
mastermind.welcome_to_mastermind
mastermind.beginning_user_input
