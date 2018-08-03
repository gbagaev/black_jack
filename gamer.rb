require_relative 'deck.rb'
require_relative 'card.rb'

class Gamer

  attr_accessor :cards,
                :points,
                :ace_count,
                :bank,
                :name

  def initialize(name = 'Mister X')
    @cards = []
    @points = 0
    @bank = 100
    @name = name
  end

  def put(card)
    self.points += 10 if points < 12 && card.rank == 'A' && cards.size == 2
    self.points += card.points
    cards << card
  end

  def over?
    points > 21
  end
end
