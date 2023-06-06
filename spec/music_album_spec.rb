
describe MusicAlbum do
  subject do
    MusicAlbum.new
  end

  context '#can_be_archived?' do
    it 'should return true when the album is on spotify' do
      subject.on_spotify = true
      expect(subject.can_be_archived?).to eq true
    end
    it 'should return false when parent method returns false and album is not on spotify' do
      subject.on_spotify = false
      expect(subject.can_be_archived?).to eq false
    end
  end
end
