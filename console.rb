require_relative 'deck.rb'
require_relative 'card.rb'
require_relative 'gamer.rb'
require_relative 'printer.rb'
require_relative 'main.rb'

class Console

  def get_name
    puts 'What is your name?'
    gets.chomp.capitalize
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
