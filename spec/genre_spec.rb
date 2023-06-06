require_relative '../Genre/genre'

describe Genre do
  subject do
    Genre.new 'Genre 1'
  end

  context "#add_item" do
    it 'adds an item to its collection' do
      new_item = double('item')
      subject.add_item(new_item)
      expect(subject.items).to include(new_item)
    end
  end
end
