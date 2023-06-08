require_relative '../author/author'

describe Author do

  subject do
    Author.new('Jane', 'Doe')
  end

  context '#initialize' do
    it 'sets the author\'s first name' do
      expect(subject.first_name).to eq('Jane')
    end
  
    it 'sets the author\'s last name' do
      expect(subject.last_name).to eq('Doe')
    end
  end

  context '#add_item' do 
    it 'adds an item to the author\'s items' do
      new_item = double('item')
      allow(new_item).to receive(:author=)
      
      subject.add_item(new_item)
      expect(subject.items).to include(new_item)
    end
  end
  
end