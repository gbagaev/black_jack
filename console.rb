class Console
  LINE = '========================='.freeze
  DASH_LINE = '--------------------'.freeze
  CARD_BACK = "\u{1F0A0} ".freeze

  def get_name
    puts 'What is your name?'
    gets.chomp.capitalize
  end

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

  def show_gamer_points(gamer_points)
    puts
    puts "Points: #{gamer_points}"
    puts LINE
  end

  def show_players_bank(gamer_name, gamer_bank, dealer_bank)
    puts '----------------------'
    puts 'Bank:'
    puts "#{gamer_name} - #{gamer_bank}"
    puts "Dealer - #{dealer_bank}"
    puts '----------------------'
  end

  def show_bet(bet)
    puts
    puts "Bet: #{bet}".rjust(15)
    puts '======================'
  end

  def print_winner(gamer_name)
    puts "#{gamer_name} won!".rjust(50)
  end

  def print_loser(gamer_name)
    puts "#{gamer_name} lose!".rjust(50)
  end

  def print_equal
    puts 'Equal!'.rjust(50)
  end

  def show_results(gamer_name, gamer_points, dealer_points)
    puts "#{gamer_name} - #{gamer_points}".rjust(50)
    puts "Dealer - #{dealer_points}".rjust(50)
  end

  def show_gamer_name(gamer_name)
    puts "#{gamer_name}:"
  end

  def bank_zero
    puts 'Bank - 0'
  end

  def show_gamer_bank(gamer_bank)
    puts "Bank - #{gamer_bank}"
  end
end
