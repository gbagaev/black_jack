require_relative 'deck.rb'
require_relative 'card.rb'
require_relative 'gamer.rb'
require_relative 'printer.rb'

class Main
  include Printer

  attr_reader :gamer,
              :dealer,
              :bet

  attr_accessor :check,
                :deck

  def initialize
    @gamer = Gamer.new
    @dealer = Gamer.new
    @deck = Deck.new
    @bet = 10
    @check = 0
  end

  def start
    get_name
    new_hand
  end

  def get_name
    puts 'What is your name?'
    gamer.name = gets.chomp.capitalize
    gamer.name = 'Mister X' if gamer.name == ''
  end

  def show_main_menu
    print_main_menu
    main_menu_options
  end

  def main_menu_options
    command = gets.chomp
    case command
    when '1' then start
    when '2' then exit
    else
      puts "Command #{command} is incorrect!"
      main_menu_options
    end
  end

  def gamer_options_menu
    print_gamer_menu
    gamer_options
  end

  def gamer_options
    options = gets.chomp
    case options
    when '1' then skip_move
    when '2' then take_card
    when '3' then show_cards
    when '0' then show_main_menu
    else
      puts "Command #{options} is incorrect!"
      gamer_options
    end
  end

  def skip_move
    if check == 1
      show_cards
    elsif gamer.cards.count > 2 || dealer.cards.count > 2
      show_cards
      new_hand
    else
      dealers_turn
    end
  end

  def dealers_turn
    self.check += 1
    if dealer.points >= 17
      dealer_skip_turn
      gamer_options_menu
    elsif dealer.points < 17
      dealer.put deck.get
      show_cards
      new_hand
    end
  end

  def new_hand
    refresh_deck
    show_players_bank
    gamer_result
    dealer_result
    show_bet
    show_gamer_hand
    show_dealer_hand
    gamer_options_menu
  end

  def refresh_deck
    gamer.cards = []
    dealer.cards = []
    gamer.points = 0
    dealer.points = 0
    self.deck = Deck.new
  end

  def show_players_bank
    puts '----------------------'
    puts 'Bank:'
    puts "#{gamer.name} - #{gamer.bank}"
    puts "Dealer - #{dealer.bank}"
    puts '----------------------'
  end

  def show_bet
    puts
    puts "Bet: #{bet}".rjust(15)
    puts '======================'
  end

  def show_gamer_hand
    puts "#{gamer.name}:"
    gamer.bank -= 10
    if gamer.bank < 0
      puts "Bank - 0"
    else
      puts "Bank - #{gamer.bank}"
    end
    2.times { gamer.put deck.get }
    gamer.cards.each do |card|
      print "#{card.rank}#{card.suit}"
    end
    show_gamer_points
  end

  def show_dealer_hand
    puts 'Dealer:'
    dealer.bank -= 10
    2.times { dealer.put deck.get }
    if dealer.bank < 0
      puts "Bank - 0"
    else
      puts "Bank - #{dealer.bank}"
    end
    print_dealer_cards
    puts
  end

  def dealer_result
    return unless dealer.bank <= 0
    puts 'Dealer lose!'.rjust(50)
    gamer.bank = 20
    dealer.bank = 20
    show_main_menu
  end

  def gamer_result
    return unless gamer.bank <= 0
    puts "#{gamer.name} lose!".rjust(50)
    gamer.bank = 20
    dealer.bank = 20
    show_main_menu
  end

  def take_card
    return unless gamer.cards.length == 2
    gamer.put deck.get
    show_cards
    new_hand
  end

  def show_results
    puts "Dealer - #{dealer.points}".rjust(50)
    puts "#{gamer.name} - #{gamer.points}".rjust(50)
  end

  def show_cards
    if gamer.points < 21 && dealer.over?
      puts "#{gamer.name} won!".rjust(50)
      2.times { gamer.bank += bet }
    elsif gamer.over? || dealer.points > gamer.points
      puts 'Dealer won!'.rjust(50)
      2.times { dealer.bank += bet }
    elsif gamer.points == dealer.points
      puts 'Equal!'.rjust(50)
      gamer.bank += bet
      dealer.bank += bet
    else
      puts "#{gamer.name} won!".rjust(50)
      2.times { gamer.bank += bet }
    end
    show_results
    new_hand
  end
end

Main.new.start
