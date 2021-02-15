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
        @instance_of_game.start_game
    elsif player_input == "i" || player_input == "instructions"
        @instance_of_printer.instructions_message
    else player_input == "q" || player_input == "quit"
      @instance_of_printer.quit_message
        exit
    end
  end
end

mastermind = Mastermind.new
mastermind.welcome_to_mastermind
mastermind.beginning_user_input
