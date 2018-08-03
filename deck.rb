require_relative 'card.rb'

class Deck

  HEART   = "\u{2660} ".freeze
  DIAMOND = "\u{2663} ".freeze
  CLUB    = "\u{2665} ".freeze
  SPADE   = "\u{2666} ".freeze

  SUITS   = [HEART, DIAMOND, CLUB, SPADE].freeze
  RANKS   = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  attr_reader :deck#, :card

  def initialize
    @deck = generate
  end

  def get
    @deck.delete_at(rand(@deck.length))
  end

  private

  def generate
    deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        deck << Card.new(suit, rank)
      end
    end
    deck
  end
end
