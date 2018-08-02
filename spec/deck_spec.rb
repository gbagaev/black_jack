require_relative '../deck'
require_relative '../card'

describe Deck do
  describe '#initialize' do
    it 'generates 52 card' do
      deck = Deck.new
      expect(deck.deck.length).to eq 52
    end

    it 'has type card' do
      deck = Deck.new
      expect(deck.deck[0]).to be_a Card
    end

    describe '#get' do
      it 'has type card' do
        deck = Deck.new
        expect(deck.get).to be_a Card
      end

      it 'has 51 card' do
        deck = Deck.new
        deck.get
        expect(deck.deck.length).to eq 51
      end
    end
  end
end
