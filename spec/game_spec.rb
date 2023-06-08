require_relative '../game/game'

describe Game do
  let(:multiplayer) { true }
  let(:last_played_at) { '2022/03/30' }
  let(:publish_date) { '2010/01/01' }

  subject do
    Game.new(multiplayer, publish_date, last_played_at: last_played_at, archived: true)
  end

  context '#initialize' do
    it 'sets the multiplayer flag' do
      expect(subject.multiplayer).to eq(multiplayer)
    end

    it 'sets the last played at time' do
      expect(subject.last_played_at).to eq(last_played_at)
    end

    it 'sets the publish date' do
      expect(subject.publish_date).to eq(publish_date)
    end
  end

  context '#can_be_archived?' do
    it 'returns true if the item is older than 2 years and parent can be archived' do
      subject.last_played_at = '2020/03/02'
      expect(subject.can_be_archived?).to eq true
    end
  end
end
