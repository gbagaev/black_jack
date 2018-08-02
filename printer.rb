module Printer

  LINE = '========================='.freeze
  DASH_LINE = '--------------------'.freeze
  CARD_BACK = "\u{1F0A0} ".freeze

  def print_main_menu
    puts 'Available options:'
    puts LINE
    puts '1. Start_the_game'
    puts '2. Exit'
    puts LINE
    puts 'Enter the command number:'
  end

  def print_gamer_menu
    puts 'Available options:'
    puts LINE
    puts '1. Skip_move'
    puts '2. Take_card'
    puts '3. Show_cards'
    puts LINE
    puts '0. Return to main menu'
    puts LINE
    puts 'Enter the command number:'
  end

  def dealer_skip_turn
    puts 'Dealer let the move go. Your turn.'.rjust(70)
    puts
  end

  def print_dealer_cards
    2.times { print CARD_BACK }
    puts
    puts LINE
  end

  def show_gamer_points
    puts
    puts "Points: #{gamer.points}"
    puts LINE
  end
end
