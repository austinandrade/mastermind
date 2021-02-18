require 'pry'
require './lib/printer'
require './lib/player_guess_matcher'
require './lib/game'

class Mastermind
  def initialize
    # @instance_of_game = Game.new
    @instance_of_printer = Printer.new(@winning_code)
  end

  def welcome_to_mastermind
    @instance_of_printer.welcome_message
  end

  def beginning_user_input
    player_input = gets.chomp
    if player_input == "p" || player_input == "play"
        while play_game.start_game == true
          play_game.start_game
        end
    elsif player_input == "i" || player_input == "instructions"
         @instance_of_printer.instructions_message
         while play_game.start_game == true
           play_game.start_game
         end
    else player_input == "q" || player_input == "quit"
      @instance_of_printer.quit_message
        exit
    end
  end
  def play_game
  @game = Game.new
  end

end

mastermind = Mastermind.new
mastermind.play_game
mastermind.welcome_to_mastermind
mastermind.beginning_user_input
