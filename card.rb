class Card

  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def points
    if rank == 'A'
      11
    elsif rank.to_i.zero?
      10
    else
      rank.to_i
    end
  end
end
