require_relative '../card'

describe Card do
  describe '#points' do
    it 'returns 3' do
       card = Card.new('heart', '3')
      expect(card.points).to eq 3
    end

    it 'returns 10' do
      card = Card.new('heart', 'J')
      expect(card.points).to eq 10
    end

    it 'returns 11' do
      card = Card.new('heart', 'A')
      expect(card.points).to eq 11
    end
  end
end
