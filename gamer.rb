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
    @bank = 20
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

# class Gamer
#
#   attr_accessor :cards,
#                 :points,
#                 :ace_count,
#                 :bank,
#                 :name
#
#   def initialize(name = '')
#     @cards = []
#     @points = 0
#     @ace_count = 0
#     @bank = 20
#     @name = name
#   end
#
#   def put(card)
#     self.ace_count += 1 if card.rank == 'A'
#     self.points += card.points
#     cards << card
#     calculate_points
#   end
#
#   def over?
#     points > 21
#   end
#
#   private
#
#   def calculate_points
#     if over?
#       ace_count.times do
#         self.points -= 10
#         self.ace_count -= 1
#       end
#     end
#   end
# end
