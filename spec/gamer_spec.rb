require_relative '../gamer'
require_relative '../card'

describe Gamer do
  describe '#put' do
    it 'saves a card' do
      gamer = Gamer.new
      card = Card.new('diamond', '2')
      expect { gamer.put card }.to change(gamer.cards, :length).by 1
    end
  end

  describe '#points' do
    it 'returns sum of all cards points' do
      gamer = Gamer.new
      card1 = Card.new('diamond', '4')
      card2 = Card.new('spade', 'A')
      card3 = Card.new('spade', 'J')
      gamer.put card1
      gamer.put card2
      gamer.put card3
      expect(gamer.points).to eq 15
    end

    it 'returns sum of all cards when A is 1' do
      gamer = Gamer.new
      card1 = Card.new('diamond', '4')
      card2 = Card.new('spade', 'J')
      card3 = Card.new('spade', 'A')
      gamer.put card1
      gamer.put card2
      gamer.put card3
      expect(gamer.points).to eq 15
    end

    it 'returns sum of all cards when A is 1' do
      gamer = Gamer.new
      card1 = Card.new('diamond', '9')
      card2 = Card.new('spade', 'J')
      card3 = Card.new('spade', 'A')
      card4 = Card.new('spade', 'J')
      gamer.put card1
      gamer.put card2
      gamer.put card3
      gamer.put card4
      expect(gamer.points).to eq 30
    end
  end

  describe '#over?' do
    it 'returns true' do
      gamer = Gamer.new
      card1 = Card.new('diamond', 'J')
      card2 = Card.new('spade', '9')
      card3 = Card.new('spade', 'J')
      gamer.put card1
      gamer.put card2
      gamer.put card3
      expect(gamer.over?).to eq true
    end

    it 'returns false' do
      gamer = Gamer.new
      card1 = Card.new('diamond', '4')
      card2 = Card.new('spade', 'J')
      card3 = Card.new('spade', 'A')
      gamer.put card1
      gamer.put card2
      gamer.put card3
      expect(gamer.over?).to eq false
    end
  end
end
