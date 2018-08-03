require_relative 'deck.rb'
require_relative 'card.rb'
require_relative 'gamer.rb'
require_relative 'console.rb'

class Main

  attr_reader :gamer,
              :dealer,
              :bet,
              :interface

  attr_accessor :check,
                :deck

  def initialize
    @gamer = Gamer.new
    @dealer = Gamer.new('Dealer')
    @deck = Deck.new
    @bet = 10
    @check = 0
    @interface = Console.new
  end

  def start
    name = interface.get_name
    gamer.name = name unless name.empty?
    new_hand
  end

  def show_main_menu
    interface.print_main_menu
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
    interface.print_gamer_menu
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
      interface.dealer_skip_turn
      gamer_options_menu
    elsif dealer.points < 17
      dealer.put deck.get
      show_cards
      new_hand
    end
  end

  def new_hand
    refresh_deck
    interface.show_players_bank(gamer.name, gamer.bank, dealer.bank)
    gamer_result
    dealer_result
    interface.show_bet(bet)
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

  def show_gamer_hand
    interface.show_gamer_name(gamer.name)
    gamer.bank -= 10
    if gamer.bank < 0
      interface.bank_zero
    else
      interface.show_gamer_bank(gamer.bank)
    end
    2.times { gamer.put deck.get }
    gamer.cards.each do |card|
      print "#{card.rank}#{card.suit}"
    end
    interface.show_gamer_points(gamer.points)
  end

  def show_dealer_hand
    interface.show_gamer_name(dealer.name)
    dealer.bank -= 10
    2.times { dealer.put deck.get }
    if dealer.bank < 0
      interface.bank_zero
    else
      interface.show_gamer_bank(dealer.bank)
    end
    interface.print_dealer_cards
    puts
  end

  def dealer_result
    return unless dealer.bank <= 0
    interface.print_loser(dealer.name)
    gamer.bank = 100
    dealer.bank = 100
    show_main_menu
  end

  def gamer_result
    return unless gamer.bank <= 0
    interface.print_loser(gamer.name)
    gamer.bank = 100
    dealer.bank = 100
    show_main_menu
  end

  def take_card
    return unless gamer.cards.length == 2
    gamer.put deck.get
    show_cards
    new_hand
  end

  def show_cards
    if gamer.points < 21 && dealer.over?
      interface.print_winner(gamer.name)
      dealer.bank = bet * 2
    elsif gamer.over? || dealer.points > gamer.points
      interface.print_winner(dealer.name)
      dealer.bank = bet * 2
    elsif gamer.points == dealer.points
      interface.print_equal
      gamer.bank += bet
      dealer.bank += bet
    else
      interface.print_winner(gamer.name)
      dealer.bank = bet * 2
    end
    interface.show_results(gamer.name, gamer.points, dealer.points)
    new_hand
  end
end

Main.new.start
