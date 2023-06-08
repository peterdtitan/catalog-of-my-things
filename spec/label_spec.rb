require_relative '../label/label'

describe Label do
  subject do
    Label.new('Genre 1', 'black')
  end

  context '#add_item' do
    it 'adds an item to the label\'s collection' do
      new_item = double('item')
      allow(new_item).to receive(:label=)

      subject.add_item(new_item)
      expect(subject.items).to include(new_item)
    end
  end
end
